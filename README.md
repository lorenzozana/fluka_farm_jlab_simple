# Example for running Fluka at Jlab

Edit the files accordingly

*  	fluka_example.inp : example of an input files (NB the RANDOM flag at line number 9)
*   submit_fluka.sh : Create new input files with new Random seeds, crate a submitting file and submit it to the farm
*   run_fluka.sh : Execute Fluka inside the farm and copy the output to a desired location (edit accordingly)
*   run_fluka_multiple.sh : Same as before, but with multiple inputs in the same node (they are going to be execute sequentially)
