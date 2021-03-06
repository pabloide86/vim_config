set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/share/vim/vim80
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'xolox/vim-misc'
Plugin 'wting/gitsessions.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'neomake/neomake'
Plugin 'w0rp/ale'
Plugin 'kshenoy/vim-signature'
Plugin 'scrooloose/nerdtree'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-fugitive'
Plugin 'fisadev/vim-isort'
Plugin 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plugin 'vim-airline/vim-airline'
Plugin 'burnettk/vim-angular'
Plugin 'Chiel92/vim-autoformat'

Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'zchee/deoplete-go', { 'do': 'make'}

if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

call vundle#end() " required
filetype plugin indent on " required
syntax on
" Set path to let neovim find colors
set rtp+=~/.vim

" Send more characters for redraws
set ttyfast
"
" Enable mouse use in all modes
set mouse=
"
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"set ttymouse=xterm2

set undofile " Maintain undo history between sessions
"set undodir=~/.vim/undodir

set completeopt=longest,menuone
set showtabline=2
set path=.,,**
" Case sentive search only if the search word has an upppercase letter
" Both ignorecase and smartcase must be on to make this feature work
set ignorecase
set smartcase

:let mapleader = ","

"let g:neomake_verbose=0
"let g:neomake_logfile='/tmp/s'
"autocmd! BufWritePost * Neomake

let g:ycm_auto_trigger=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 0 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:Show_diagnostics_ui = 1 "default 1

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_auto_loc_list = 0
let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 0
let g:go_highlight_types = 1
" Show function params in the status line
"let g:go_auto_type_info = 1

"let g:go_auto_sameids = 1

"let g:go_list_type = "quickfix"

" Ale / Airline
let g:ale_linters = {
\   'go': ['go build', 'gometalinter'],
\   'perl': ['perl', 'perlcritic'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0
" Don't run w0rp/ale on file open
let g:ale_lint_on_enter = 0
let g:ale_sign_column_always = 1

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

"air-line
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

let NERDTreeQuitOnOpen = 1
"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.ts set filetype=javascript
let g:markdown_fenced_languages = ['javascript', 'go', 'php']
set signcolumn="yes"

:let g:session_autosave = 'yes'
" To speed up GitSessions
set ssop-=options    " do not store global and local values in a session
"set ssop-=folds     " do not store folds

set number
set t_Co=256
set background=dark
set tabstop=4 
set shiftwidth=4
set virtualedit=all                       
set backspace=2
set nocompatible
set nowrap
set cursorline
set syntax=sh
set showmatch
set autoindent
set expandtab
set history=150
set formatoptions=tcql
set nostartofline
set laststatus=2
set hlsearch
set foldmethod=syntax
set foldlevelstart=20

colorscheme hybrid

hi CursorLine term=none cterm=none ctermbg=Black
hi TabLineFill ctermfg=White ctermbg=DarkGrey
hi TabLine term=none cterm=none ctermfg=White ctermbg=DarkGrey
hi TabLineSel term=none cterm=none ctermfg=White ctermbg=Blue
" Overriden by airline
"set statusline=%F%m%r%h%w\ \ \ [FORMAT=%{&ff}]\ [TYPE=%Y]\ \ \ \ \ \ \ \ [POS=%4l,%4v]\ \ \ \ \ \ [%p%%]\ [LEN=%L] 
"
" Mappings for Solaris
"set <F3>=OR
"set <F4>=[[D
"set <F5>=[[E
"set <F6>=[17~
"set <F7>=[18~
"set <F8>=[19~
"set <F9>=[20~
"set <F10>=[21~
"set <s-F2>=[24~
"set <s-F4>=O1;2S
"set <Del>=[3~
"set <C-u>=
"set <PageUp>=[5~
"set <PageDown>=[6~
"set <Home>=[1~
"set <End>=[4~
"set <Insert>=[2~

map <C-n>       :NERDTreeToggle<CR>
map <C-Right>   <Esc>:tabnext<CR>
map <C-Left>    <Esc>:tabprevious<CR>
map <C-Down>    <Esc><C-w><Down>
map <C-Up>      <Esc><C-w><Up>
map <C-S-Down>  :lnext<CR>
map <C-S-Up>    :lprevious<CR>
map <C-A-Left>  <Esc>:tabm -1<CR>
map <C-A-Right> <Esc>:tabm +1<CR>

" :w!! will write read only files not opened with sudo
cmap w!! w !sudo tee % >/dev/null

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

