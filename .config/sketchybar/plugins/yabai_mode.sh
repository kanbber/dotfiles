#!/usr/bin/env bash

case "$(yabai -m query --spaces --display | jq -r 'map(select(."focused" == 1))[-1].type')" in
    bsp)
    sketchybar -m --set yabai_mode icon="1"
    ;;
    stack)
    sketchybar -m --set yabai_mode icon="2"
    ;;
    float)
    sketchybar -m --set yabai_mode icon="3"
    ;;
esac
