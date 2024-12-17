# Lambda To C Compiler

## Overview

This project is a **typed lambda calculus to C compiler** written in Haskell. It translates lambda expressions with type annotations into equivalent C code. The generated C code is ready for compilation using standard C compilers like GCC or Clang.

### Key Features

- Supports typed lambda expressions with simple annotations.
- Converts high-level functional constructs into C functions and calls.
- Outputs clean, human-readable C code.
- Designed for learning and experimentation with functional programming and compiler/interpreter design during my programming language classes at UFFS.

## Requirements

- **GHC (Glasgow Haskell Compiler)**: Required to run the Haskell code.
- **C Compiler**: To compile the generated C code (e.g., GCC or Clang).
- **Happy**: `Parser.y` - Happy is a parser generator system for Haskell, similar to the tool yacc for C.

## Project Structure

- `Main.hs`: The main entry point of the compiler.
- `Compiler/`: Contains the core logic of the lambda calculus to C translation.
- `Examples/`: Includes example input files for testing and demonstration.
- `README.md`: Project documentation.

## Usage

1. Clone or download the repository.
2. Ensure you have GHC installed on your system.
3. Run the compiler using the following command:

   ```bash
   runghc Main.hs < ./Examples/code.abp
   ```

   Replace `./Examples/code.abp` with the path to your input file.

## Example

### Input

A sample input file (`code.abp`) might look like this:

```haskell
-- this is a comment
\(x: (Num -> Num) -> (x 7) + 1) \(y: Num -> y * 2)
```

### Command

```bash
runghc Main.hs < ./Examples/code.abp
```

### Output

The output is a C program `main.c`:

```c
#include <stdio.h>
#define true 1
#define false 0
typedef short bool;

int fy(int y){ return y * 2; }
int fx(int (*x)(int)){ return ((x)(7)) + 1; }

int main() {
    int fxfy = (fx)(fy);
    printf("%d\n", fxfy);
    return 0;
}
```

You can compile it using a C compiler: 

```bash
gcc -o output main.c 
./output
```

---

For questions or further support, feel free to reach out!

# Tinker with possibilities

<details>

<summary> Expand possibilities </summary> 

Operations order: 

```hs
typecheck $ parser $ lexer "5-1*2+3*4"
```

Parentheses to change evaluation order

```hs
typecheck $ parser $ lexer "true and (false or true)"
```

## Lambda 

```hs
typecheck $ parser $ lexer "\\(x: Num -> x * 7) 2"
```

```hs
typecheck $ parser $ lexer "\\(x: Bool -> if not x then 1 else 0) true"
```

```hs
typecheck $ parser $ lexer "\\(x: (Num -> Num) -> if (x 3) >= 10 then true else false) \\(y: Num -> y + 7)"
```

## Compiler Test Cases 

Look up on `Examples` for examples!

Run: 

```sh
runghc Main.hs < ./Examples/
```

## List (Implementation) Test Cases

Constructor Usage: 

Add one or multiple elements: 

```hs
typecheck $ parser $ lexer "1:2:3:[3+1,3+2,3+3]"
```

^ Note: there is an error on parsing the list constructor. It accepts (parse) when: `[1,2,3]:4` and breaks unexpectedly when: `[1,2,3]:4:5:6`.

Null ! Does not work: an empty list does not have a type

```hs
typecheck $ parser $ lexer "[]"
```

Head

```hs
typecheck $ parser $ lexer "head [1,2,3,4,6]"
```

Tail

```hs
typecheck $ parser $ lexer "tail [1,2,3,4,6]"
```

App Lam Lst

```hs
typecheck $ parser $ lexer "\\(x: Lst Num -> x * 7) [0,1,2,3,4,5,6,7,8,9,10]"
```

</details>

# C structures that are/could be explored in this compiler: 

<details>
<summary> Expand C structures overview </summary>

## C Syntax 

[C-Language content USP](https://www.ime.usp.br/~pf/algorithms/index.html#C-language)

### Macros (\#define)

<details>
<summary> Expand Macros overview </summary>


[Macros - GCC](https://gcc.gnu.org/onlinedocs/cpp/Macros.html)

[C Preprocessor Macros - Programiz](https://www.programiz.com/c-programming/c-preprocessor-macros)

Function like Macros:
```C
// C program to illustrate macros
#include <stdio.h>

// Function-like Macro definition
#define min(a, b) (((a) < (b)) ? (a) : (b))

// Driver Code
int main()
{

    // Given two number a and b
    int a = 18;
    int b = 76;

    printf("Minimum value between"
           " %d and %d is %d\n",
           a, b, min(a, b));

    return 0;
}
```

</details>

### Function Pointers

<details>
<summary> Expand Function Pointers overview </summary>

[Function Pointers in C - GeeksForGeeks](https://www.geeksforgeeks.org/function-pointer-in-c/)

[Function Pointer - Wikipedia](https://en.wikipedia.org/wiki/Function_pointer)


Simple Example:
```C
#include <stdio.h>

void fun(int a) {
  printf("Value of a is %d\n", a);
}

int main() {
  
    // fun_ptr is a pointer to function fun()
    void (*fun_ptr)(int) = &fun;

    // Invoking fun() using fun_ptr
    (*fun_ptr)(10);

    return 0;
}
```
 
A function’s name can also be used to get functions’ address. For example, in the below program, we have removed address operator ‘&’ in assignment. We have also changed function call by removing *, the program still works:
```C
#include <stdio.h>

void fun(int a) {
  printf("Value of a is %d\n", a);
}

int main() {
  
      // & removed assigning
    void (*fun_ptr)(int) = fun;

      // * removed in calling
    fun_ptr(10);

    return 0;
} 
```

</details>

### Pragma Directive (\#pragma)

<details>
<summary> Expand Prama overview </summary>

[pragma Directive in C - GeeksForGeeks](https://www.geeksforgeeks.org/pragma-directive-in-c-c/)

[Directive or Pragma - Wikipedia](https://en.wikipedia.org/wiki/Directive_(programming))

The \#pragma directive in C is used to provide additional instructions to the compiler, often to control specific compiler features or optimizations. 

Its behavior is compiler-specific and allows enabling or disabling certain features. It has the general syntax:

```C
#pragma directive_name.
```

Some common uses of \#pragma include:

* controlling warnings, 
* setting optimizations, and 
* defining memory alignment, 
* among others. 

However, the exact functionality varies across different compilers.

```C
// C program to demonstrate the working of #pragma startup
// and #pragma exit

#include <stdio.h>

void func1();
void func2();

#pragma startup func1
#pragma exit func2

void func1() { printf("Inside func1()\n"); }

void func2() { printf("Inside func2()\n"); }

int main()
{
	printf("Inside main()\n");

	return 0;
}
```

More at GeeksForGeeks:

1. \#pragma startup and \#pragma exit
2. \#pragma warn Directive
3. \#pragma GCC poison
4. \#pragma GCC dependency
5. \#pragma GCC system_header
6. \#pragma once

</details>

### Ternary Operator (condition ? value_if_true : value_if_false)

<details>
<summary> Expand Ternary Operator overview </summary>

[Ternary Operator in C Explained - FreeCodeCamp](https://www.freecodecamp.org/news/c-ternary-operator/)

[Conditional or Ternary Operator (?:) in C - GeeksForGeeks](https://www.geeksforgeeks.org/conditional-or-ternary-operator-in-c/)

[Ternary Conditional Operator - Wikipedia](https://en.wikipedia.org/wiki/Ternary_conditional_operator)

General Syntax: 

```C
condition ? value_if_true : value_if_false
```

Code example in C: 
```C
int a = 1, b = 2, ans;
if (a == 1) {
    if (b == 2) {
        ans = 3;
    } else {
        ans = 5;
    }
} else {
    ans = 0;
}
printf ("%d\n", ans);
```

Rewritten using Ternary operator Syntax:
```C
int a = 1, b = 2, ans;
ans = (a == 1 ? (b == 2 ? 3 : 5) : 0);
printf ("%d\n", ans);
```

</details>

</details>