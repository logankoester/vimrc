colorscheme slate 

" Enable toolbars
set guioptions+=m
set guioptions+=T
set number

set gfn=Terminus\ 12

" Enable NerdTREE
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" F12 to toggle word-wrapping, and Shift+F12 to toggle horizontal scrollbar
function ToggleWrap()
    set wrap!
    echo &wrap ? 'wrap' : 'nowrap'
endfunc

"F12 toggles wrap (Thanks to Alexandre Moreira)
nnoremap <silent> <F12>      :call ToggleWrap()<CR>
vnoremap <silent> <F12> <C-C>:call ToggleWrap()<CR>
inoremap <silent> <F12> <C-O>:call ToggleWrap()<CR>

function ToggleHorizontalScrollbar()
    "set guioptions+=b
    if &go =~# "b"
        set go-=b
    else
        set go+=b
    endif
endfunc

function ToggleHorizontalScrollbar_setKeys()
    "Shift+F12 toggles the horizontal scrollbar
    nnoremap <silent> <S-F12>      :call ToggleHorizontalScrollbar()<CR>
    vnoremap <silent> <S-F12> <C-C>:call ToggleHorizontalScrollbar()<CR>
    inoremap <silent> <S-F12> <C-O>:call ToggleHorizontalScrollbar()<CR>
endfunc

au GUIEnter * call ToggleHorizontalScrollbar_setKeys()


" Statusline (with Syntastic syntax checking)

set statusline=%t%h%m%r%=[%b\ 0x%02B]\ \ \ %l,%c%V\ %P
" Always show a status line
set laststatus=2
"make the command line 1 line high
set cmdheight=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
