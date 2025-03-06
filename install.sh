#!/bin/bash
ignore=( ".git" "install.sh" )

dir=$(ls)

i=0
while [ $i -lt ${#dir[@]} ]; do
	for j in {0..${#ignore[@]}}; do
		if [ "${dir[$i]}" ==  "${ignore[$j]}" ]; then
			unset dir[$i]
			unset ignore[$j]
			ignore=("${ignore[@]}")

			if [ ${#ignore[@]} -eq 0 ]; then
				i=${#dir[@]}
			fi

			break
		fi
	done
	((i++))
done

# completar script
