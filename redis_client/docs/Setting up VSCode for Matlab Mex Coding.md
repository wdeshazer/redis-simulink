# Setting up VSCode for Matlab Mex Coding

[Matlab Tutorial Debugging Mex with VSCode](https://blogs.mathworks.com/developer/2018/06/19/mex-debugging-vscode/)

## Resolve `#include mex.h`

[Using Clang with Visual Studio Code](https://code.visualstudio.com/docs/cpp/config-clang-mac#_create-hello-world-app)

### Point to matlab extern include


#### Adding MATLAB extern to Intellisense C++ Include 

![Configuring Intellisense C++ Include](img/workspace-include-paths-matlab.png)


To ensure that the correct compilation is happening select `macos-clang-arm64`

![Configuring Default Intellisense Mode](img/user-ws-intellisense-cpp-mode-macos.png)

export LIBRARY_PATH=$(xcrun --show-sdk-path)/usr/lib:$LIBRARY_PATH
export LIBRARY_PATH=/usr/lib:$LIBRARY_PATH
export LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
export LIBRARY_PATH=/usr/local/lib/hiredis:$LIBRARY_PATH

export CPLUS_INCLUDE_PATH=$(xcrun --show-sdk-path)/usr/include:$CPLUS_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/usr/local/include/:$CPLUS_INCLUDE_PATH

export DYLD_LIBRARY_PATH=$LIBRARY_PATH
