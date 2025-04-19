.global _start_of_program

_start_of_program:
    ldr r0, =test_case_1 // In the given first line we just load the adress of the test_case_1 that was provided in the assignment
    mov r1, #0 // This is our starting point mainly as we initialize regiter r1 with the value 0, and the 0 value here is considered an offset which we will be using later                 
    bl to_upper_function // We use here bl which stands for branch with link due to the fact that we need to return here and continue with functions
	// mainly it says to jump to the to_upper_function, and when finished with that function, come back to the next instruction after this one.
	// data (return adress) is stroed in link register or in short lr
	
    ldr r0, =test_case_2 // Here we now load the address of test_case_2 for lowercase conversion
    mov r1, #0 // As we reset the address, we have to do the same with the index that we had
    bl to_lower_function // And we just call to_lower function

    b end_current_program // This is the final part where we end our program. B stands for branch 

// This is the function that is related to converting lowercase letters to upper case ones, it works with test_case_1.
to_upper_function:
read_upper_loop: // this is considered our loop for the to_upper_function 
    ldrb r2, [r0, r1] // mainly what we do here is we just load the byte character from memory into the register. r0 is the base adress of the provided string and r1 is the offset and we know that it is equal to 0 as we indicated in the start
    cmp r2, #0 // cmp states for compare and we just compare the register r2 with the value of 0. The o value here means the null in terminator
	// in short, this line checks if we reached the end of the string or not. 
    beq return_upper_function // beq stands for branch if equal and in the given context it checks if the r2 equal to 0 (meaning we reached the end of the string), just exit the loop and return from the function

    cmp r2, #'a' // Here I used the elimination part mainly if the charackter that we have is not between a and z and not lower just skip it.
	// we check first if below 'a' ASCII which is 97
    blt skip_store_upper_loop // blt stands for branch less than and here we check if the character is less than 'a', we just skip and go to the next character with the help of skip_store_upper_loop function
    cmp r2, #'z' // again we just compare character with the z which in ASCII is 122
    bgt skip_store_upper_loop // bgt = branch greater than, and here we understand that if the character is greater than z, than means that it is no longer a lowercase one
	// same as before ot just skips if it is beyond z
	
    sub r2, r2, #32 // now if we see that our character is indeed between 'a' and 'z' we just have to substract 32 because for example:
	// let us take 'A' it has ASCII = 65 and 'a' that has ASCII = 97. so 97 - 65 = 32
    strb r2, [r0, r1] // in the end if everything is successful, we store the updated uppercase letter back into memory at the same position

skip_store_upper_loop:
    add r1, r1, #1 // we increase our offset by one, so we can not move to next character
    b read_upper_loop // repeats the loop related to read_upper_loop

return_upper_function:
    bx lr // bx stands for branch to register and the lr is the link register that we were talking about previously. the link register contains the return address from the earlier bl instruction
	// and this returns us back to the _start_of_program fucntion
	
// This is the function that is related to converting uppercase letters to lowercase ones, it works with test_case_2.
to_lower_function:
read_lower_loop: // same here, this is considered our loop for the to_lower_function 
    ldrb r2, [r0, r1] // in this line, we load the current byte from memory using base address r0 and offset r1. It is the same as accessing a string character like str[i]
    cmp r2, #0 // here we compare the value in r2 with 0, which is the ASCII representation of null terminator '\0'
	// in short, this line checks whether we reached the end of the string or not, as every string in C ends with a null character
    beq return_lower_function // beq stands for branch if equal. So if the comparison showed that r2 equals 0 (end of string), we just exit the loop and return back to the previous point

    cmp r2, #'A' // Here, just like before, we apply elimination to skip characters that are not uppercase
	// this checks whether the current character is below 'A' (ASCII value 65)
    blt skip_store_lower_loop // if the character is less than 'A', it's not uppercase, so we skip conversion and jump to skip_store_lower_loop
    cmp r2, #'Z' // now we compare with 'Z' (ASCII value 90)
    bgt skip_store_lower_loop // if the character is greater than 'Z', it's also not uppercase, so again we skip and go to next character

    add r2, r2, #32 // if we confirmed that the character is between 'A' and 'Z', we convert it to lowercase
	// we add 32 to convert it, because 'a' = 'A' + 32 in ASCII. Example: 'A' = 65, 'a' = 97
    strb r2, [r0, r1] // now we store the new lowercase character back into memory in the same position in the string

skip_store_lower_loop:
    add r1, r1, #1 // move to the next character by increasing the offset by 1
    b read_lower_loop // go back to the beginning of the loop to check the next character

return_lower_function:
    bx lr // here we return back to the place we came from by using bx lr. lr is the link register that stores the return address from the bl instruction
	// in short, this line ends the function and jumps back to _start_of_program

end_current_program: // final point where we use svc #2 command to finish and end the program
    svc #2 

.data // the data that is provided to us in the instructions 
	test_case_1: .asciz "... This STRIng conTainS test data: likE the AT @ SIGn and the PERCent % sign TOo!"
	test_case_2: .asciz "Hello, this is the second test case and I will make it in uppercases for checking. WELL, HERE IS ANOTHER STRING TEST CASE AND IT HAS SYMBOLS, NUMBERS 12345, AND UPPERCASE LETTERS TOO!"
