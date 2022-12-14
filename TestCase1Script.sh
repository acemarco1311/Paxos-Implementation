java CouncilMember testing 1
DIFF=$(diff Testing/TestCase1Output.txt Testing/TestCase1ExpectedOutput.txt)
if [ "$DIFF" = "" ]
then
    echo -e "Test Case 1: PASSED." >> Testing/TestingLog.txt
else
    echo -e "Test Case 1: FAILED." >> Testing/TestingLog.txt
fi
