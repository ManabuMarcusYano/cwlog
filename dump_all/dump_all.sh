#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${DIR}"

#echo args=$@
OPT=""
i=""
p=""
while getopts ":i:p:" OPT ; do
    #echo $OPT
    #echo $OPTARG
    case "$OPT" in 
        "i")
            i=$OPTARG
            ;;
        "p")
            p=$OPTARG
            ;;
    esac
done

echo "Start to log chatwork..."
rooms=$(goodbye_chatwork -i $i -p $p | cut -d ' ' -f1)
set -- $rooms

for room in "$@" 
do 
    echo $room
    goodbye_chatwork -i $i -p $p -x $room
done 

exit