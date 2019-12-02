#!/bin/bash

function Relative {

    local AWK='''
BEGIN { reRel = "[\\\\]relative[ ]+c"; }
function cntBrace (tx, Local, n) {
    n += gsub ("{", "{", tx);
    n -= gsub ("}", "}", tx);
    return (n);
}
$0 ~ reRel || nBrace > 0 { print; nBrace += cntBrace( $0); }
'''
    awk -f <( echo "${AWK}" ) "${@}"
}

#### Script Body Starts Here.

for file in *.ily; do

    Relative "$file" > "${file}~"

    ly indent "$file~" --output "$file"

done


