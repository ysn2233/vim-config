" synatx highligting
syntax enable
syntax on
colorschem molokai

" enable tagList
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" file browser and window manager
let g:winManagerWindowLayout = "NERDTree|TagList,BufExplorer"
let g:winManagerWidth = 30

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction

nmap wm :WMToggle<cr>

"autocmd bufenter * if (winnr("$") == 2 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary")  | qa | endif

"nmap wm :if IsWinManagerVisible() <BAR> WMToggle<cr> <BAR> else <BAR> WMToggle<cr> :q<cr> endif <cr>
":se tabstop=4	"tab widh th 4
:se ts=4
:se expandtab
:%retab!	"set tab not at the beginning of line
:se softtabstop=4	"backspace delete 4 space
:se shiftwidth=4 "<< >> can move 4 space

:se autoindent	"autoindent
:se nu		"show line number 
:se cursorline	"highlight current line
:se autochdir	"change directory to current file directory

:se hlsearch	"highlight found text
:se smartindent	"autoindent at newline

:se lines=42 columns=125 "windows size 

:hi MatchParen ctermbg=blue ctermfg=white "bracket match color

" bracket auto-complete
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<Esc>i"
 endif
endf
