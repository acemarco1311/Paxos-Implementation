java CouncilMember testing 10
DIFF=$(diff Testing/TestCase10Output.txt Testing/TestCase10ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 10: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 10: FAILED." >> Testing/TestingLog.txt
fi
