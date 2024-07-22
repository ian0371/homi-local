#!/bin/bash

restart() {
    if [ "$1" == "0" ]; then
        len=$(ls -1d "$ROOTDIR/output/cn"* | wc -l)
        vals=$(seq 1 $len)
    else
        vals=$1
    fi

    for i in $vals; do
        echo "Restarting cn$i..."
        pushd "$ROOTDIR/output/cn$i"
        bin/kcnd restart
        popd
    done
}
