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

let g:accent_colours = {}
let g:accent_colours['red']     = { 'fg': '#e06c75', 'bg': '#b04c55', 'ctermfg': '167', 'ctermbg': '131' }
let g:accent_colours['orange']  = { 'fg': '#ee9360', 'bg': '#b66930', 'ctermfg': '173', 'ctermbg': '166' }
let g:accent_colours['green']   = { 'fg': '#98c379', 'bg': '#689349', 'ctermfg': '149', 'ctermbg': '107' }
let g:accent_colours['yellow']  = { 'fg': '#e5c07b', 'bg': '#a5803b', 'ctermfg': '179', 'ctermbg': '136' }
let g:accent_colours['blue']    = { 'fg': '#61afe7', 'bg': '#3876af', 'ctermfg': '74', 'ctermbg': '67' }
let g:accent_colours['magenta'] = { 'fg': '#c688cd', 'bg': '#965498', 'ctermfg': '176', 'ctermbg': '133' }
let g:accent_colours['cyan']    = { 'fg': '#56b6c2', 'bg': '#3696a2', 'ctermfg': '73',  'ctermbg': '30' }

let g:accent_auto_cwd_colour = get(g:, 'accent_auto_cwd_colour', 0)

let s:accent = get(g:, 'accent_colour', 'yellow')
let s:accent = get(g:, 'accent_color', s:accent)
let s:darken = get(g:, 'accent_darken', 0)
let s:invert_status = get(g:, 'accent_invert_status', 0)
let s:no_bg = get(g:, 'accent_no_bg', 0)

" 32 bit fowler-noll-vo hash
function! s:fnv1a(str)
  let hash = 2166136261
  let i = 0
  while i < len(a:str)
    let c = char2nr(a:str[i])
    let hash = xor(hash, c)
    let hash = hash * 16777619
    let i += 1
  endwhile
  return hash
endfunction

if get(g:, 'accent_auto_cwd_colour', 0)
  let hash = s:fnv1a(getcwd())
  let key_index = abs(hash) % len(g:accent_colours)
  let color = keys(g:accent_colours)[key_index]
  let s:accent = color
endif


" foreground
let s:fg      = ' guifg=#bcbfc4 ctermfg=250'
let s:fg_b1   = ' guifg=#efefff ctermfg=255'
let s:fg_d1   = ' guifg=#999999 ctermfg=246'
let s:fg_d2   = ' guifg=#777777 ctermfg=244'
let s:fg_inv  = ' guifg=#282c34 ctermfg=236'
let s:fg_invd = ' guifg=#181c24 ctermfg=234'
let s:fg_c    = ' guifg=' . get(accent_colours, s:accent).fg . ' ctermfg=' . get(accent_colours, s:accent).ctermfg

" background
let s:bg      = ' guibg=#282c34 ctermbg=236'
let s:bg_b1   = ' guibg=#383c44 ctermbg=237'
let s:bg_b2   = ' guibg=#484c54 ctermbg=238'
let s:bg_none = ' guibg=NONE'
let s:bg_inv  = ' guibg=#cccfd4 ctermbg=188'
let s:bg_red  = ' guibg=' . accent_colours.red.bg . ' ctermbg=' . accent_colours.red.ctermbg
let s:bg_c    = ' guibg=' . get(accent_colours, s:accent).bg . ' ctermbg=' . get(accent_colours, s:accent).ctermbg

if s:darken
  let s:fg      = ' guifg=#acafb4 ctermfg=248'
  let s:fg_b1   = ' guifg=#dfdfef ctermfg=253'
  let s:fg_d1   = ' guifg=#888888 ctermfg=244'
  let s:fg_d2   = ' guifg=#666666 ctermfg=242'

  let s:bg      = ' guibg=#181c24 ctermbg=234'
endif

" special
let s:sp_red      = ' guisp=' . accent_colours.red.fg     . ' ctermfg=' . accent_colours.red.ctermfg
let s:sp_magenta  = ' guisp=' . accent_colours.magenta.fg . ' ctermfg=' . accent_colours.magenta.ctermfg
let s:sp_blue     = ' guisp=' . accent_colours.blue.fg    . ' ctermfg=' . accent_colours.blue.ctermfg
let s:sp_cyan     = ' guisp=' . accent_colours.cyan.fg    . ' ctermfg=' . accent_colours.cyan.ctermfg

" modifiers
let s:bold      = ' gui=bold'
let s:none      = ' gui=none cterm=none'
let s:underline = ' gui=underline'
let s:undercurl = ' gui=undercurl'

" general
if s:no_bg
	execute 'hi Normal'       . s:fg      . s:bg_none
else
	execute 'hi Normal'       . s:fg      . s:bg
endif
if s:invert_status
  execute 'hi StatusLine' . s:fg_invd .s:bg_c     . s:none
else
  execute 'hi StatusLine' . s:fg_b1   . s:bg_c    . s:none
endif
execute 'hi StatusLineNC' . s:fg_d1   . s:bg_b2   . s:none
execute 'hi VertSplit'    . s:fg_c    . s:bg_b1   . s:none
execute 'hi LineNr'       . s:fg_d2   . s:bg_none . s:none
execute 'hi CursorLineNr' . s:fg_b1   . s:bg_none . s:none
execute 'hi CursorLine'               . s:bg_b1   . s:none
execute 'hi MatchParen'   . s:fg_b1   . s:bg_b1   . s:bold
execute 'hi NonText'      . s:fg_d2   . s:bg_none . s:none
execute 'hi WildMenu'     . s:fg_inv  . s:bg_inv  . s:none
execute 'hi Search'       . s:fg_inv  . s:bg_c    . s:none
execute 'hi Folded'       . s:fg_b1   . s:bg_b1   . s:none
execute 'hi Visual'                   . s:bg_b2
execute 'hi Pmenu'        . s:fg_d1   . s:bg_b1   . s:none
execute 'hi PmenuSel'     . s:fg_c    . s:bg_b2   . s:none
execute 'hi TabLine'      . s:fg_d1   . s:bg_b1   . s:none
execute 'hi TabLineFill'  . s:fg_d1   . s:bg_b2   . s:none

hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC

execute 'hi Question'     . s:fg_c
hi! link MoreMsg Question
hi! link FoldColumn Folded

" spellchecking
execute 'hi SpellBad'     . ' ctermbg=NONE' . s:undercurl . s:sp_red
execute 'hi SpellRare'    . ' ctermbg=NONE' . s:undercurl . s:sp_magenta
execute 'hi SpellCap'     . ' ctermbg=NONE' . s:undercurl . s:sp_blue
execute 'hi SpellLocal'   . ' ctermbg=NONE' . s:undercurl . s:sp_cyan

" syntax
if s:no_bg
	execute 'hi Normal'       . s:fg    . s:bg_none
else
	execute 'hi Normal'       . s:fg    . s:bg
endif
execute 'hi Comment'      . s:fg_d2 . s:bg_none . s:none
execute 'hi String'       . s:fg_c  . s:bg_none . s:none
execute 'hi Type'         . s:fg_b1 . s:bg_none . s:none
execute 'hi PreProc'      . s:fg_d1 . s:bg_none . s:none
execute 'hi Underlined'   . s:fg    . s:bg_none . s:underline
execute 'hi Special'      . s:fg_c  . s:bg_none . s:none
execute 'hi Error'        . s:fg_b1 . s:bg_red  . s:none

hi! link Operator     Normal
hi! link Identifier   Normal
hi! link Todo         Normal
hi! link Macro        PreProc
hi! link Statement    Type
hi! link Constant     Type
hi! link SpecialKey   Comment
hi! link Title        Type
hi! link Directory    Type
hi! link Function     Type
hi! link Number       String
hi! link Character    String
hi! link ErrorMsg     Error

" special stuff
hi! link xmlAttrib    Normal
hi! link sqlKeyword   Type

" diff
let s:diff_red    = ' guifg=#e06c75 guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE'
let s:diff_green  = ' guifg=#98c379 guibg=NONE ctermfg=149 ctermbg=NONE'
let s:diff_purple = ' guifg=#c688cd guibg=NONE ctermfg=176 ctermbg=NONE'

execute 'hi DiffAdd'    . s:diff_green
execute 'hi DiffDelete' . s:diff_red
execute 'hi DiffChange' . s:bg_b1
execute 'hi DiffText'   . s:fg_b1       . s:bg_red  . s:none

hi! link diffAdded    DiffAdd
hi! link diffRemoved  DiffDelete
