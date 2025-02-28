# Homework 1 - CSCI 2406 - Taghi Mammadov (17503)

## **1. Explanation of the Initial Code**

The original program provided to us is a simple loop structure implemented in **ARM Assembly** that increments a value in register `r0` until it reaches the value stored in register `r1`. 

`These are the steps of execution:`

1. **Initialization Phase**:
   - The register `r0` is assigned the value of `2`.
   - The register `r1` is assigned the value of `10`.

2. **Execution Phase**:
   - The starts to check if register `r0` equals to register `r1` at multiple steps starting from `step1` to `step5`.
   - If the register `r0` is not equal to the register `r1`, it adds value of `2` to `r0` and proceeds to the next step.
   - When the register `r0` becomes the value of `10`, it jumps right to `step10` and executes the system by calling (`svc 2`) to terminate the program.

3. **Main Problems in an initial code**:
   - **Too many redundant steps**: The first thing that can be immediately seen in this code is that it has many `repetitions`, mainly comparison and addition instead of using one loop
   - **Poor scalability**: If `r1` is changed, the number of steps must be manually modified one by one which leads us to the third problem `Inefficiency`
   - **Huge Inefficiency**: The program executes unnecessary instructions, mainly leading to wasted processing power.

---

## **2. Code Improvement Using Branching & Iteration**

To enhance efficiency and readability, the new version of the program incorporates with **branching and iteration**.

`The main modifications include:`

1. **Using a Loop Instead of Manual Steps**:
   - The updated version of the code implements a structured loop instead of steps and it continuously increments the register `r0` until it reaches the same value as the register `r1`.

2. **Efficiency**:
   - Instead of having multiple `cmp` instructions, the new code has a single `cmp` used within the loop and `beq` (branch if equal) ensures the program exits the loop only when `r0 == r1`.

3. **Reduced Instruction Count**:
   - Testing in **cpulator** shows the **link register (LR) value decreased from 72 to 28**, indicating the program is approximately **3 times more efficient**.

---
