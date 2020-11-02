#!/bin/tcsh
set i=`ls -1 *.inp`
set NAME=`echo $i | gawk '{sub(/.inp/,"",$0);printf("%s",$0)}'`
echo "Running "$NAME
echo ${FLUPRO}/flutil/rfluka "-e" /home/zana/Hall-A/Fluka-Moller/moller.exe -M 1 $NAME
${FLUPRO}/flutil/rfluka -e /home/zana/Hall-A/Fluka-Moller/moller.exe -M 1 ${NAME}
cp *.* /volatile/halla/moller12gev/zana/
# set fluka to the right location and modify the place where we can copy the files
