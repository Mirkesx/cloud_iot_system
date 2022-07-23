#!/bin/bash

if [ -z "$1" ] ; then
    echo "Please enter an integer"
    exit 1
fi

if [ "$1" -lt 1 ] ; then
    echo "Please enter an integer greater than 0"
    exit 1
fi

rm *.txt

N="$1"
URL="https://baconipsum.com/api/?type=meat-and-filler?paras=$N&format=text"
wget -O lorem.txt $URL
cat lorem.txt | tr -d '\n' | tr '.' '\n' > lorem-tmp.txt


declare -a rows_having_i_words

echo "Init array"
for i in $(seq 0 $((N-1))); do
    rows_having_i_words[$i]=0
    rows_from_file[$i]=""
done


echo "Counting words in each row"
filename="lorem-tmp.txt"
while read -r line
do
    echo $line > line-tmp.txt
    #echo $(wc -w line-tmp.txt | awk '{print $1;}')
    num_row=$(wc -w line-tmp.txt | awk '{print $1;}')
    (( rows_having_i_words[$num_row]++ ))
    rows_from_file[$num_row]="${rows_from_file[$num_row]}$line. \n"
done < $filename

echo "Print results and create files"
for i in $(seq 0 $((N-1))); do
    if [ ${rows_having_i_words[$i]} -ne 0 ]; then
        echo "${rows_having_i_words[$i]} righe di lunghezza ${i}"
        touch "$i.txt"
        echo -e ${rows_from_file[$i]} >> "$i.txt"
    fi
done