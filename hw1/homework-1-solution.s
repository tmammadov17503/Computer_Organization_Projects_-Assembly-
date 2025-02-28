.global initializing_of_program
initializing_of_program:

    mov r0, #2  // in the given step we start by putting the value of the 2 in the register r0 mainly making r0 == 2
    mov r1, #10  // we have the same here just now the value of 10 inside the register of r1, so r1 == 10

loop_and_compare_function: // previouly in the code we had steps. Instead of making steps one by one we can just have proper loop like some for loop in python
    cmp r0, r1 // the cmp command here stands for comparing and so we compare the register r1 and the register r2. In short, we compare 2 == 10
    beq finish_program // beq here stands for branch equals to and we know that the branch is related to if statement in some other programming languages
    add r0, r0, #2 // so if the beq works it uses the finish_program function. For the first 4 times it will not exit and only then it will start
	// mainly the code checks and says while 2 != 10, add value of 2 to r0 (r0 += 2) and it will continue until we exit the loop in case when r0 == r1
    b loop_and_compare_function // we must not forget about the b which allows us to again initialize the loop, without b it will not start the loop again

finish_program:
    svc 2 // this is the final step the exit part whcih works only when r0 is equal to r1 and the svc 2 is the part that always has to be written in the exit
	
// Overall, this code mainly makes the structure of the code more readable and efficient in use
// This can be checked by cpulator. If we use our old program we can see that the lr (link register) is equal to 72 in unsigned decimal value
// While the new code provides only 28 with the unsigned decimal value, meaning that the new code is about 3 times more efficient 
