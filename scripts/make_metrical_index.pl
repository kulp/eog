#!/bin/bash
cat $@ |
    (IFS='	';
    while read meter list
    do
        echo "$meter"
        (IFS=' ';
        for file in $list
        do
            echo -n ' '
            if [[ -s headers/$file.tunename ]]
                then
                cat headers/$file.tunename
                echo "	$file"
            else
                echo 'ZZZAlso Tune '$file
            fi
        done) | sort
    done)
