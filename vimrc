call pathogen#infect()

filetype plugin indent on

""" #####################################
""" Visual stuff

set t_Co=256

if has("gui_running")
	if has('mac')
		set guifont=Monaco:h9
	endif
	colorscheme solarized
endif

set background=dark

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

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" allow arrow keys when code completion window is up
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

""" show 80 characters
set colorcolumn=80


""" #####################################
""" Code orgaization

syntax enable
set smarttab " indent next line as the previous
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 noexpandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 noexpandtab
" Bad whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" #####################################
""" Key Shortcuts

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
