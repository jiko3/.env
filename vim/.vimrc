"it's LiamLiao vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

"vundle plugin management
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'SrcExpl'
Plugin 'wesleyche/Trinity'
Plugin 'wolfpython/cscope_map.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle 'majutsushi/tagbar'
Bundle 'CoderCookE/vim-chatgpt'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'instant-markdown/vim-instant-markdown'
call vundle#end()            " required

"plug plugin management
"Plug 'gergap/vim-ollama'
call plug#begin()
Plug 'Shougo/unite.vim'
Plug 'devjoe/vim-codequery'
Plug 'tpope/vim-dispatch'
Plug 'mileszs/ack.vim'
Plug 'madox2/vim-ai'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rickhowe/diffchar.vim'
call plug#end()
filetype plugin indent on    " required

" Enable fzf in Vim
set rtp+=/usr/local/opt/fzf  " If manually installed
" Fuzzy search files (like CtrlP)
nnoremap <C-p> :Files<CR>
" Fuzzy search text in files
nnoremap <C-f> :Rg<CR>
" Search buffers
nnoremap <C-e> :Buffers<CR>


" vim-instant-markdown
let g:instant_markdown_browser = "google-chrome --new-window"
let g:instant_markdown_theme = 'dark'

" Snip
" Trigger configuration. You need to change this to something other than <tab>
" if you use one of the following: YouCompleteMe/completion-nvim
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-x>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsVerbose = 1

"ai
let g:vim_ai_token_file_path = '~/.config/openai.token'
"let g:openai_api_key=
let g:chat_gpt_max_tokens=2000
let g:chat_gpt_model='gpt-4'
let g:chat_gpt_session_mode=0
let g:chat_gpt_temperature = 0.7
let g:chat_gpt_lang = 'Chinese'
let g:chat_gpt_split_direction = 'vertical'
let g:split_ratio=4

"easymotion
let g:EasyMotion_leader_key='<Space>'

"nerdtree settings
let g:NERDTreeMapOpenSplit = 'a'

"ycm
"let g:ycm_global_ycm_extra_conf = '~/.env/vim/.ycm_extra_config.py'

"syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers=['flake8', 'frosted', 'pep8', 'pylint']
let g:syntastic_python_checkers=['flake8', 'frosted', 'pep8']
"let g:syntastic_python_checkers = ['prospector']
let g:syntastic_python_python_use_codec = 1
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
"let b:syntastic_mode = "passive"
"noremap <C-w>f :SyntasticToggleMode<CR>
noremap <C-w>c :SyntasticCheck<CR>
noremap <C-w>o :lopen<CR>
noremap <C-w>e :lclose<CR>

"##########codequery
let g:codequery_trigger_build_db_when_db_not_found = 1
nnoremap <space>c :CodeQueryMenu Unite Full<CR>
nnoremap <space>; :CodeQueryMenu Unite Magic<CR>
"enable typing (to search menu items) by default
nnoremap <space>\ :CodeQueryMenu Unite Magic<CR>A
nnoremap <space><CR> :CodeQuery Symbol<CR>
" Chain commands to find possible tests (for python)
nnoremap <space>t :CodeQuery Caller<CR>:CodeQueryFilter test_<CR>

"key mappings
nnoremap <silent> <F8> :NERDTree<CR>
nmap <F9> :TagbarToggle<CR>
map <F10> :Tlist<CR>
" # !!!   should be find "./"
" 1. find ./ -name "*.h" -o -name "*.hpp" -o -name "*.c" -o -name "*.cpp" -o -name "*.m" >cscope.files
map <F12> :!ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q .; cscope -Rbqk -f cscope.out; set tags=./tags<CR>:cs reset<CR><CR>
" 2. :cs add cscope.out (under vim command)
" ps. 
"    :cscope reset (for rebuild cscope)
"    :set tags=/path/to/tags (created by :!ctags -R)
" pycscope
" 1. pycscope -R .
" # now you have a cscope.out. use it like you would cscope
" 2. :cs add cscope.out
" 3. :cs reset

"by jiko
"nmap <F8> :TrinityToggleAll<CR>
"nmap <F2> :TrinityToggleTagList<CR> 
"nmap <F3> :TrinityToggleNERDTree<CR> 
"nmap <F4> :TrinityToggleSourceExplorer<CR> 
"nmap <S-s> :w<CR>
"" switch between big5 & utf8
"map <F5> :set tenc=big5<cr>
"map <F6> :set tenc=utf-8<cr>
"map <F7> : set nu!<BAR>set nonu?<CR>
nnoremap <F5> :resize +2<CR>
nnoremap <S-F5> :resize -2<CR>
nnoremap <F6> :vertical resize +2<CR>
nnoremap <S-F6> :vertical resize -2<CR>

" show colume number
set statusline+=col:\ %c,
" highlight search result
set hlsearch
set statusline+=%F
set cursorline
set mouse=nv

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p
"map i <Up>
"map k <Down>
"map j <Left>
"map <S-k> <PAGEUP>
"map <S-j> <PAGEDOWN>
map t <C-w>
map tk <C-w><Up>
map tj <C-w><Down>
map th <C-w><Left>
map tl <C-w><Right>
map , <Delete><Left> 
map ; <Insert>
set t_Co=256
syntax on
set backspace=indent,eol,start
set expandtab ts=4 sw=4 ai
set clipboard=unnamedplus
"
"color scheme
"colorscheme wombat256mod
set background=dark
colorscheme gruvbox
