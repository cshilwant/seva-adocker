#!/bin/bash


declare -A options_help
usage() {
	if [ -n "$*" ]; then
		echo "ERROR: $*"
	fi
	echo "Help:"
	echo
	echo -n "Usage: $0 "
	for option in "${!options_help[@]}"
	do
		arg=`echo ${options_help[$option]}|cut -d ':' -f1`
		if [ -n "$arg" ]; then
			arg=" $arg"
		fi
		echo -n "[-$option$arg] "
	done
	echo "container"
	echo -e "\nWhere:"
	for option in "${!options_help[@]}"
	do
		arg=`echo ${options_help[$option]}|cut -d ':' -f1`
		txt=`echo ${options_help[$option]}|cut -d ':' -f2`
		tb="\t\t"
		if [ -n "$arg" ]; then
			arg=" $arg"
			tb="\t"
		fi
		echo -e "   -$option$arg:$tb$txt"
	done
}
options_help[w]=":Windowing system - wayland (default)"
options_help[x]=":Windowing system - x.org"
options_help[e]=":Windowing system - EGL - no windowing"
options_help[c]=":No windowing system - cli"

WINDOW_TYPE=wayland

while getopts "hwxce" opt
do
	case $opt in
	w)
		WINDOW_TYPE=wayland
	;;
	x)
		WINDOW_TYPE=x.org
	;;
	c)
		WINDOW_TYPE=cli
	;;
	e)
		WINDOW_TYPE=egl
	;;
	h)
		usage
		exit 0
	;;
	\?)
		usage "Invalid Option '-$OPTARG'"
		exit 1
	;;
	:)
		usage "Option '-$OPTARG' Needs an argument."
		exit 1
	;;
	esac
done

# Shift all consumed arguments and pass rest to docker
shift $(($OPTIND - 1))


WINDOWING_OPTIONS=""
if [ "$WINDOW_TYPE" == "x.org" ]; then
	WINDOWING_OPTIONS="-e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix  -e XAUTHORITY=~/.Xauthority"
fi
if [ "$WINDOW_TYPE" == "wayland" ]; then
	WINDOWING_OPTIONS="-e XDG_RUNTIME_DIR=/tmp \
	 -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	 -e QT_QPA_PLATFORM=wayland \
	 -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY \
	 -v /dev/dri:/dev/dri -v /dev/pvr_sync:/dev/pvr_sync \
         --device-cgroup-rule='c 199:* rmw' --device-cgroup-rule='c 226:* rmw'
	 "
fi
if [ "$WINDOW_TYPE" == "egl" ]; then
	usage "EGL option is in the roadmap, but yet to be supported"
	exit 1
fi

set -x
docker run --rm -it --privileged $WINDOWING_OPTIONS -e LD_LIBRARY_PATH=/usr/lib \
		-v `pwd`:/workdir \
	--user=$(id -u):$(id -g) $*
