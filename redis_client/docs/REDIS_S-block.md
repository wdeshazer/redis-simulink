# REDIS S-block

Documenation on constructing an S-block can be found here:


[S-Functions Incorporate Legacy C Code](https://www.mathworks.com/help/simulink/sfg/example-using-s-functions-to-incorporate-legacy-c-code.html#brgo03i-8)

## Overview

C MEX S-functions allow you to call existing C code within your Simulink® models. For example, consider the simple C function doubleIt.c that outputs a value two times the value of the function input.

```c
double doubleIt(double u)
{
    return(u * 2.0);
}
```

You can create an S-function that calls doubleIt.c by either:

- [Writing a wrapper S-function](https://www.mathworks.com/help/simulink/sfg/example-using-s-functions-to-incorporate-legacy-c-code.html#brgo03i-7). Using this method, you hand write a new C S-function and - associated TLC file. This method requires the most knowledge about the structure of a C S-function.

- [Using an S-Function Builder block](https://www.mathworks.com/help/simulink/sfg/example-using-s-functions-to-incorporate-legacy-c-code.html#brgo03i-8). Using this method, you enter the characteristics of the S-function into a block dialog. This method does not require any knowledge about writing S-functions. However, a basic understanding of the structure of an S-function can make the S-Function Builder dialog box easier to use.

- [Using the Legacy Code Tool](https://www.mathworks.com/help/simulink/sfg/example-using-s-functions-to-incorporate-legacy-c-code.html#brgo03i-9). Using this command line method, you define the characteristics of your S-function in a data structure in the MATLAB® workspace. This method requires the least amount of knowledge about S-functions.

You can also call external C code from a Simulink model using a MATLAB Function block. For more information see Integrate C Code by Using the MATLAB Function Block.

The following sections describe how to create S-functions for use in a Simulink simulation and with Simulink Coder™ code generation, using the previous three methods. The example model contains blocks that use these S-functions. If you plan to create the model, copy the files doubleIt.c and doubleIt.h into your working folder.

## Correspondence between REDIS code and Simulink Docs

- 