java CouncilMember testing 6
DIFF=$(diff Testing/TestCase6Output.txt Testing/TestCase6ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 6: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 6: FAILED." >> Testing/TestingLog.txt
fi
