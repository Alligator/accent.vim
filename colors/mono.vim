set background=dark
hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name = 'mono'

" foreground
let fg      = ' guifg=#bcbfc4'
let fg_b1   = ' guifg=#efefff'
let fg_d1   = ' guifg=#999999'
let fg_d2   = ' guifg=#777777'
let fg_d3   = ' guifg=#383c44'
let fg_c    = ' guifg=#e5c07b'
let fg_inv  = ' guifg=#282c34'

" background
let bg      = ' guibg=#282c34'
let bg_b1   = ' guibg=#383c44'
let bg_none = ' guibg=NONE'
let bg_inv  = ' guibg=#cccfd4'
let bg_c    = ' guibg=#e5c07b'

" modifiers
let bold    = ' gui=bold'
let none    = ' gui=none'
let underline = ' gui=underline'

" general
execute 'hi Normal'       . fg    . bg
execute 'hi StatusLine'   . fg_b1 . bg_b1   . none
execute 'hi StatusLineNC' . fg_d1 . bg_b1   . none
execute 'hi VertSplit'    . fg_d3 . bg_b1   . none
execute 'hi LineNr'       . fg_d2 . bg_none . none
execute 'hi CursorLineNr' . fg_b1 . bg_none . none
execute 'hi CursorLine'           . bg_b1   . none
execute 'hi MatchParen'   . fg_b1 . bg_b1   . bold
execute 'hi NonText'      . fg_d2 . bg_none . none
execute 'hi WildMenu'     . fg_inv. bg_inv  . none
execute 'hi Search'       . fg_inv. bg_c    . none
execute 'hi Folded'       . fg_b1 . bg_b1   . none

" syntax
execute 'hi Normal'       . fg    . bg
execute 'hi Comment'      . fg_d2 . bg_none . none
execute 'hi Constant'     . fg_c  . bg_none . none
execute 'hi Type'         . fg_b1 . bg_none . none
execute 'hi PreProc'      . fg    . bg_none . bold
execute 'hi Underlined'   . fg    . bg_none . underline

hi! link Operator     Normal
hi! link Identifier   Normal
hi! link Todo         Normal
hi! link Statement    PreProc
hi! link SpecialKey   Type
hi! link Title        Type
hi! link Directory    Type
hi! link Special      StatusLine

" special stuff
hi! link xmlAttrib    Normal
