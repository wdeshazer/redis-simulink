# MEX Compiling Considerations



## Matlab API options

api — Release-specific API
-R2017b (default) | -R2018a | -largeArrayDims | -compatibleArrayDims

[Matlab API Options Table](https://www.mathworks.com/help/releases/R2024a/matlab/ref/mex.html?s_tid=doc_srchtitle)


### 2017a

Builds with:

    Separate complex API, which contains the C and Fortran Matrix API functionality in MATLAB R2017b and earlier.

    Large-array-handling API, which handles arrays with more than 231–1 elements.

    Treating a handle to a graphics object as object, not double.

In a future version of MATLAB, the default api option will change to use the interleaved complex API (-R2018a). MathWorks recommends that you create applications and update existing applications to use the interleaved complex API. Alternatively, use the MX_HAS_INTERLEAVED_COMPLEX macro to apply the desired behavior across versions of MATLAB. For more information, see MATLAB Support for Interleaved Complex API in MEX Functions.

### 2018b

Builds with:

    Interleaved complex API, which includes the typed data access functions. For more information, see Upgrade MEX Files to Use Interleaved Complex API.

    Large-array-handling API

    Treating a handle to a graphics object as object, not double.

To run a Fortran MEX file built with the interleaved complex API in R2018a, you must use R2018a Update 3.

[Summary of Patterns to Adopt Interleaved Complex API](https://www.mathworks.com/help/releases/R2024a/matlab/matlab_external/upgrade-mex-files-to-use-interleaved-complex.html)

[MATLAB Data API for C++](https://www.mathworks.com/help/releases/R2024a/matlab/matlab-data-array.html)

> [!NOTE]
> The MATLAB Data API supports modern C++ features and is not compatible with the C Matrix API. You cannot mix functions from the MATLAB Data API with those in the C Matrix API and C MEX API in a MEX file. Likewise, you cannot mix MATLAB Data API functions with functions in the C Engine API, described in Call MATLAB from C, or the C MAT-File API, described in Write C Programs to Read MAT-File Data.
