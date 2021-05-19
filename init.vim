" I don't like to reach for escape
inoremap fj <Esc>

" some global vars that might differ from machine to machine...
let g:rwt_blog = '~/Documents/ghio_pages'

" General settings for defaults
set nocompatible
let mapleader = "-"
let localmapleader = "\\"
set hidden
set nohlsearch
set noincsearch
set visualbell
set relativenumber
set encoding=utf8
set textwidth=0
set noexpandtab
set softtabstop=0
set shiftwidth=0
setglobal fileencoding=utf8
let g:markdown_folding = 1

" some global mappings....
nnoremap <leader>ev :edit $MYVIMRC<cr>

" some setup for blog posts
" Easy access to blog post directories
cabbrev <expr> bd@ g:rwt_blog .. '/_drafts'
cabbrev <expr> bp@ g:rwt_blog .. '/_posts/2021/2021'

augroup rwtBlogging
  autocmd!
  execute "autocmd BufNewFile" g:rwt_blog .. '/*.md :execute ":normal'
      \ 'I---\<cr>layout: post\<cr>title: \"\"\<cr>tags:'
      \ '[ ]\<cr>categories: [ ]\<cr>---\<cr>\<esc>"'
  execute "autocmd BufNewFile,BufRead" g:rwt_blog .. '/*.md :setlocal tw=77'
  autocmd FileType markdown :inoreabbrev <buffer> h1# <esc>i# <esc>a#<esc>hi
  autocmd FileType markdown :inoreabbrev <buffer> h2# <esc>i## <esc>a##<esc>2hi
  autocmd FileType markdown :inoreabbrev <buffer> h3# <esc>i### <esc>a###<esc>3hi
  autocmd FileType markdown :inoreabbrev <buffer> h4# <esc>i#### <esc>a####<esc>4hi
  autocmd FileType markdown :inoreabbrev <buffer> sc# ```<cr>```<cr><esc>2kA
augroup END

" Load all plugins now.
" Plugins need to be cloned to ~/.local/share/nvmim/site/pack/*/start now...
"
" mkdir -p ~/.local/share/nvim/site/pack/tabular/start
" cd !$
" git clone https://github.com/godlygeek/tabular

" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
" silent! helptags ALL
