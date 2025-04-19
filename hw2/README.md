# Homework 2 - CSCI 2406 - Taghi Mammadov (17503)

## **1. Overview of the Assignment**

The goal of this assignment was to work with **ARM Assembly language** and apply character transformations to a string. Specifically:

- Iterate over `test_case_1` and convert all **lowercase letters (a–z)** to **uppercase (A–Z)** using a custom `to_upper_function`.
- Then, iterate over the same `test_case_1` and convert all **uppercase letters (A–Z)** to **lowercase (a–z)** using a separate `to_lower_function`.

---

## **2. My Approach to the Solution**

### Step-by-Step Execution:

1. **Initial Setup**:
   - The base address of `test_case_1` is loaded into register `r0`.
   - Register `r1` is set to `0` to represent the index (offset).

2. **Conversion to Uppercase**:
   - The program branches with link (`bl`) to `to_upper_function`.
   - A loop checks each character one-by-one:
     - If the character is between `'a'` and `'z'`, we subtract 32 from its ASCII value.
     - Otherwise, the character is skipped.
   - The result is written back to the same memory location.

3. **Conversion to Lowercase**:
   - After returning from `to_upper_function`, we reload the address of `test_case_1` and reset the index.
   - A second function, `to_lower_function`, is called.
   - If the character is between `'A'` and `'Z'`, we add 32 to convert it to lowercase.
   - Again, the result is saved in place.

4. **Termination**:
   - The program ends using the `svc #2` system call.

---

## **3. Code Highlights**

### Registers Used:
- `r0`: Holds the base address of the string
- `r1`: Offset/index used to access characters
- `r2`: Temporarily holds each character for checking/modification

### Functions:
- `to_upper_function`: Handles a–z → A–Z
- `to_lower_function`: Handles A–Z → a–z
- Each function uses condition checking such as `cmp`, `blt`, `bgt`, and exits on null terminator.

### Looping:
- Loops use labels like `read_upper_loop` and `read_lower_loop`
- Branching is done with `b` and `beq` for control flow

---

## **4. Before and After – Screenshots**

### Before Transformation (test_case_1 and test_case_2 in original states):

![Before Screenshot](Before.png)

### After Transformation (converted to upper then lower):

![After Screenshot](After.png)

---
