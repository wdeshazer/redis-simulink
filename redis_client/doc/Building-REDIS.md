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