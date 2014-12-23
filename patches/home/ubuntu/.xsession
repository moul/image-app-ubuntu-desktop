#!/bin/bash

xterm -geometry 80x25+250+500 &
fbsetbg /usr/share/online-labs-bg.jpg &

exec /usr/bin/fluxbox -log ~/.fluxbox/log

