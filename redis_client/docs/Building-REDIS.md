# Building the Mex

## Setup Mex

[Mathworks: Build and executable Mex File](https://www.mathworks.com/help/matlab/matlab_external/build-an-executable-mex-file.html)

The first step is to setup `mex`.

```matlab
mex -setup C
```

This is primarily to ensure a proper connection between Xcode's clang.

```matlab
>> mex -setup C
Renamed options file '/Users/deshazere/Library/Application Support/MathWorks/MATLAB/R2024a/mex_C_maca64.xml' to '/Users/deshazere/Library/Application Support/MathWorks/MATLAB/R2024a/mex_C_maca64_backup.xml'.
MEX configured to use 'Xcode with Clang' for C language compilation.
```

```Xcode
xcrun --show-sdk-path
```

[Finding XCode resources](https://andreasfertig.blog/2021/02/clang-and-gcc-on-macos-catalina-finding-the-include-paths/)

Find __va_list_tag here:

/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include


export CPLUS_INCLUDE_PATH=$(xcrun --show-sdk-path)/usr/include:$CPLUS_INCLUDE_PATH


[StackOverflow about Matlab to C history](https://stackoverflow.com/questions/18775627/what-does-the-mex-pragma-do)

From the thread:

[MATLAB Compiler product changed completely starting with MATLAB 7](http://www.mathworks.com/help/releases/R14/toolbox/compiler/ch01intro5.html#42226)

> It became a deployment solution rather than a code translation solution... > The reasoning was that the newly introduced JIT accelerator makes compilation for speeding up code obsolete, so there was no longer a need to translate MATLAB into C code. Hence the MCR was born to execute packaged M-code. –
> Amro
> Commented Sep 13, 2013 at 0:07


> 1. MATLAB Compiler product changed completely starting with MATLAB 7: mathworks.com/help/releases/R14/toolbox/compiler/…. It became a deployment solution rather than a code translation solution... The reasoning was that the newly introduced JIT accelerator makes compilation for speeding up code obsolete, so there was no longer a need to translate MATLAB into C code. Hence the MCR was born to execute packaged M-code. –
> Amro
> Commented Sep 13, 2013 at 0:07
> 2. Thanks @Amro, great detective work. On a historical note, IIRC the motive for introducing the new version of the compiler was not particularly that the JIT had made its speedups redundant, it's that it turned out that hardly anyone was using it to speed up code anyway; instead most users were using it as a solution for sharing applications to others without MATLAB. Those users were frustrated that a big subset of MATLAB code was not supported. Thus the MCR-based Compiler, which supports the entire MATLAB language. –
> Sam Roberts
> Commented Sep 13, 2013 at 8:39
> 3. ... There was still a need for some to convert MATLAB code into C code for speedup (despite the JIT, which in early versions was not always that great), and those users were pretty annoyed by the move to the MCR-based Compiler - they had a long wait until Embedded MATLAB (and later MATLAB Coder) came along. –
> Sam Roberts
> Commented Sep 13, 2013 at 8:40
> 4. I see, thanks for the insight! I was not a MATLAB user back then, but I probably wouldn't have liked the move to the MCR-based compiler either :) I can see the use for a self-contained MATLAB math library that you can link against in C/C++ programs just like any other numeric library, certainly nicer than code generation with MATLAB Coder –
> Amro
> Commented Sep 13, 2013 at 9:41
