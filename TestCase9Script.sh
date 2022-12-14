java CouncilMember testing 9
DIFF=$(diff Testing/TestCase9Output.txt Testing/TestCase9ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 9: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 9: FAILED." >> Testing/TestingLog.txt
fi
