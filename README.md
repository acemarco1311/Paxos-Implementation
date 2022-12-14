**Name: Nguyen Thanh Toan LE (a1816586) **

# Introduction
This assignment uses Java 8, implementing Paxos algorithm between Council Members.  
Each Council Member is an Acceptor (responds to requests from the Proposers), and also a Propose (starts proposing/sending requests to all members in the protocol).  

# How to compile? 
All the Java files can be compiled by using the command: `javac -target 8 -source 8 *.java`  

# How to run files? 
The only file that needs to be run is `CouncilMember.java`. 
`CouncilMember.java` is provided in 2 mode: `normal` and `testing`.  
To run program in normal mode, please use the command: `java CouncilMember normal`  
To run program in testing mode, please use the command: `java CouncilMember testing testCaseIndex`  
Please replace testCaseIndex by the index of the test case, so if you want to run test case 1, please use: `java CouncilMember testing 1`  
In the normal mode, there will be 9 members (all of them has the same latency profile: Immediate), 1 of them will propose value '0000'  
Please read below for more information relating to test cases.  

# How to run a specific test case?  
There are 13 test cases provided, if you want to run a test case, please use: `sh TestCaseXScript.sh`  
Please replace X by the number of the test case, for example, if you want to run test case 1, please use: `sh TestCase1Script.sh`  
The output of the test case will be written to `Testing/TestCaseXOutput.txt`, then the output of the test case will be compared to the expected output file `Testing/TestCaseXExpectedOutput.txt` then the result of the test case will be written to `Testing/TestingLog.txt`.  
Some of the test cases will has multiple expected outputs because multiple proposers proposed at the same time so the output is expected to be one of the proposed values.  

# How to run all the test cases at once?  
To run all 13 test cases at once, please use the command: `sh OverallTestScript.sh`  
The mechanism is the same as when you run test cases one by one.  

# Note on test cases
Noted that it will take time to run all the test cases. It might take very long, however, I can assure that it will produce an output eventually :)))  

# Evidence of working Paxos algorithm  
Each phase of the Paxos will be printed out in the terminal so please keep track of the terminal to see how the Paxos voting is going.  

# Manual Testing  
You can create your own test case in the main function of `CouncilMember.java` file. You will need to create all the members in the protocol of your test case. Before proposing, you need to set the chosen value of the Proposer by using the function `setChosenValue(newValue)`. Then call `propose()` function on the Proposer object.  
Please have a look at the provided test cases for more information.  

# Architecture Explained
## Council Member  
Each Council Member has a member id which starts from 1. Council Member takes a string, which indicates the latency types, and an ArrayList of String which is the server socket information of all members in the protocol. The size of the ArrayList indicates the total number of members in the protocol, hence, the majority will be calculated based on the size of ArrayList.  
A member can be either one of four latency types: Immediate/Medium/Late/Never. 'Immediate' type will respond to the request immediately, 'Medium' will respond to requests after 5 seconds, 'Late' will respond to requests after 15 seconds, 'Never' will not respond to any request. The timeout is 12 seconds so that if a member is 'late' profile, all the responses of 'late' members will not be considered.  
The string that indicates the server socket information of a member is in form: "hostname:port".  
The starting port is 2000, therefore, the member 1 will listen on port 2001, member 2 will listen on port 2002, etc.  
When a Council Member is created, a thread RunMemberServer will be created to run the server for the member so that the member can act as an Acceptor who receive and respond to requests from a Proposer.  
A Council Member can be a Proposer who will start a Paxos round by using function propose().  
A Council Member can also be run as a Thread which will start proposing just like calling propose() function. However, this helps us in the testing part where multiple Proposers can propose at the same time. 
Before proposing, the Proposer needs to set the value for the proposal by calling function setChosenValue().  

# Test Cases 
## Test Case 1  
To run this test case, please use command: `sh TestCase1Script.sh`  
The output of this test case will be in: `Testing/TestCase1Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 9 members in this test case, all of them has the 'Immediate' profile. Then the member 1 will propose value 13. So that the expected output is 13 because this is the value proposed by the member 1.  
## Test case 2  
To run this test case, please use command: `sh TestCase2Script.sh`  
The output of this test case will be in: `Testing/TestCase2Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 9 members in this test case, members have different latency profiles. Then the member 1 will propose value 08. So that the expected output is 08 because this is the value proposed by member 1.   
## Test case 3  
To run this test case, please use command: `sh TestCase3Script.sh`  
The output of this test case will be in: `Testing/TestCase3Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 13 members in this test case, members have different latency profiles. Then the member 2 will propose value 11. So that the expected output is 11 as this is the value proposed by member 2.  
## Test case 4  
To run this test case, please use command: `sh TestCase4Script.sh`  
The output of this test case will be in: `Testing/TestCase4Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 8 members in this test case, all members has 'Immediate' latency profile. Then the member 8 will propose value 2001. So that the expected output is 2001.  
## Test case 5  
To run this test case, please use command: `sh TestCase5Script.sh`  
The output of this test case will be in: `Testing/TestCase5Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 9 members in this test case, all members has 'Immediate' latency profile. Then the member 1 will propose value 2001. After member 1 completed proposing, member 2 will propose value 1980. The expected output will be 2001 as this is the value proposed by member 1. Although the member 2 proposed value 1980 but because the value 2001 proposed by member 1 has been accepted by the majority so that member 2 must take 2001 as the value.  
## Test case 6  
To run this test case, please use command: `sh TestCase6Script.sh`  
The output of this test case will be in: `Testing/TestCase6Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 15 members in this test case, members have different latency profiles. Member 1 will propose value 0808. After member 1 completed proposing, member 2 will propose value 0808. After member 2 completed, member 3 will propose value 1311.  
The expected output is the value proposed by member 1 as member 1 propose first and its proposed value got accepted by the majority so all the following proposer must use value 0808.  
## Test case 7  
To run this test case, please use command: `sh TestCase7Script.sh`  
The output of this test case will be in: `Testing/TestCase7Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 9 members in this test case, members have the same latency profile 'Medium'. Member 1 (proposes value 2001) and member 2 (proposes value 1980) at the same time. So the expected output is either 2001 or 1980.  
## Test case 8  
To run this test case, please use command: `sh TestCase8Script.sh`  
The output of this test case will be in: `Testing/TestCase8Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 13 members in this test case, members have different latency profiles. Member 1 (proposes value 1999), member 2 (proposes value 1980) and member 3 (proposes value 1979) propose at the same time. So the expected output is either 1999, 1980 or 1979.  
## Test case 9  
To run this test case, please use command: `sh TestCase9Script.sh`  
The output of this test case will be in: `Testing/TestCase9Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 13 members in this test case, members have different latency profiles. Member 1 will send a Prepare message without Accept/Decide following up. After that, member 2 will propose value 1311. Therefore, the expected output is 1311.  
## Test case 10
To run this test case, please use command: `sh TestCase10Script.sh`  
The output of this test case will be in: `Testing/TestCase10Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 15 members in this test case, members have different latency profiles. Member 1 will propose value 2003, then go offline (will not propose or receive any request). After that, member 2 (proposes value 1999) and member 3 (proposes value 1980) at the same time. The expected output is the first value 2003 proposed by member 1.  
## Test case 11 
To run this test case, please use command: `sh TestCase11Script.sh`  
The output of this test case will be in: `Testing/TestCase11Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 15 members in this test case, members have different latency profiles. Member 1 (proposes value 2001) and member 2 (proposes value 2003) at the same time. In the middle of the Paxos (2 seconds after the Paxos started), member 10 and member 9 go offline (will no longer get any request). After member 1 and member 2 completed, they also go offline.  
After that, member 4 will propose value 1980.  
The expected output is either 2001 or 2003 because member 1 and member 2 proposed first and they proposed at the same time.  
## Test case 12  
To run this test case, please use command: `sh TestCase12Script.sh`  
The output of this test case will be in: `Testing/TestCase12Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 20 members in this test case, members have different latency profiles. Member 4 (proposes value 1980), member 5 (proposes value 1999) and member 6 (proposes value 2001) at the same time.  
In the middle of the Paxos (3 seconds after the Paxos started), member 1, member 9 and member 16 go offline. 4 seconds later, they go back online.  
The expected output is either 1980, 1999 or 2001.  
## Test case 13  
To run this test case, please use command: `sh TestCase13Script.sh`  
The output of this test case will be in: `Testing/TestCase13Output.txt`  
The result of this test case will be in: `Testing/TestingLog.txt`  
There are 20 members in this test case, members have different latency profiles. Member 4 (proposes value 1980), member 5 (proposes value 1999) and member 6 (proposes value 2001) at the same time.  
In the middle of the Paxos (4 seconds after the Paxos started), all the members go offline. 7 seconds later, they go back online.  
The expected output is either 1980, 1999 or 2001.  

## Test case 14
To run this test case, please use command: `sh TestCase14Script.sh`  
The output of this test case will be in: `Testing/TestCase14Output.txt`  
The result of this this test case will be in: `Testing/TestingLog.txt`  
There are 20 members in this test case, members have different latency profiles. Member 4 (proposes value 1980), member 5 (proposes value 1999), and member 6 (proposes value 2001) at the same time.  
In the middle of the Paxos (4 seconds after the Paxos started), all the members go offline for 13 seconds (over the timeout 12 seconds). We will test how the proposers handle the failures scenario when they cannot get any response within the timeout 12 seconds. 
The expected output is either 1980, 1999 or 2001 because 3 proposers proposed at the same time.  