java CouncilMember testing 3
DIFF=$(diff Testing/TestCase3Output.txt Testing/TestCase3ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 3: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 3: FAILED." >> Testing/TestingLog.txt
fi
