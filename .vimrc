" basic highlighting
syntax on

" no sound effects
set noerrorbells

" tabstop tells vim how many columns a tab counts for. softtabstop controls how many columns vim uses when you hit tab in insert mode. only tabstop affects how existing code displays
set tabstop=2 softtabstop=2

" shiftwidth controls how many columns text is indented with the reindent operations
set shiftwidth=2

" converts tabs to spaces
set expandtab                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

" for powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set guifont=Consolas\ NF
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

" indents for you
set smartindent

" nice line numbers
set nu

" no vim swap files
set noswapfile

set nobackup

" these will allow persistent undos
set undodir=~/.vim/undodir

set undofile

" incremental search: starts searching before you press enter
set incsearch

set t_ut=

call plug#begin('~/.vim/plugged')

" continuously updated session files
Plug 'tpope/vim-obsession'

" Powerline!
Plug 'powerline/powerline'

" Colorscheme
Plug 'morhetz/gruvbox'

" Outside colorscheme
Plug 'agude/vim-eldar'

" Fast grep
Plug 'jremmen/vim-ripgrep'

" Git plugin
Plug 'tpope/vim-fugitive'

" Manual page
Plug 'vim-utils/vim-man'

Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'

" Undo history visualizer
Plug 'mbbill/undotree'

" Match with %
Plug 'adelarsq/vim-matchit'

" Surround
Plug 'tpope/vim-surround'

" The only syntax highlighting you'll ever need!
Plug 'sheerun/vim-polyglot'

" Emmet for Vim emmet.io
Plug 'mattn/emmet-vim'

" CoC -- ALE replacement
Plug 'neoclide/coc.nvim', {'branch': 'release'} 

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

let g:coc_global_extensions = [   
      \ 'coc-tsserver'   
      \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

call plug#end()

if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set termguicolors
endif

colorscheme gruvbox

set background=dark


" allows ripgrep to use git root and git ignore for faster searching
if (executable('rg'))
  let g:rg_derive_root='true'
endif

" RipGrep Config
" https://dev.to/hayden/optimizing-your-workflow-with-fzf-ripgrep-2eai
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
nnoremap \ :Rg<CR>
nnoremap <C-P> :GFiles<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>s :BLines<cr>

let mapleader = " "

let g:netrw_browse_split = 2

let g:netrw_banner = 0

let g:netrw_winsize = 25

" Easy window change keys
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Easy access to undotree
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Open netrw in nice 30% vertical split
nnoremap <leader>u :UndotreeShow<CR>

" Easy access to ripgrep -- project search
nnoremap <leader>ps :Rg<SPACE>

" See function name
map _F ma[[k"xyy`a:echo @x<CR>

" Dispaly Coc documentation for word under cursor
nnoremap <silent> K :call CocAction('doHover')<CR>

" Tab for Coc autocompletion
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
inoremap <silent><expr> <cr> "\<c-g>u\<CR>"

" Emmet settings
let g:user_emmet_settings={
      \ 'javascript' : {
      \   'extends' : 'jsx',
      \    'default_attributes' : {
      \      'label': [{'htmlFor': ' '}],
      \      'class': { 'className': ' '},
      \    },
      \  },
      \}

" Open links with gx in WSL
let g:netrw_browsex_viewer="cmd.exe /C start" 
