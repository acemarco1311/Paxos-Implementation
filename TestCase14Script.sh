java CouncilMember testing 14
DIFFONE=$(diff Testing/TestCase14Output.txt Testing/TestCase14ExpectedOutput_one.txt)
DIFFTWO=$(diff Testing/TestCase14Output.txt Testing/TestCase14ExpectedOutput_two.txt)
DIFFTHREE=$(diff Testing/TestCase14Output.txt Testing/TestCase14ExpectedOutput_three.txt)
if [ "$DIFFONE" = "" ] || [ "$DIFFTWO" = "" ] || [ "$DIFFTHREE" = "" ]
then
    echo -e "Test Case 14: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 14: FAILED." >> Testing/TestingLog.txt
fi
