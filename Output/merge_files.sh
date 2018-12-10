#!/bin/bash
#Usage: ./merge_files.sh basename_out bin_number
NAME=`echo $1`
BIN=`echo $2` 
rm ${NAME}_${BIN}.txt
ls -1 *_fort.${BIN} > ${NAME}_${BIN}.txt
echo >> ${NAME}_${BIN}.txt
echo ${NAME}".bnn" >> ${NAME}_${BIN}.txt
# Create the files with the path to the results
nice ${FLUPRO}/flutil/usbsuw < ${NAME}_${BIN}.txt >$NAME.log
