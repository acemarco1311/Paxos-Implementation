java CouncilMember testing 7
DIFFONE=$(diff Testing/TestCase7Output.txt Testing/TestCase7ExpectedOutput_one.txt)
DIFFTWO=$(diff Testing/TestCase7Output.txt Testing/TestCase7ExpectedOutput_two.txt)
if [ "$DIFFONE" = "" ] || [ "$DIFFTWO" = "" ]
then
    echo -e "Test Case 7: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 7: FAILED." >> Testing/TestingLog.txt
fi
