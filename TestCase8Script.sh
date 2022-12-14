java CouncilMember testing 8
DIFFONE=$(diff Testing/TestCase8Output.txt Testing/TestCase8ExpectedOutput_one.txt)
DIFFTWO=$(diff Testing/TestCase8Output.txt Testing/TestCase8ExpectedOutput_two.txt)
DIFFTHREE=$(diff Testing/TestCase8Output.txt Testing/TestCase8ExpectedOutput_three.txt)
if [ "$DIFFONE" = "" ] || [ "$DIFFTWO" = "" ] || [ "$DIFFTHREE" = "" ]
then
    echo -e "Test Case 8: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 8: FAILED." >> Testing/TestingLog.txt
fi
