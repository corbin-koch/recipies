#!/bin/bash
# reads in all the .rtf files from first passed arg and writes them to the second passed arg as .md after a converting.
# usage: rft_to_markdown <full-read-path> <write-dir>
# example: rtf_to_markdown $(pwd) mds/

READ_DIR=$1
WRITE_DIR=$2

write_single () {
MD_FILENAME="$(echo $1 | cut -d. -f1 ).md"
textutil -convert html $1 -stdout | pandoc -f html -t markdown -o $MD_FILENAME
mv $MD_FILENAME $2
echo -e "converted\n $1\n to markdown and can be found in $2"
}

for FILE in $READ_DIR/*.rtf; do 
write_single $FILE $WRITE_DIR
done

echo -e "\n\n...finished conversion"

