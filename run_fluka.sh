i=`ls -1 *.inp`
NAME=`echo $i | gawk '{sub(/.inp/,"",$0);printf("%s",$0)}'`
echo "Running "$NAME
nice ${FLUPRO}/flutil/rfluka $NAME 
cp *fort.* /volatile/clas/clasg9/zana/Data/
# set fluka to the right location and modify the place where we can copy the files