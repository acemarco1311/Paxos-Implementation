java CouncilMember testing 12
DIFFONE=$(diff Testing/TestCase12Output.txt Testing/TestCase12ExpectedOutput_one.txt)
DIFFTWO=$(diff Testing/TestCase12Output.txt Testing/TestCase12ExpectedOutput_two.txt)
DIFFTHREE=$(diff Testing/TestCase12Output.txt Testing/TestCase12ExpectedOutput_three.txt)
if [ "$DIFFONE" = "" ] || [ "$DIFFTWO" = "" ] || [ "$DIFFTHREE" = "" ]
then
    echo -e "Test Case 12: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 12: FAILED." >> Testing/TestingLog.txt
fi
