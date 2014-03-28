" Maintainer:  Mark J. Lorenz <markjlorenz@gmail.com>
" URL:         https://github.com/dapplebeforedawn/vim-typing-practice
" License:     MIT
"
" if g:typing_practice_stats_file is defined, everytime you run this plugin
" your stats will be appended in a space delimited format:
"     filename date text_length duration chars_per_min wasted_chars error_rate
function! s:TypingPractice()
  exec '1'

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

  imap <buffer> <cr> <c-o>:call CheckBuffer()<cr>
  imap <buffer> <bs> <bs><c-o>:call CharWasted()<cr>

  exec 'startinsert'
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
     "play the bell
    normal \<Esc>
    echo status
    exec 'norm 0D'
  else
    put ='' " do the <cr> we were trying to do
  endif

  if line('.') == t:source_lines
    let _ = s:RecordStats()
    let _ = s:DisplayStats()
  end
endfunction

function! s:GetReleventLines()
  exec bufwinnr(t:typing_buf) 'wincmd w'
  let typing_line = line(".")
  let lines = getbufline(t:source_buf, 1, typing_line)
  return join(lines, "\n")."\n"
endfunction

function! s:RecordStats()
  exec bufwinnr(t:source_buf) 'wincmd w'
  if !exists('g:typing_practice_stats_file')
    return
  endif
  let date     = system('date -u +"%Y-%m-%dT%H:%M:%SZ" | tr -d "\n" ') " e.g.2014-03-28T16:00:44Z
  let filepath = expand('%:p')
  let line     = filepath.' '.date.' '.s:Duration().' '.s:CharPerMin().' '.t:wasted_chars.' '.s:TextLength().' '.s:ErrorRate()."\n"
  let    _     = system('cat - >> '.g:typing_practice_stats_file, line)
endfunction

function! s:DisplayStats()
  exec bufwinnr(t:typing_buf) 'wincmd w'
  put =''
  execute 'normal! '.winwidth(0).'i-'
  put ='STATS:'
  put ='Text chars:       '.s:TextLength()
  put ='Time To Complete: '.s:Duration().'(s)'
  put ='Chars per min:    '.s:CharPerMin()
  put ='Wasted chars:     '.t:wasted_chars
  put ='Error rate:       '.s:ErrorRate().'%'
  execute 'stopinsert'
endfunction

function! s:CharPerMin()
  return printf('%01.2f', 1.0 * s:TextLength() / s:Duration() * 60)
endfunction

function! s:ErrorRate()
  return printf('%01.2f', 100.0 * t:wasted_chars / s:TextLength() / 2)
endfunction

function! s:TextLength()
  return line2byte(line('$'))
endfunction

function! s:Duration()
  let end_time = localtime()
  return end_time - t:start_time
endfunction

command! TypingPractice call s:TypingPractice()
