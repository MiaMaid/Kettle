#!/bin/bash

DEPENDENCIES=(git wget)

for tool in "${DEPENDENCIES[@]}"; do
    if ! command -v "$tool" &> /dev/null; then
        echo "Ой... кажется, у тебя не установлен '$tool'.. :( Пожалуйста, поставь его, чтобы все заработало!"
        exit 1
    fi
done

CACHE_IMG="$HOME/.cache/Mixa-P52fetch.png"

if ! command -v neofetch &> /dev/null; then
    git clone https://github.com/dylanaraps/neofetch /tmp/neofetch
    cd /tmp/neofetch && sudo make install
    cd ~ && rm -rf /tmp/neofetch
fi

if [ ! -f "$CACHE_IMG" ]; then
    mkdir -p "$(dirname "$CACHE_IMG")"
    wget -q -O "$CACHE_IMG" https://i.postimg.cc/859J983B/Mixa-P52fetch.png
fi

neofetch --kitty "$CACHE_IMG"

##############################################
### Кто читает скрипт, тот лох. Кроме Миши ###
##############################################
