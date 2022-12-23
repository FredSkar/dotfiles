" Automatic installation for vim-plug IFF not currently installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" YouCompleteMe
Plug 'ycm-core/YouCompleteMe'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' } 

" Git plugin
Plug 'tpope/vim-fugitive'

" Get VIM to look nice
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'scrooloose/syntastic'

"List ends here.  Plugins become visible to Vim after this call.
call plug#end()

syntax on
colorscheme gruvbox  " cool color scheme
let g:airline_theme='gruvbox'
set background=dark
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors = 256

set tabstop=4
set shiftwidth=4
set noexpandtab
retab

set tags=./tags,tags;$HOME     " looking for tags file in parent directory if not found

set number          " see numberlines
set relativenumber

set showcmd         " see last command

set cursorline      " see cursorline

set showmatch       " set parens to match each other

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set runtimepath^=~/.vim/bundle/ctrlp.vim     " Enable ctrl p
set directory^=$HOME/.vim/tmp//

filetype plugin indent on
syntax on
set title

set laststatus=2
set t_Co=256

" Key mapping
let mapleader=" "

" Key maps for gtags
" nnoremap <leader>gt :GtagsCursor<CR>
" nnoremap <leader>gf :Gtags
" nnoremap <leader>ge :Gtags -r
" nnoremap <C-n> :cn<CR>
" nnoremap <C-p> :cp<CR>

" Key mapps for YCM
nnoremap <leader>gt :YcmCompleter GoTo<CR>

nnoremap <leader>fi :YcmCompleter FixIt<CR>

nnoremap <leader>gd :YcmCompleter GetDoc<CR>

nnoremap <leader>gtp :YcmCompleter GetType<CR>

nnoremap <leader>gp :YcmCompleter GetParent<CR>

nnoremap <leader>gti :YcmCompleter GoToInclude<CR>

nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>

nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>

nnoremap <leader>yd :YcmDiags<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Settings for coc
" TextEdit might fail if hidden is not set.
" set hidden
" 
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
" 
" " Give more space for displaying messages.
" set cmdheight=2
" 
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
" 
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
" 
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

" Put files in a better lokation.
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" symbols section for unicode/airline symbols

" airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gvim
hi SpellBad gui=undercurl

