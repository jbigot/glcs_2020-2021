#!/bin/bash
set -e

if [ 1 -lt $# ]
then
	echo "Usage: $0 [<TDDIR>]" 1>&2
	exit 1
elif [ 1 -eq $# ]
then
	TDDIR="$1"
else
	TDDIR="TD1"
fi

if [ ! -e "${TDDIR}" ]
then
	mkdir -p "${TDDIR}"
fi

if [ ! -d "${TDDIR}" ]
then
	echo "${TDDIR} is not a directory!" 1>&2
	exit 1
fi

cd "${TDDIR}"

docker run -v "${PWD}:/data" --rm -ti jbigot/glcs_td1
