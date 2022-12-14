java CouncilMember testing 4
DIFF=$(diff Testing/TestCase4Output.txt Testing/TestCase4ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 4: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 4: FAILED." >> Testing/TestingLog.txt
fi
