java CouncilMember testing 13
DIFFONE=$(diff Testing/TestCase13Output.txt Testing/TestCase13ExpectedOutput_one.txt)
DIFFTWO=$(diff Testing/TestCase13Output.txt Testing/TestCase13ExpectedOutput_two.txt)
DIFFTHREE=$(diff Testing/TestCase13Output.txt Testing/TestCase13ExpectedOutput_three.txt)
if [ "$DIFFONE" = "" ] || [ "$DIFFTWO" = "" ] || [ "$DIFFTHREE" = "" ]
then
    echo -e "Test Case 13: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 13: FAILED." >> Testing/TestingLog.txt
fi
