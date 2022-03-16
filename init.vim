" Options
set nocompatible    " Disable compatibility to vi
set showmatch       " Show matching
set ignorecase      " Case insensitive
set smartcase       " Don't ignore case when search string contains uppercase letters
set clipboard=unnamedplus   " Use system clipboard
set completeopt=noinsert,menuone,noselect " Set behaviour of complete pop-up
" menuone   -> menu will come up even if there is only one match
" noinsert  -> do not insert text until a selection is made
" noselect  -> do not select, force user to select one from the menu
set cursorline      " Highlight current cursorline
set hidden          " Enable hidden buffer
set inccommand=split    " Show live results in a split window
set mouse=v         " Middle-click paste
set mouse=a         " Enable mouse click
set number          " Add line numbers
set relativenumber  " Enable relative line numbers
set splitbelow splitright   " Open new windows below and right
set title           " Set the title of the window to the value of 'titlestring'
set ttimeoutlen=0   " Time in milliseconds to wait for a key code sequence to complete
set wildmenu        " Enables 'enhanced mode' of command-line completion.
set hlsearch        " Highlight search
set incsearch       " Incremental search
set wildmode=longest,list   " Get bash-like tab completions
"set cc=80           " Set an 80 column border
set ttyfast         " Speed up scrolling

" Tabs size
set expandtab       " Converts tabs to white spaces
set shiftwidth=4    " Width for autoindents
set tabstop=4       " Number of columns occupied by a tab
set softtabstop=4   " See multiple spaces as tabstops
set autoindent      " Indent a new line the same as the line just typed

set cmdheight=2     " Better display for messages
set updatetime=300  " For diagnostic messages, 300ms of no cursor movement to trigger CursorHold

set shortmess+=c    " Avoid showing extra messages when using completion

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=number

"set showtabline=2   " Always show tabs

" Spelling
"set spell
"set spellfile=~/.config/nvim/spell/en.utf-8.add



let g:vimsyn_embed = 'l'    " lua syntax inside .vim files
filetype plugin on
filetype plugin indent on   " Allow auto-indenting depending on file type

" Plugins managed by vim-plug
" PlugInstall -> Install plugins
" PlugUpdate  -> Update plugins
" PlugUpgrade -> Upgrade vim-plug
call plug#begin()
Plug 'sainnhe/sonokai'          " Theme
Plug 'navarasu/onedark.nvim'
Plug 'hrsh7th/vim-vsnip'        " Snippets engine
Plug 'honza/vim-snippets'       " Collection of snippets
Plug 'scrooloose/nerdtree'      " Filesystem explorer
Plug 'preservim/nerdcommenter'  " Easy wway for commenting out lines
Plug 'mhinz/vim-startify'       " Start page
Plug 'vim-airline/vim-airline'  " Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'     " Better syntax highlighting for filetypes
Plug 'tpope/vim-fugitive'       " Git integration
Plug 'jiangmiao/auto-pairs'     " Auto-close braces and Scopes
Plug 'junegunn/rainbow_parentheses.vim' " Rainbow parentheses
Plug 'tpope/vim-surround'       " Change surroundings
Plug 'dkarter/bullets.vim'      " Automatic bullet list
Plug 'psliwka/vim-smoothie'     " Smooth scrolling
Plug 'andymass/vim-matchup'     " Better % support
Plug 'machakann/vim-highlightedyank'    " Make the yanked region apparent
Plug 'airblade/vim-rooter'      " Chanke working directory to root of project
Plug 'folke/which-key.nvim'     " Keybindings popup

" Fuzzy Finder
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }   " fzf native for telescope
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}         " We recommend updating the parsers on update
Plug 'p00f/nvim-ts-rainbow'                                         " Rainbow parentheses
Plug 'nvim-lua/plenary.nvim'                                        " Telescope
Plug 'nvim-telescope/telescope.nvim'

" Nvim LSP from: https://sharksforarms.dev/posts/neovim-rust
Plug 'neovim/nvim-lspconfig'    " Collection of common config for the Nvim LSP Client
Plug 'hrsh7th/nvim-cmp'         " Completion framework
Plug 'hrsh7th/cmp-nvim-lsp'     " LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'        " Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-path'         " Other usefull completion sources
Plug 'hrsh7th/cmp-buffer'
Plug 'simrat39/rust-tools.nvim' " To enable more of the features of rust-analyzer, such as inlay hints

"Plug 'saecki/crates.nvim'       " Crates.io support
Plug 'ryanoasis/vim-devicons'   " DevIcon support
call plug#end()

" The configuration options should be placed before `colorscheme sonokai`.
"let g:sonokai_style = 'default'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1

" You might have to force true color when using regular vim inside tmux as the
" colorscheme can appear to be grayscale with "termguicolors" option enabled.
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set termguicolors

set background=dark
set t_Co=256        " 256 colors
let g:onedark_config = { 'style' : 'dark' }


"colorscheme sonokai
colorscheme onedark

" inoremap -> maps the key in insert mode
" nnoremap -> maps the key in normal mode
" vnoremap -> maps the key in visual mode
" <C>      -> represents Control key
" <A>      -> Alt key
" <leader> -> leader key
" <CR>     -> return/enter

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" jk to exit from insert/visual mode
inoremap jk <Esc>
vnoremap jk <Esc>
inoremap kj <Esc>
vnoremap kj <Esc>

" copies filepath to clipboard by pressing yf (yank filepath)
nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd (yank directory)
nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Airline
let g:airline_powerline_fonts = 1
"let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers


" Startify
let g:startify_fortune_use_unicode = 1

" Startify + NERDTree on start when no file is specified
autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   NERDTree
    \ |   wincmd w
    \ | endif

" Disable mapping of spacebar
nnoremap <SPACE> <Nop>
" let g:mapleader="\<SPACE>"

" Set leader key
map <SPACE> <leader>

" <leader>+s to save
nnoremap <leader>s :update<CR>
" <leader>+q to exit current buffer
nnoremap <leader>q :q<CR>

" Go to normal mode, saves, and then back to insert
inoremap <C-S> <Esc>:update<CR>gi

" zz to :update
nnoremap zz :update<cr>

" Code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Code actions
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

" Format .rs on write
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

" Remove trailing whitespace when saving
autocmd BufWritePre * :%s/\s\+$//e


" Telescope config
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" NERDTree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" Find current file in Filesystem
nnoremap <C-f> :NERDTreeFind<CR>

" NERDTree
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Easy tab open
nnoremap <leader>t :tabnew<CR>

" Display opened buffers
nnoremap <leader>b :buffers<CR>:buffer<Space>
" F2 to go to the previous buffer
map <F2> :bprevious<CR>
" F3 to go to the next buffer
map <F3> :bnext<CR>
" Delete current buffer
nnoremap <leader>db :bd<CR>

" lua files
lua <<EOF
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })

require("plugins.my-rust-tools")
require("plugins.completion")
require("plugins.treesitter")
require("crates").setup()
require("plugins.which-key")
EOF
