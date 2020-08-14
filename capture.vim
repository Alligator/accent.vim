function! AccentMakeGif()
  for c in keys(g:accent_colours)
    let g:accent_color = c
    colo accent
    redraw!
    echo c
    execute 'silent !"C:/Program Files (x86)/IrfanView/i_view32.exe" /capture=3 /convert=' . c . '.png'
  endfor

  execute 'silent !magick -loop 0 -delay 150 yellow.png orange.png red.png green.png blue.png magenta.png cyan.png accent.gif'

  echo 'done!'
endfunction
