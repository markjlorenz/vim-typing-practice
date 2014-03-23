# TypingPractice

A little VIM script to help programmers practice typing.

## TL;DR
![https://github.com/dapplebeforedawn/vim-typing-practice/raw/master/demo.gif](https://github.com/dapplebeforedawn/vim-typing-practice/raw/master/demo.gif)

## Usage
```vim
:TypingPractice
```

## Installation
I recommend vundle, in your `~/.vimrc`:
```
Bundle 'dapplebeforedawn/vim-typing-practice'
```
and then you can `:BundleInstall`

## Included Samples
An example exercise for ruby is included `ruby-practice.rb`.  You try it out by just opening `ruby-practice.rb` and starting `:TypingPractice`.

I'd love to have samples for more languages.

## Motivation
I'm probably the worst typist ever.  I just want to rush in and type much faster than I'm able to.  This results in lots of errors, and back-spacing.  Well, dammit, it's time to slow down and build the right muscle memory.

This little script is inspired by http://typing.io, which is a cool little site.  Using it I realized that I _really_ suck at typing ruby's symbols, and the exercises in typing.io weren't focused enough on those.  So this script is designed to give you targeted practice with the particular finger gymnastics of your language.
