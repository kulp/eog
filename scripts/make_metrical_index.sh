#!/bin/bash
export LC_ALL=C
(cat $@ ; echo x x) | # need one line of garbage at end to drain pump
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
                echo -e 'zzzAlso Tune\t'$file
            fi
        done) | sort -d
    done) |
    (IFS='	';
    prev=
    list=()
    had_prev=0
    while read first rest
    do
        if [[ $first = $prev ]]
        then
            # duplicate use of tune name
            list+=($rest)
        else
            # either a meter line or the first of a new set of tune names
            if [[ ${#list[@]} = 0 ]]
            then
                # meter line
                echo -ne "\n$prev"
                had_prev=0
            else
                if [[ $prev = " zzz"* ]]
                then
                    if (( had_prev ))
                    then
                        prev="Also Tune"
                    else
                        prev=Tune
                    fi

                    if [[ ${#list[@]} > 1 ]]
                    then
                        prev+=s
                    fi
                    prev=" $prev"
                fi
                echo -ne "\n$prev\t${list[0]}"
            fi
            for f in "${list[@]:1}"
            do
                echo -ne ", $f"
            done

            if [[ ${first# } = $first ]]
            then
                # meter line
                list=()
                had_prev=0
            else
                # song line
                list=($rest)
                had_prev=1
            fi

            if [[ ${prev# } = $prev ]]
            then
                # meter line
                had_prev=0
            else
                # song line
                had_prev=1
            fi

        fi
        prev=$first
    done ; echo) |
    sed 's/EOGa0*/Additional Tune /g; s/EOG0*//g'
