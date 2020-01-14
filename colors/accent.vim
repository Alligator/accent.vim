set background=dark
hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'accent'

let accent_colours = {}
let accent_colours['red']     = { 'fg': '#e06c75', 'bg': '#c04c55' }
let accent_colours['green']   = { 'fg': '#98c379', 'bg': '#98c379' }
let accent_colours['yellow']  = { 'fg': '#e5c07b', 'bg': '#a5803b' }
let accent_colours['blue']    = { 'fg': '#61afef', 'bg': '#61afef' }
let accent_colours['magenta'] = { 'fg': '#c678dd', 'bg': '#b668cd' }
let accent_colours['cyan']    = { 'fg': '#56b6c2', 'bg': '#3696a2' }

let accent = get(g:, 'accent_colour', 'yellow')
let accent = get(g:, 'accent_color', accent)

" foreground
let fg      = ' guifg=#bcbfc4'
let fg_b1   = ' guifg=#efefff'
let fg_d1   = ' guifg=#999999'
let fg_d2   = ' guifg=#777777'
let fg_d3   = ' guifg=#585c64'
let fg_inv  = ' guifg=#282c34'
let fg_c    = ' guifg=' . get(accent_colours, accent).fg

" background
let bg      = ' guibg=#282c34'
let bg_b1   = ' guibg=#383c44'
let bg_b2   = ' guibg=#484c54'
let bg_none = ' guibg=NONE'
let bg_inv  = ' guibg=#cccfd4'
let bg_red  = ' guibg=' . accent_colours.red.bg
let bg_c    = ' guibg=' . get(accent_colours, accent).bg

" special
let sp_red      = ' guisp=' . accent_colours.red.fg
let sp_magenta  = ' guisp=' . accent_colours.magenta.fg
let sp_blue     = ' guisp=' . accent_colours.blue.fg
let sp_cyan     = ' guisp=' . accent_colours.cyan.fg

" modifiers
let bold      = ' gui=bold'
let none      = ' gui=none'
let underline = ' gui=underline'
let undercurl = ' gui=undercurl'

" general
execute 'hi Normal'       . fg    . bg
execute 'hi StatusLine'   . fg_inv. bg_c    . none
execute 'hi StatusLineNC' . fg_d3 . bg_c    . none
execute 'hi VertSplit'    . fg_c  . bg_none . none
execute 'hi LineNr'       . fg_d2 . bg_none . none
execute 'hi CursorLineNr' . fg_b1 . bg_none . none
execute 'hi CursorLine'           . bg_b1   . none
execute 'hi MatchParen'   . fg_b1 . bg_b1   . bold
execute 'hi NonText'      . fg_d2 . bg_none . none
execute 'hi WildMenu'     . fg_inv. bg_inv  . none
execute 'hi Search'       . fg_inv. bg_c    . none
execute 'hi Folded'       . fg_b1 . bg_b1   . none
execute 'hi Visual'               . bg_b2

execute 'hi Question'     . fg_c
hi! link MoreMsg Question
hi! link FoldColumn Folded

" spellchecking
execute 'hi SpellBad'                       . undercurl . sp_red
execute 'hi SpellRare'                      . undercurl . sp_magenta
execute 'hi SpellCap'                       . undercurl . sp_blue
execute 'hi SpellLocal'                     . undercurl . sp_cyan

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
