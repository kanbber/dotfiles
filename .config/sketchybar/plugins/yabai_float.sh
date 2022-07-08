#!/usr/bin/env bash

case "$(yabai -m query --windows --window | jq .floating)" in
    0)
    sketchybar -m --set yabai_float icon="3"
    ;;
    1)
    sketchybar -m --set yabai_float icon="4"
    ;;
esac

