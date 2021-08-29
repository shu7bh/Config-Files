" Using Vim Plug
call plug#begin('~/local/share/.nvim/plugged')

"Syntax Highlighting
Plug 'compnerd/arm64asm-vim'

"Auto Indent
Plug 'philj56/vim-asm-indent'

" LSP
Plug 'neovim/nvim-lspconfig'

" Gives UI
Plug 'glepnir/lspsaga.nvim'

" To illuminate same word
Plug 'RRethy/vim-illuminate'

" Completion
Plug 'hrsh7th/nvim-compe'

" Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

" To easily see previous commits
Plug 'tpope/vim-fugitive'

" To see the previous changes
Plug 'mbbill/undotree'

" To get the closing braces when the opening braces is typed
Plug 'chun-yang/auto-pairs'

" To provide better highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" To show a small hazy line based on the indent
Plug 'yggdroot/indentline'

" For snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" To get fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" To get statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" To comment and uncomment lines easily
Plug 'scrooloose/nerdcommenter'

" Theme
Plug 'rakr/vim-one'

" Information about the modifed changes in git
Plug 'mhinz/vim-signify'

" For snippets
Plug 'sirver/ultisnips'

call plug#end()

" Settings "

set exrc
set number relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup

set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=10
set cmdheight=1
set completeopt=menuone,noselect
set shortmess^=c

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noshowmode
set linebreak
set foldmethod=indent
set nofoldenable

set splitbelow splitright
set clipboard=unnamedplus
set mouse+=a

" let "

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
let mapleader = ' '
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme ='behelit'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

let g:indentLine_setColors = 0

" Utilsnips
let g:UltiSnipsExpandTrigger="<>"
let g:UltiSnipsJumpForwardTrigger="<A-n>"
let g:UltiSnipsJumpBackwardTrigger="<A-m>"

" To split the window vertically
let g:UltiSnipsEditSplit="vertical"

" For Cpp Enhanced highlight

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1

" Indent line

let g:indentLine_setColors = 1
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" So that ranger opens
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory

" To remap the ranger key
let g:ranger_map_keys = 0

" Color Scheme "
syntax enable
set background=dark
colorscheme one
hi Normal guibg=NONE ctermbg=NONE

" key mapping
inoremap jj <Esc>
inoremap ;; <Esc>la

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <c-t> :Files<cr>

nnoremap <leader>wq :w<bar>bp<bar>sp<bar>bn<bar>bd<bar>enew<CR>
nnoremap <A-r> :!run '%:t' <CR><CR>
nnoremap <A-R> :!run '%:t -g' <CR><CR>

nnoremap <silent> <C-o> :<C-u>call append(line("."), repeat([""], v:count1))<CR>
inoremap <silent> <C-o> <Esc>:<C-u>call append(line("."), repeat([""], v:count1))<CR>a

noremap <C-a> ggVG$
nnoremap <leader>s $i<CR><Esc>k

imap <C-_> <Esc><plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle<CR>gv

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Map for ranger
map <leader>lf :Ranger<CR>

" Map for Saga

nnoremap <silent><leader>cf :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>lca :Lspsaga code_action<CR>
vnoremap <silent><leader>lca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent><leader>hd :Lspsaga hover_doc<CR>
nnoremap <silent><C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent><C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
"nnoremap <silent><leader>csh :Lspsaga signature_help<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent><leader>pd :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>ld :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [d :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]d :Lspsaga diagnostic_jump_prev<CR>
"nnoremap <silent> <leader>cot :Lspsaga open_floaterm<CR>
"tnoremap <silent> <leader>cct <C-\><C-n>:Lspsaga close_floaterm<CR>

au VimLeave,VimSuspend * set guicursor=a:i-ver25-blinkon0

function! AirlineInit()
    let g:airline_section_y = airline#section#create(['%P '])
    let g:airline_section_z = airline#section#create_right(['%l  %c'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre /some/path/**.cpp :ruby CppAutoInclude::process

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
-- require 'illuminate' on_attach(client)

vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
-- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "clangd", "pyright", "html" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

require'compe'.setup
{
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source =
    {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = false;
        ultisnips = true;
    };
}

local t = function(str)
return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
local col = vim.fn.col('.') - 1
if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
else
    return false
end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
elseif check_back_space() then
    return t "<Tab>"
else
    return vim.fn['compe#complete']()
end
end
_G.s_tab_complete = function()
if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
