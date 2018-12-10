#!/bin/bash
#Usage: ./merge_files_usbdx.sh basename_out bin_number
NAME=`echo $1`
BIN=`echo $2` 
rm ${NAME}_${BIN}.txt
ls -1 *_fort.${BIN} > ${NAME}_${BIN}.txt
echo >> ${NAME}_${BIN}.txt
echo ${NAME}".dat" >> ${NAME}_${BIN}.txt
# Create the files with the path to the results
nice ${FLUPRO}/flutil/usxsuw < ${NAME}_${BIN}.txt >$NAME.log
