--------------------------------------------------------------
		Palm Print Recognition Technology
--------------------------------------------------------------

The following files are required for the recognition system to work in total[INCLUDED]:
-> invoke.m
-> lbp_lmep.m
-> lbp_lmep_local.m
-> neighnour.m
-> checker_global.m
-> checker_local.m

-> checker.m - (This checking function gives exact precision value for a single data input file. This should be used to check the actual precision of the algorithm. This value is greater than the one from the check.m function as it is not a averaged value.)

-> check.m - (This checking function gives avg. precision calculated over a range of data inputs, which was used to calculate datapoints for the graph.)

-> feature_database_local_F.mat - (This is an optional file that is included. It contains the complete training feature set for 100 persons palm recognition stored in .mat format.)

*NOTE* The 'feature_database_local_F.mat' file is not included as it is calculated from the input images.

Running the project
-------------------

1. Give proper formated path of the input file in 'invoke.m' file. As I had to calculate features for 1000 images I took a loop. The file names should be in such a format that they can be iterated in a loop.

2. The invoke file completes the feature extraction of all the training set and stores the training feature set in the form of a .mat file [The .mat file was included as an example for this case.]

3. Now to calculate the recognition and its accuracy, run 'check.m' file.
 
4. This file completes the recognition of the image and then calculates the accuracy of its recognition value and gives a floating number as an output indicating the accuracy.

*NOTE*
The code is written in such a way that it is runtime friendly and it will suggest many paths during the runtime for branching out and obtaining different kinds of patterns for same the problem.

THOUGH THE CODE IS APPLIED FOR "PALM PRINT RECOGNITION" IT CAN BE LITTERALLY USED FOR ANY FORM OF RECOGNITION AS THE CODE IS NOT PALM PRINT SPECIFIC AND WAS WRITTEN WITH SUCH AN IDEA IN THOUGHT THAT IT WOULD SERVE A GREATER PURPOSE.

----------------------------------------END---------------------------------------
