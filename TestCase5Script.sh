java CouncilMember testing 5
DIFF=$(diff Testing/TestCase5Output.txt Testing/TestCase5ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 5: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 5: FAILED." >> Testing/TestingLog.txt
fi
