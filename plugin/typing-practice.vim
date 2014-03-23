function! s:TypingPractice()
  let t:start_time = localtime()
  let t:wasted_chars = 0
  let t:source_buf = bufnr('%')
  let t:source_lines = line('$') + 1
  let source_win = bufwinnr(t:source_buf)
  set scrollbind

  belowright new
  exec 'resize' 10
  setlocal bufhidden=wipe buftype=nofile
  setlocal noswapfile nowrap

  let t:typing_buf = bufnr('%')
  let typing_win = bufwinnr(t:typing_buf)
  set scrollbind

  imap <cr> <c-o>:call CheckBuffer()<cr>
  imap <bs> <bs><c-o>:call CharWasted()<cr>
endfunction

function! CharWasted()
  let t:wasted_chars += 2
endfunction

function! CheckBuffer()
  let temp_source_file = tempname()
  let temp_typing_file = tempname()

  let relevent_lines = s:GetReleventLines()

  exec bufwinnr(t:typing_buf) 'wincmd w'
  exe 'w '.temp_typing_file

  let status = system('diff - '.temp_typing_file, relevent_lines)
  if v:shell_error "the diff was not empty, no <cr> for you!
    echo status
  else
    put ='' " do the <cr> we were trying to do
  endif

  let _ = s:DisplayStats()
endfunction

function! s:GetReleventLines()
  exec bufwinnr(t:typing_buf) 'wincmd w'
  let typing_line = line(".")
  let lines = getbufline(t:source_buf, 1, typing_line)
  return join(lines, "\n")."\n"
endfunction

function! s:DisplayStats()
  if line('.') != t:source_lines
    return
  endif

  let duration = s:ComputeDuration()
  exec bufwinnr(t:typing_buf) 'wincmd w'
  put =''
  execute 'normal! '.winwidth(0).'i-'
  put ='STATS:'
  put ='Time To Complete: '.duration.'(s)'
  put ='Chars per min:    '.(line2byte(line('$')) / duration * 60)
  put ='Wasted chars:     '.t:wasted_chars
  execute 'stopinsert'
endfunction

function! s:ComputeDuration()
  let end_time = localtime()
  return end_time - t:start_time
endfunction

command! TypingPractice call s:TypingPractice()
