" accent.vim
"
" a simple vim colourscheme with a configurable accent colour.
" by alligator
"
" https://github.com/Alligator/accent.vim

set background=dark
hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'accent'

let accent_colours = {}
let accent_colours['red']     = { 'fg': '#e06c75', 'bg': '#b04c55', 'ctermfg': '167', 'ctermbg': '131' }
let accent_colours['orange']  = { 'fg': '#ee9360', 'bg': '#b66930', 'ctermfg': '173', 'ctermbg': '166' }
let accent_colours['green']   = { 'fg': '#98c379', 'bg': '#689349', 'ctermfg': '149', 'ctermbg': '107' }
let accent_colours['yellow']  = { 'fg': '#e5c07b', 'bg': '#a5803b', 'ctermfg': '179', 'ctermbg': '136' }
let accent_colours['blue']    = { 'fg': '#61afe7', 'bg': '#3876af', 'ctermfg': '74', 'ctermbg': '67' }
let accent_colours['magenta'] = { 'fg': '#c688cd', 'bg': '#965498', 'ctermfg': '176', 'ctermbg': '133' }
let accent_colours['cyan']    = { 'fg': '#56b6c2', 'bg': '#3696a2', 'ctermfg': '73',  'ctermbg': '30' }

let accent = get(g:, 'accent_colour', 'yellow')
let accent = get(g:, 'accent_color', accent)

" useful development code to cycle through all of the colours
"
" run this once then comment it out again, otherwise the colo accent at the
" end of the function will cause this function to be redefined while it's
" still running, which vim doesn't like
"
" function! AccentCycle()
"   let accent = get(g:, 'accent_colour', 'yellow')
"   let accent = get(g:, 'accent_color', accent)
"
"   let colours = keys(g:accent_colours)
"   let idx = index(colours, accent)
"   let new_colour = colours[(idx + 1) % len(colours)]
"
"   let g:accent_colour = new_colour
"   let g:accent_color = new_colour
"   colo accent
" endfunction

" foreground
let fg      = ' guifg=#bcbfc4 ctermfg=250'
let fg_b1   = ' guifg=#efefff ctermfg=255'
let fg_d1   = ' guifg=#999999 ctermfg=246'
let fg_d2   = ' guifg=#777777 ctermfg=244'
let fg_d3   = ' guifg=#585c64 ctermfg=59'
let fg_inv  = ' guifg=#282c34 ctermfg=236'
let fg_c    = ' guifg=' . get(accent_colours, accent).fg . ' ctermfg=' . get(accent_colours, accent).ctermfg

" background
let bg      = ' guibg=#282c34 ctermbg=236'
let bg_b1   = ' guibg=#383c44 ctermbg=237'
let bg_b2   = ' guibg=#484c54 ctermbg=238'
let bg_none = ' guibg=NONE'
let bg_inv  = ' guibg=#cccfd4 ctermbg=188'
let bg_red  = ' guibg=' . accent_colours.red.bg . ' ctermbg=' . accent_colours.red.ctermbg
let bg_c    = ' guibg=' . get(accent_colours, accent).bg . ' ctermbg=' . get(accent_colours, accent).ctermbg

" special
let sp_red      = ' guisp=' . accent_colours.red.fg     . ' ctermfg=' . accent_colours.red.ctermfg
let sp_magenta  = ' guisp=' . accent_colours.magenta.fg . ' ctermfg=' . accent_colours.magenta.ctermfg
let sp_blue     = ' guisp=' . accent_colours.blue.fg    . ' ctermfg=' . accent_colours.blue.ctermfg
let sp_cyan     = ' guisp=' . accent_colours.cyan.fg    . ' ctermfg=' . accent_colours.cyan.ctermfg

" modifiers
let bold      = ' gui=bold'
let none      = ' gui=none cterm=none'
let underline = ' gui=underline'
let undercurl = ' gui=undercurl'

" general
execute 'hi Normal'       . fg    . bg
execute 'hi StatusLine'   . fg_b1 . bg_c    . none
execute 'hi StatusLineNC' . fg_d1 . bg_b2   . none
execute 'hi VertSplit'    . fg_c  . bg_b1   . none
execute 'hi LineNr'       . fg_d2 . bg_none . none
execute 'hi CursorLineNr' . fg_b1 . bg_none . none
execute 'hi CursorLine'           . bg_b1   . none
execute 'hi MatchParen'   . fg_b1 . bg_b1   . bold
execute 'hi NonText'      . fg_d2 . bg_none . none
execute 'hi WildMenu'     . fg_inv. bg_inv  . none
execute 'hi Search'       . fg_inv. bg_c    . none
execute 'hi Folded'       . fg_b1 . bg_b1   . none
execute 'hi Visual'               . bg_b2
execute 'hi Pmenu'        . fg_d1 . bg_b1   . none
execute 'hi PmenuSel'     . fg_c  . bg_b2   . none

execute 'hi Question'     . fg_c
hi! link MoreMsg Question
hi! link FoldColumn Folded

" spellchecking
execute 'hi SpellBad'     . ' ctermbg=NONE' . undercurl . sp_red
execute 'hi SpellRare'    . ' ctermbg=NONE' . undercurl . sp_magenta
execute 'hi SpellCap'     . ' ctermbg=NONE' . undercurl . sp_blue
execute 'hi SpellLocal'   . ' ctermbg=NONE' . undercurl . sp_cyan

" syntax
execute 'hi Normal'       . fg    . bg
execute 'hi Comment'      . fg_d2 . bg_none . none
execute 'hi String'       . fg_c  . bg_none . none
execute 'hi Type'         . fg_b1 . bg_none . none
execute 'hi PreProc'      . fg    . bg_none . bold
execute 'hi Underlined'   . fg    . bg_none . underline
execute 'hi Special'      . fg_c  . bg_none . none
execute 'hi Error'        . fg_b1 . bg_red  . none

hi! link Operator     Normal
hi! link Identifier   Normal
hi! link Todo         Normal
hi! link Statement    PreProc
hi! link Constant     Type
hi! link SpecialKey   Type
hi! link Title        Type
hi! link Directory    Type
hi! link Number       String
hi! link Character    String
hi! link ErrorMsg     Error

" special stuff
hi! link xmlAttrib    Normal
hi! link sqlKeyword   Type

" diff
let diff_red    = ' guifg=#68525c guibg=#48323c'
let diff_green  = ' guibg=#284034'
let diff_purple = ' guibg=#582c64'

execute 'hi DiffAdd'    . diff_green
execute 'hi DiffDelete' . diff_red
execute 'hi DiffChange' . bg_b1
execute 'hi DiffText'   . fg_b1       . bg_red  . none

hi! link diffAdded    DiffAdd
hi! link diffRemoved  DiffDelete
