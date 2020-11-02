#change sub to 1 in order to submit your jobs
sub=0
i=1
#change total for total numer of jobs to the desired
total=200
herepos=`pwd`
while [ $i -le ${total} ]
do
    rm fluka_example_${i}.inp
    # create a new random number to change the randomize seed for each run
    rn=`perl -e 'my $minimum = 1E8 ; my $range = 9E7 ; my $random_number = int(rand($range)) + $minimum ; print $random_number '`
    echo "shield run number = " $rn
    #the randomize flag is in the line number 9 inside the input file : change accordingly
    perl -pe "s/.*/RANDOMIZ          1.$rn./ if $. == 9" < fluka_example.inp > fluka_example_${i}.inp

    echo "PROJECT: radcon" > farmrun_fluka_example_${i}.jsub 
    echo "TRACK: simulation" >> farmrun_fluka_example_${i}.jsub
    # change name in order to track easier the job online
    echo "JOBNAME: HallC_cam"${i} >> farmrun_fluka_example_${i}.jsub
    # executable to be run: modify the executable so the files are copied in the right place
    echo "COMMAND: "${herepos}"/run_fluka_multiple.sh" >> farmrun_fluka_example_${i}.jsub
    echo "MEMORY: 2000 MB" >> farmrun_fluka_example_${i}.jsub
    echo "OS: centos77" >> farmrun_fluka_example_${i}.jsub
    #this is pointing to the new files that we have just created
    echo "INPUT_FILES: "${herepos}"/fluka_example_"${i}".inp" >> farmrun_fluka_example_${i}.jsub
    if [ ${sub} -eq "1" ] 
	then
	echo "Submitting job n." $i
	jsub farmrun_fluka_example_${i}.jsub
    fi
    i=$[$i+1]
done
