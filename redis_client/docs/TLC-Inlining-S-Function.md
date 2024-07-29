# Inlining a Simulink S-Block using TLC (C Code Optimization)

[Inlining an S-function: Simulink Docs](https://www.mathworks.com/help/rtw/tlc/inlining-s-functions.html)

[Target Language Compiler (TLC)](https://www.mathworks.com/help/rtw/tlc/tlc-files.html)

## Inlining Definition

To inline an S-function means to provide a TLC file for an S-Function block that will replace the C, C++, Fortran, or MATLAB® language version of the block that was used during simulation

## Motivation

- Reduce Memory Usage and Increase Speed
    - Using a C/C++ coded S-function has a penalty
    - limited subset of mx* API calls supported within the code generator context

- When the simulation needs to execute one of the functions for an S-function block, it calls the MEX-file for that function.

## Types of Inlining

It is helpful to define two categories of inlining:

- Fully inlined S-functions

- Wrapper inlined S-functions

## TLC

%implements directive

