" 主题颜色
colorscheme apprentice

" 字体和大小
" set guifont=Monnospace\ 30

" 设置 tab = 4, 将tab换成4个空格
set expandtab
set softtabstop =4
set tabstop     =4
set shiftwidth  =4

" 显示行号
set nu
" 当前行列高亮
set cursorline
set nocursorcolumn
" 相对行号
set relativenumber

" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" 防止水平滑动时候失去选择
xnoremap < <gv
xnoremap > >gv

""" plugins
let g:plug_url_format='git@github.com:%s.git'
" git@github.com:neoclide/coc.nvim.git
call plug#begin('~/.vim/bundle')
	Plug 'junegunn/vim-easy-align'
	Plug 'Valloric/YouCompleteMe'
	Plug 'dense-analysis/ale'
	Plug 'Shougo/neocomplete.vim'
	Plug 'preservim/nerdtree'
	Plug 'jistr/vim-nerdtree-tabs'
	Plug 'vim-airline/vim-airline'
    Plug 'tpope/vim-surround'
    Plug 'gcmt/wildfire.vim'
    Plug 'neoclide/coc.nvim'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'puremourning/vimspector'
    Plug 'mg979/vim-xtabline'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""" nerdtree 文件树
" map <C-n> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:NERDTreeWinSize=20


"""""""""""""""""""""""""""""""""""""""""" vim-easy-align 对齐插件配置
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"""""""""""""""""""""""""""""""""""""""""" ale
"设置状态栏显示的内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}
"始终开启标志列
let g:ale_sign_column_always   = 1
let g:ale_set_highlights       = 0
"自定义error和warning图标
let g:ale_sign_error           = '✗'
let g:ale_sign_warning         = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format    = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format      = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters              = {
	\   'c++': ['clang', 'gcc'],
	\   'c': ['clang', 'gcc'],
	\   'python': ['pylint', 'flake8'],
	\}


"""""""""""""""""""""""""""""""""""""""""" YouCompleteMe
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_global_ycm_extra_conf        = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf           = 0
"let g:ycm_key_invoke_completion='<C-j>'
let g:ycm_error_symbol                 = 'E>'
let g:ycm_warning_symbol               = 'W>'
" 使用 NerdFont 中的图标表示错误和警告
" let g:ycm_error_symbol = '﯇'
" let g:ycm_warning_symbol = '卵'
let g:ycm_enable_diagnostic_signs                       = 1
let g:ycm_enable_diagnostic_highlighting                = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_comments                          = 1
let g:ycm_complete_in_strings                           = 1
let g:ycm_min_num_of_chars_for_completion               = 2
let g:ycm_python_binary_path                            = 'python'
let g:ycm_semantic_triggers                             = {
	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
	\}


" 打开文件列表
map <c-f> :NERDTreeToggle<CR>
nmap tt :CocCommand explorer<CR>

""""""""""""""""""""""""""""""""""""""""" 菜单
" nnoremap <silent><nowait> <space> :call MenuFunc()<cr>
" function MenuFunc()
" 	nnoremap <silent><nowait> a :call GuideEsc()<cr>:NERDTreeToggle<cr>
" 	echo "[a] 文件菜单"
" endfunction
" 
" function GuideEsc()
" 	unmap a
" 	echo ""
" endfunction

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" nnoremap <silent><nowait> <space> :call MenuFunc()<cr>
" function MenuFunc()
" 	nnoremap <silent><nowait> a :call GuideEsc()<cr>:NERDTreeToggle<cr>
" 	echo "[a] 文件菜单"
" endfunction
" 
" function GuideEsc()
" 	unmap a
" 	echo ""
" endfunction

" 调试配置
let g:vimspector_enable_mappings = 'HUMAN'
nmap <c-d> :VimspectorReset<CR>

" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
let g:VM_maps                       = {}
let g:VM_custom_motions             = {'n': 'h', 'i': 'l', 'u': 'k', 'e': 'j', 'N': '0', 'I': '$', 'h': 'e'}
let g:VM_maps['i']                  = 'k'
let g:VM_maps['I']                  = 'K'
let g:VM_maps['Find Under']         = '<C-k>'
let g:VM_maps['Find Subword Under'] = '<C-k>'
let g:VM_maps['Find Next']          = ''
let g:VM_maps['Find Prev']          = ''
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Skip Region']        = '<c-n>'
let g:VM_maps["Undo"]               = 'l'
let g:VM_maps["Redo"]               = '<C-r>'

" 标签快捷键
nmap tN :tabnew<CR>
nmap tn :tabn <CR>
nmap tp :tabp<CR>
nmap tf :tabfirst<CR>
nmap tl :tablast<CR>
nmap tc :tabc<CR>
