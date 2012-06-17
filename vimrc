call pathogen#infect()

filetype plugin indent on
set nocompatible

""" #####################################
""" Visual stuff

set t_Co=256

""" ininite undo file
set undofile  
set undodir=/tmp  

set encoding=utf-8

set ffs=unix,dos,mac "Default file types

"Set backup to a location
set backup
set backupdir=$HOME/temp/vim_backups/ 
set directory=$HOME/temp/vim_swp/ 
set noswapfile

colorscheme solarized
call togglebg#map("<F5>")
if has("gui_running")
	set guioptions-=T
	set background=light
	set clipboard=autoselect
	let g:solarized_contrast="high"
	if has('mac')
		set guifont=Monaco:h9
	elseif has('unix')
		set guifont=ProggyCleanTT\ 12
		set guioptions-=m
	endif
else
	set background=dark
	let g:solarized_termcolors=256
endif
"
set ruler		" line numbers and column the cursor is on

set shortmess+=a	" Use [+] [RO] [w] for modified, read-only, modified
set statusline=%<%f%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P

""""" Folding
set foldmethod=indent " By default, use indent to determine folds
set foldlevelstart=99	" All folds open by default
set nofoldenable

"""" Command Line
set wildmenu	" Autocomplete features in the status bar
set wildmode=longest:full,list
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

"""" Messages, Info, Status
set shortmess+=a						" Use [+] [RO] [w] for modified, read-only, modified
set showcmd								" Display what command is waiting for an operator
set laststatus=2						" Always show statusline, even if only 1 window
set report=0							" Notify me whenever any lines have changed
set confirm								" Y-N-C prompt if closing with unsaved changes
set vb t_vb=							" Disable visual bell!  I hate that flashing.
set statusline=%<%f%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P
set laststatus=2  " always a status line

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" allow arrow keys when code completion window is up
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

""" show 80 characters
set colorcolumn=80

set lazyredraw							" Don't repaint when scripts are running
set scrolloff=3							" Keep 3 lines below and above the cursor
set ruler								" line numbers and column the cursor is on
set number								" Show line numbering
set numberwidth=1						" Use 1 col + 1 space for numbers
set ttyfast

""" #####################################
""" Code orgaization

syntax enable
set smarttab " indent next line as the previous
"set cindent
set tabstop=4		" Tab stop of 4
set shiftwidth=4	" sw 4 spaces (used on auto indent)
set softtabstop=4	" 4 spaces as a tab for bs/del
" FileType
filetype plugin on
set iskeyword+=.
autocmd Filetype html setlocal ts=2 sw=2 sts=0 tw=72 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 tw=72 expandtab
autocmd Filetype json setlocal ts=4 sw=4 sts=0 tw=72 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 tw=72 expandtab
au BufNewFile *.html,*.py,*.pyw,*.c,*.h,*.json set fileformat=unix
au! BufRead,BufNewFile *.json setfiletype json 
" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" smart indenting for python
au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
set iskeyword+=.,_,$,@,%,#


""" #####################################
""" Key Shortcuts
" work more logically with wrapped lines
noremap j gj
noremap k gk
""" moving one line
nmap <c-up> [e
nmap <c-down> e]
""" moving selection
vmap <c-up> [egv
vmap <c-down> ]egv

"""" Moving between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-t> <C-w>t

""" NerdTree toggle
nmap <F8> :NERDTreeToggle<CR>

" allow arrow keys when code completion window is up
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

""" ######################################
""" Searching and Patterns
set ignorecase							" search is case insensitive
set smartcase							" search case sensitive if caps on 
set incsearch							" show best match so far
set hlsearch							" Highlight matches to the search 

""" #######################################
""" Editing
set backspace=2							" Backspace over anything! (Super backspace!)
set matchtime=2							" For .2 seconds
set formatoptions-=tc					" I can format for myself, thank you very much
set nosmartindent
set history=100							" 100 Lines of history
set showfulltag							" Show more information while completing tags

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

""" #######################################
""" Compile
au FileType python nmap	<F9> :Pylint<CR>
