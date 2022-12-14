java CouncilMember testing 2
DIFF=$(diff Testing/TestCase2Output.txt Testing/TestCase2ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 2: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 2: FAILED." >> Testing/TestingLog.txt
fi
