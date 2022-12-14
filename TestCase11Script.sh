java CouncilMember testing 11
DIFFONE=$(diff Testing/TestCase11Output.txt Testing/TestCase11ExpectedOutput_one.txt)
DIFFTWO=$(diff Testing/TestCase11Output.txt Testing/TestCase11ExpectedOutput_two.txt)
if [ "$DIFFONE" = "" ] || [ "$DIFFTWO" = "" ]
then
    echo -e "Test Case 11: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 11: FAILED." >> Testing/TestingLog.txt
fi
