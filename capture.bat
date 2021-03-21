@echo off
nvim-qt -qwindowgeometry 633x437 -- -c "source capture.vim | e hello.c | sleep 1 | call AccentMakeGif()"
