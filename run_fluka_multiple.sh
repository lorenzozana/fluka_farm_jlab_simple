export GCC=/apps/gcc/7.2.0
export PATH=${GCC}/bin:${PATH}
export LD_LIBRARY_PATH=${GCC}/lib64:${LD_LIBRARY_PATH}
export FLUPRO=/home/zana/Fluka
export FLUFOR=gfortran
export FLUKA=/home/zana/Fluka
for i in $(ls -1 *.inp)
do
    NAME=`echo $i | gawk '{sub(/.inp/,"",$0);printf("%s",$0)}'`
    echo "Running "$NAME
    nice ${FLUPRO}/flutil/rfluka -M 1 $NAME
done 
cp *fort.* /volatile/clas/clasg9/zana/Data/
# set fluka to the right location and modify the place where we can copy the files