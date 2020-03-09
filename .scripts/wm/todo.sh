#!/bin/sh

TODO_FILE="$HOME/txtfiles/ToDo.md"
SHOW_FILE="$HOME/.cache/.show_todos"

case "$1" in
    "a" | "append")
	echo "* $2" >> "$TODO_FILE"
	;;
    "h" | "hide")
	rm "$SHOW_FILE"
	;;
    "s" | "show")
	touch "$SHOW_FILE"
	;;
    "t" | "toggle")
	if [ -f "$SHOW_FILE" ]; then
	    rm "$SHOW_FILE"
	else
	    touch "$SHOW_FILE"
	fi
	;;
    "c" | "conky")
	if [ -f "$SHOW_FILE" ]; then
	    cat "$TODO_FILE"
	fi
	;;
    "e" | "edit")
	$EDITOR "$TODO_FILE"
	;;
    "?" | "help")
	printf "Your options:\n\n"
	grep "| \".*\")" "$0" | sed 's/\s*\".\" | \"//;s/\")//'
	;;
    *)
	cat "$TODO_FILE"
	;;
esac
