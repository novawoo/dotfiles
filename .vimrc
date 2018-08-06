" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" =============================================================================
"                          << 以下为软件默认配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Windows Gvim 默认配置> 做了一点修改
" -----------------------------------------------------------------------------
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
    set diffexpr=MyDiff()

    function MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif

" -----------------------------------------------------------------------------
"  < 颜色配置 >
" -----------------------------------------------------------------------------
"Color Settings {
set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=dark "dark light          "使用color solarized
set cmdheight=2              "设置命令行的高度为2，默认为1
set cursorline               "设置光标高亮显示
set cursorcolumn             "光标垂直高亮
set ttyfast
set ruler                    "状态栏显示光标位置
set backspace=indent,eol,start

" -----------------------------------------------------------------------------
"  < 主题配置 >
" -----------------------------------------------------------------------------
" 注：主题使用solarized
colorscheme solarized "desert 
let g:solarized_termtrans  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"
"}

"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}

"history setting {
set history=200
"}

" -----------------------------------------------------------------------------
"  < 编码配置 >
" -----------------------------------------------------------------------------
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1		"设置支持打开的文件的编码
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
set encoding=utf-8				"设置gvim内部编码

" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

if (g:iswindows && g:isGUI)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "解决consle输出乱码
    language messages zh_CN.utf-8
endif

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set laststatus=2							  "启用状态栏信息
"set transparency=50                           "设置窗口透明度
set number                                    "显示行号
"set undofile                                 "无限undo
"set nowrap                                   "禁止自动换行
autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

"set relativenumber                           "相对行号 要想相对行号起作用要放在显示行号后面
set wrap                                      "自动换行
if(g:iswindows)
	"set guifont=YaHei_Consolas_Hybrid:h18                 "设置字体:字号（字体名称空格用下划线代替）
	set guifont=source_code_pro:h16                 "设置字体:字号（字体名称空格用下划线代替）
else
	"set guifont=楷体:h16                    "GUI界面里的字体，默认有抗锯齿
	set guifont=source_code_pro:h16                 "设置字体:字号（字体名称空格用下划线代替）
endif

set isk+=-                                     "将-连接符也设置为单词

set ignorecase "设置大小写不敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set showmatch             "显示括号对应
set hlsearch              "高亮显示搜索结果
set incsearch             "实时显示搜索结果

"set numberwidth=4          "行号栏的宽度
"set columns=100           "初始窗口的宽度
"set lines=60              "初始窗口的高度
"winpos 350 10             "初始窗口的位置

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

" -----------------------------------------------------------------------------
"  < 其它配置 >
" -----------------------------------------------------------------------------
set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
" set noswapfile                              "设置无临时文件
" set vb t_vb=                                "关闭提示音
set showcmd                                 "设置显示命令

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"使得<c-p><c-n>在命令行模式下有<up><down>同样的功能
cnoremap <c-p> <up>
cnoremap <c-n> <down>

"===================================================
"修改leader键为逗号
let mapleader=","
imap jj <esc>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"修改vim的正则表达
nnoremap / /\v
vnoremap / /\v

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
"nnoremap <leader>w <c-w>v<c-w>l
"nnoremap <leader>wc <c-w>c
"nnoremap <leader>ww <c-w>w

"tab切换
nnoremap <leader>t gt
nnoremap <leader>r gT
"使用<leader>空格来取消搜索高亮
nnoremap <leader><space> :noh<cr>

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx
"切换到当前目录
nmap <leader>q :execute "cd" expand("%:h")<CR>
"搜索替换
nmap <leader>s :,s///c

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=css<CR>
nmap <leader>fx :set ft=xml<CR>
nmap <leader>fm :set ft=mako<CR>

"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"Indent Guides设置
"let g:indent_guides_guide_size=1

" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < Vundle 插件管理工具配置 >
" -----------------------------------------------------------------------------
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" 安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible          "禁用 Vi 兼容模式
filetype off              "禁用文件类型侦测,必须的设置

"Vundle Settings {
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlp.vim'
Plugin 'AutoClose'
Plugin 'matchit.zip'
Plugin 'Tabular'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'spiiph/vim-space'
Plugin 'trailing-whitespace'

Plugin '_jsbeautify'
nnoremap <leader>_ff :call g:Jsbeautify()<CR>

Plugin 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'

"Fencview的初始设置
Plugin 'FencView.vim'
let g:fencview_autodetect=1

Plugin 'The-NERD-tree'
"设置相对行号
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos=1

Plugin 'The-NERD-Commenter'
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>

"Bundle 'UltiSnips'
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"Bundle 'Markdown'
Plugin 'hallison/vim-markdown'
"Bundle 'Markdown-syntax'
"let g:vim_markdown_folding_disabled=1

Plugin 'msanders/snipmate.vim'

"Bundle 'instant-markdown.vim'
"let g:instant_markdown_slow = 1

"带折叠双栏树状文本管理
Bundle 'VOoM'
let g:voom_ft_modes={'markdown':'markdown','c':'fmr2','cpp':'fmr2'}
nmap <leader><leader>o :Voom<CR>

"vim-geeknote vim编辑Evernote中的笔记
Bundle 'https://github.com/neilagabriel/vim-geeknote'

Plugin 'TxtBrowser'
Plugin 'ctags.vim'
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

Plugin 'ywtxt'

Plugin 'taglist.vim'

"js html 混排格式增强
Plugin 'pangloss/vim-javascript'

Plugin 'sketch.vim'

"Bundle 'Indent-Guides'
"let g:indent_guides_guide_size=1

Plugin 'rizzatti/dash.vim'

"buffer管理
"Plugin 'fholgado/minibufexpl.vim'
"nmap <Leader>e :MBEOpen<cr>
"nmap <Leader>c :MBEClose<cr>
"nmap <Leader>t :MBEToggle<cr>
"nmap <Leader>f :MBEFocusAll<cr>

"状态栏美化
Plugin 'vim-airline/vim-airline'
 "打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1
 "设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>

Plugin 'vim-airline/vim-airline-themes'
Plugin 'vifm/vifm.vim'

"a Git wrapper so awesome,it should be illegal
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'axiaoxin/vim-json-line-format'

"解决normal模式下中文输入法的问题
"lugin 'CodeFalling/fcitx-vim-osx'


"让vim实现类似于iWrite效果的插件
"Plugin 'junegunn/goyo.vim'

"https://github.com/mattn/emmet-vim
Plugin 'mattn/emmet-vim'
"let g:user_emmet_expandabbr_key='<Tab>'
let g:user_emmet_settings={
            \'java':{
            \'extends' : 'html'
            \},
            \'xml':{
            \'extends' : 'html'
            \},
            \'jsp':{
            \'extends' : 'html'
            \},
\}

"括号高亮
Plugin 'kien/rainbow_parentheses.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"}

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on                             "启用缩进
syntax on
