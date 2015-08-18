" Pathogen vim bundle manager
"
execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on

set nocompatible
set timeout timeoutlen=3000 ttimeoutlen=100
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set cinoptions=g0
set cino+=(0,W4,t0
"set cinoptions=:0,l1,t0,g0,(0

set complete=.,w,b,u,t,i

set background=dark

" Function to reverse background
function! ReverseBackground()
  if &bg=="light"
    se bg=dark
  else
    se bg=light
  endif
endfunction
command! RevBG call ReverseBackground()
nnoremap <silent> <leader>r :RevBG<cr>

if has('gui_running')
  colorscheme gruvbox
else
  "colorscheme base16-monokai
  let base16colorspace=256  " Access colors present in 256 colorspace
  let g:molokai_original = 1
  "colorscheme molokai
  colorscheme luna
endif

"colorscheme hybrid
"colorscheme luna
"colorscheme mustang
"colorscheme potts
"colorscheme Tomorrow


"let g:solarized_termcolors=256
"colorscheme solarized


" Favorite colorschemes
"bvemu
""getafe
"thor
""kellys
"badwolf
""blackdust
"molokai
""BusyBee
"twilight
""mustang
"Tomorrow-Night-Eighties

set guifont=monofur\ for\ Powerline\ 14
"set guifont=Monospace\ Bold\ 8
"set guifont=-*-monofur-plain-*-*-*-9-*-*-*-*-*-*-*
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l  "remove left-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"

set foldmethod=syntax
set foldlevel=1000

"let javaScript_fold=1         " JavaScript

set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2


set nu
set ruler

set nowrap
set hlsearch

set backupdir=~/.vim/backups

"Auto change-dir
"set acd

"LaTeX stuff
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:Tex_DefaultTargetFormat = 'pdf'
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 0
let g:Imap_FreezeImap = 1

let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'evince $*'
let g:Tex_IgnoreLevel = 5

" Crazy keys
map k g<UP>
map m <LEFT>
map l <RIGHT>
map , g<DOWN>

"map <UP> g<UP>
"map <DOWN> g<DOWN>

"imap <UP> <ESC>g<UP>a
"imap <DOWN> <ESC>g<DOWN>a

imap <C-W> <ESC><C-W>
map <C-LEFT> <LEFT>
map <C-RIGHT> <RIGHT>
map <C-UP> <UP>
map <C-DOWN> <DOWN>

if 0
  " Terminal colors
  "*Comment	any comment

  "*Constant			any constant
  "String					a string constant: "this is a string"
  "hi String ctermfg=red
  "Character			a character constant: 'c', '\n'
  "Number					a number constant: 234, 0xff
  hi Number ctermfg=blue
  "Boolean				a boolean constant: TRUE, false
  hi Boolean ctermfg=blue
  "Float					a floating point constant: 2.3e10

  "*Identifier		any variable name
  "Function				function name (also: methods for classes)

  "*Statement			any statement
  "Conditional		if, then, else, endif, switch, etc.
  "Repeat					for, do, while, etc.
  "Label					case, default, etc.
  "Operator				"sizeof", "+", "*", etc.
  "Keyword				any other keyword
  "Exception			try, catch, throw

  "*PreProc				generic Preprocessor
  hi PreProc ctermfg=red
  "Include				preprocessor #include
  "Define					preprocessor #define
  "Macro					same as Define
  "PreCondit			preprocessor #if, #else, #endif, etc.

  "*Type					int, long, char, etc.
  "StorageClass		static, register, volatile, etc.
  "Structure			struct, union, enum, etc.
  "Typedef				A typedef

  "*Special				any special symbol
  "SpecialChar		special character in a constant
  "Tag						you can use CTRL-] on this
  "Delimiter			character that needs attention
  "SpecialComment	special things inside a comment
  "Debug					debugging statements

  "*Underlined		text that stands out, HTML links

  "*Ignore				left blank, hidden

  "*Error					any erroneous construct

  "*Todo					anything that needs extra attention; mostly the
  "								keywords TODO FIXME and XXX

  "LineNr
  hi LineNr ctermfg=cyan
endif

" Set the filetypes correctly
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch
autocmd BufRead,BufNewFile *.urdf setfiletype xml
autocmd BufRead,BufNewFile *.xacro setfiletype xml
autocmd BufRead,BufNewFile *.cpf setfiletype xml
autocmd BufRead,BufNewFile *.test setfiletype xml
autocmd BufRead,BufNewFile *.sdf setfiletype xml
autocmd BufRead,BufNewFile *.world setfiletype xml
autocmd BufRead,BufNewFile *.moin setfiletype moin
autocmd BufRead,BufNewFile *.ops setfiletype cpp
autocmd BufRead,BufNewFile *.msg setfiletype ruby
autocmd BufRead,BufNewFile *.srv setfiletype ruby
autocmd BufRead,BufNewFile *.rosinstall setfiletype yaml
au! BufRead,BufNewFile *.json setfiletype json
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif


"""""""""""""""""""""""""""""""""
" line wrapping and movements
"""""""""""""""""""""""""""""""""
" toggle wrapping with \w
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function! ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    call UnwrapIt()
  else
    echo "Wrap ON"
    call WrapIt()
  endif
endfunction

function! WrapIt()
  set wrap linebreak
  set virtualedit=
  set breakat=\ ^I!@*-+;:,./?       " when wrapping, break at these characters (requires linbreak, see above)
	set showbreak=                    " character to show that a line is wrapped
  setlocal display+=lastline
  noremap  <buffer> <silent> k gk
  noremap  <buffer> <silent> j gj
  noremap  <buffer> <silent> <Up>   gk
  noremap  <buffer> <silent> <Down> gj
  noremap  <buffer> <silent> <Home> g<Home>
  noremap  <buffer> <silent> <End>  g<End>
  inoremap <buffer> <silent> <Up>   <C-o>gk
  inoremap <buffer> <silent> <Down> <C-o>gj
  inoremap <buffer> <silent> <Home> <C-o>g<Home>
  inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction

function! UnwrapIt()
  set nowrap
  set virtualedit=all
  silent! nunmap <buffer> j
  silent! nunmap <buffer> k
  silent! nunmap <buffer> <Up>
  silent! nunmap <buffer> <Down>
  silent! nunmap <buffer> <Home>
  silent! nunmap <buffer> <End>
  silent! iunmap <buffer> <Up>
  silent! iunmap <buffer> <Down>
  silent! iunmap <buffer> <Home>
  silent! iunmap <buffer> <End>
endfunction

if &wrap
  call WrapIt()
endif

" ctags
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
autocmd FileType cpp map <F4> :TlistToggle<cr>
autocmd FileType cpp map <buffer> <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
autocmd FileType cpp nmap <F6> :TagbarToggle<CR>
se tags+=~/.ctags/tags


"au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

nnoremap ` :GundoToggle<CR>

command! -range SwapArgs <line1>,<line2>s/(\([^,]\+\),\s*\([^,)]\+\)/(\2, \1/ | let @/ = ""

map <C-n> :NERDTreeToggle<CR>

let g:loaded_ros = 1

map <F2> :Bufferlist<CR>

let g:replay_record = 1
let g:replay_speed = 300

function! FU()
  r~/.vim/fu.txt
endfunction

nmap  :call FU()<CR>

"Zenmode
nnoremap <silent> <leader>z :Goyo<cr>
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
let g:goyo_width = 81

"AirLine
set laststatus=2
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"let g:airline_theme='dark'
"let g:airline_theme='powerlineish'
highlight clear SignColumn

"Python Flake8
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>
let g:flake8_max_line_length=120
let g:flake8_max_complexity=15

"ctrl-space
set hidden
let g:ctrlspace_use_mouse_and_arrows_in_term=0
let g:airline_exclude_preview = 1


