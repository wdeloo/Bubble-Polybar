#!/bin/bash
primary=$(cat ~/.config/polybar/bubble-polybar/scripts/colors.txt | sed -n 3p)
code=$(echo -n "$(~/.local/bin/spotifycli --status 0>/dev/null 1>/dev/null 2>/dev/null; echo $?)")

progress () {
	primary="$1"
	position=$(~/.local/bin/spotifycli --position)
	percent=$(echo "($(echo "$((echo -n '60*'; echo -n "${position}" | tr -d '()' | sed 's/\// /g' | awk '{print $1}' | sed 's/:/ /g' | awk '{print $1}') | bc)+$(echo -n "${position}" | tr -d '()' | sed 's/\// /g' | awk '{print $1}' | sed 's/:/ /g' | awk '{print $2}')" | bc)*100)/$(echo "$((echo -n '60*'; echo -n "${position}" | tr -d '()' | sed 's/\// /g' | awk '{print $2}' | sed 's/:/ /g' | awk '{print $1}') | bc)+$(echo -n "${position}" | tr -d '()' | sed 's/\// /g' | awk '{print $2}' | sed 's/:/ /g' | awk '{print $2}')" | bc)" | bc)
	echo -n "%{T5}"
	colorize () {
		progress=$((${1}/4))
		bar=""
		echo -n "%{F${primary}}"
		for i in $(seq 1 ${progress}); do echo -n ${bar}; done
		progressLeft=$((25-${progress}))
		echo -n "%{F-}"
		for i in $(seq 1 ${progressLeft}); do echo -n ${bar}; done
		echo
	}
	colorize $percent
}

name () {
	export LANG="es_ES.UTF-8"
	primary="$1"
	iniName=$(~/.local/bin/spotifycli --status)
	iniLn=$(echo -n "${iniName}" | wc -m)
	name=$(echo -n " "; echo -n "${iniName}" | tr -d '\n'; echo " ")
	tray=$(echo "$(echo -n "${name}" | wc -m)-19" | bc)
	catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/player/binName)
	catDir=$(cat ~/.config/polybar/bubble-polybar/scripts/player/direction)
	catName=$(cat ~/.config/polybar/bubble-polybar/scripts/player/name)
	restart () {
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/direction
		echo "${iniName:0:19}"
		exit 0
	}
	if [ "${iniName}" != "${catName}" ]; then
		echo "2" > ~/.config/polybar/bubble-polybar/scripts/player/binName
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/player/binPlay
		echo "${iniName}" > ~/.config/polybar/bubble-polybar/scripts/player/name
		restart
	fi
	echo "${iniName}" > ~/.config/polybar/bubble-polybar/scripts/player/name
	if [ "${iniLn}" -le "19" ]; then
		restart
	fi
	echo "${name:${catBin}:19}"
	if [ "${catBin}" -eq "0" ]; then
		echo "${catBin}+1" | bc > ~/.config/polybar/bubble-polybar/scripts/player/binName
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/direction
	elif [ "${catBin}" -ge "$tray" ]; then
		echo "${catBin}-1" | bc > ~/.config/polybar/bubble-polybar/scripts/player/binName
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/player/direction
	else
		if [ "${catDir}" = "0" ]; then	
			echo "${catBin}+1" | bc > ~/.config/polybar/bubble-polybar/scripts/player/binName
		elif [ "${catDir}" = "1" ]; then
			echo "${catBin}-1" | bc > ~/.config/polybar/bubble-polybar/scripts/player/binName
		else
			echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/binName
		fi
	fi
}

play () {
	primary="$1"
	catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/player/binPlay)
	if [ "$catBin" = "0" ]; then
		echo "%{F${primary}}"
	else
		echo "%{F${primary}}"
	fi
}

togglePlay () {
 catBin=$(cat ~/.config/polybar/bubble-polybar/scripts/player/binPlay)
	if [ "$catBin" = "0" ]; then
		echo "1" > ~/.config/polybar/bubble-polybar/scripts/player/binPlay
		~/.local/bin/spotifycli --play
	else
		echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/binPlay
		~/.local/bin/spotifycli --pause
	fi
}

if [ "$code" = "1" ]; then
	if [ "$1" = "progress" ]; then
		echo "%{T5}%{F-}"
	elif [ "$1" = "name" ]; then
		echo ' Run => $: spotify '
	elif [ "$1" = "prev" ]; then
		if [ "$2" = "exec" ]; then
			spotify &
			sleep 4
			~/.local/bin/spotifycli --prev
		else
			echo "%{F${primary}}%{T3}󰒮"
		fi
	elif [ "$1" = "play" ]; then
		if [ "$2" = "toggle" ]; then
			spotify &
			sleep 4
			togglePlay
		else
			play "$primary"
			echo "0" > ~/.config/polybar/bubble-polybar/scripts/player/binPlay
		fi
	elif [ "$1" = "next" ]; then
		if [ "$2" = "exec" ]; then
			spotify &
			sleep 4
			~/.local/bin/spotifycli --next
		else
			echo "%{F${primary}}%{T3}󰒭"
		fi
	else
		echo "%{F${primary}}%{T4}󰽰"
	fi
	exit 1
fi

if [ "$1" = "progress" ]; then
	progress "$primary"
elif [ "$1" = "name" ]; then
	name "$primary"
elif [ "$1" = "prev" ]; then
	if [ "$2" = "exec" ]; then
		~/.local/bin/spotifycli --prev
	else
		echo "%{F${primary}}%{T3}󰒮"
	fi
elif [ "$1" = "play" ]; then
	if [ "$2" = "toggle" ]; then
		togglePlay
	else
		play "$primary"
	fi
elif [ "$1" = "next" ]; then
	if [ "$2" = "exec" ]; then
		~/.local/bin/spotifycli --next
	else
		echo "%{F${primary}}%{T3}󰒭"
	fi
else
	echo "%{F${primary}}%{T4}󰽰"
fi
