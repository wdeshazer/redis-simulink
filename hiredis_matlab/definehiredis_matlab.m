%% About definehiredis_matlab.m
% This file defines the MATLAB interface to the library |hiredis_matlab|.
%
% Commented sections represent C++ functionality that MATLAB cannot automatically define. To include
% functionality, uncomment a section and provide values for <SHAPE>, <DIRECTION>, etc. For more
% information, see helpview(fullfile(docroot,'matlab','helptargets.map'),'cpp_define_interface') to "Define MATLAB Interface for C++ Library".



%% Setup
% Do not edit this setup section.
function libDef = definehiredis_matlab()
libDef = clibgen.LibraryDefinition("hiredis_matlabData.xml");

%% OutputFolder and Libraries 
libDef.OutputFolder = "/Users/deshazere/General-Atomics/fusion/projects/IRAD-1340-API/redis-simulink/hiredis_matlab";
libDef.Libraries = "";

%% C++ function type |void(*)(void *, void *)| with MATLAB name |clib.type.hiredis_matlab.Function1| 
addFunctionType(libDef, "void(*)(void *, void *)", "MATLABName", "clib.type.hiredis_matlab.Function1", ...
    "Description", "clib.type.hiredis_matlab.Function1    C++ function type mwCppAnonymousTypes::Function1."); % Modify help description values as needed.

%% C++ class |redisReadTask| with MATLAB name |clib.hiredis_matlab.redisReadTask| 
redisReadTaskDefinition = addClass(libDef, "redisReadTask", "MATLABName", "clib.hiredis_matlab.redisReadTask", ...
    "Description", "clib.hiredis_matlab.redisReadTask    Representation of C++ class redisReadTask."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReadTask| 
% C++ Signature: redisReadTask::redisReadTask(redisReadTask const & input1)

redisReadTaskConstructor1Definition = addConstructor(redisReadTaskDefinition, ...
    "redisReadTask::redisReadTask(redisReadTask const & input1)", ...
    "Description", "clib.hiredis_matlab.redisReadTask Constructor of C++ class redisReadTask."); % Modify help description values as needed.
defineArgument(redisReadTaskConstructor1Definition, "input1", "clib.hiredis_matlab.redisReadTask", "input");
validate(redisReadTaskConstructor1Definition);

%% C++ class constructor for C++ class |redisReadTask| 
% C++ Signature: redisReadTask::redisReadTask()

redisReadTaskConstructor2Definition = addConstructor(redisReadTaskDefinition, ...
    "redisReadTask::redisReadTask()", ...
    "Description", "clib.hiredis_matlab.redisReadTask Constructor of C++ class redisReadTask."); % Modify help description values as needed.
validate(redisReadTaskConstructor2Definition);

%% C++ class public data member |type| for C++ class |redisReadTask| 
% C++ Signature: int redisReadTask::type

addProperty(redisReadTaskDefinition, "type", "int32", ...
    "Description", "int32    Data member of C++ class redisReadTask."); % Modify help description values as needed.

%% C++ class public data member |elements| for C++ class |redisReadTask| 
% C++ Signature: long long redisReadTask::elements

addProperty(redisReadTaskDefinition, "elements", "int64", ...
    "Description", "int64    Data member of C++ class redisReadTask."); % Modify help description values as needed.

%% C++ class public data member |idx| for C++ class |redisReadTask| 
% C++ Signature: int redisReadTask::idx

addProperty(redisReadTaskDefinition, "idx", "int32", ...
    "Description", "int32    Data member of C++ class redisReadTask."); % Modify help description values as needed.

%% C++ class public data member |parent| for C++ class |redisReadTask| 
% C++ Signature: redisReadTask * redisReadTask::parent

%addProperty(redisReadTaskDefinition, "parent", "clib.hiredis_matlab.redisReadTask", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.redisReadTask", or "clib.array.hiredis_matlab.redisReadTask"
%    "Description", "clib.hiredis_matlab.redisReadTask    Data member of C++ class redisReadTask."); % Modify help description values as needed.

%% C++ class |redisReplyObjectFunctions| with MATLAB name |clib.hiredis_matlab.redisReplyObjectFunctions| 
redisReplyObjectFunctionsDefinition = addClass(libDef, "redisReplyObjectFunctions", "MATLABName", "clib.hiredis_matlab.redisReplyObjectFunctions", ...
    "Description", "clib.hiredis_matlab.redisReplyObjectFunctions    Representation of C++ class redisReplyObjectFunctions."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReplyObjectFunctions| 
% C++ Signature: redisReplyObjectFunctions::redisReplyObjectFunctions(redisReplyObjectFunctions const & input1)

redisReplyObjectFunctionsConstructor1Definition = addConstructor(redisReplyObjectFunctionsDefinition, ...
    "redisReplyObjectFunctions::redisReplyObjectFunctions(redisReplyObjectFunctions const & input1)", ...
    "Description", "clib.hiredis_matlab.redisReplyObjectFunctions Constructor of C++ class redisReplyObjectFunctions."); % Modify help description values as needed.
defineArgument(redisReplyObjectFunctionsConstructor1Definition, "input1", "clib.hiredis_matlab.redisReplyObjectFunctions", "input");
validate(redisReplyObjectFunctionsConstructor1Definition);

%% C++ class constructor for C++ class |redisReplyObjectFunctions| 
% C++ Signature: redisReplyObjectFunctions::redisReplyObjectFunctions()

redisReplyObjectFunctionsConstructor2Definition = addConstructor(redisReplyObjectFunctionsDefinition, ...
    "redisReplyObjectFunctions::redisReplyObjectFunctions()", ...
    "Description", "clib.hiredis_matlab.redisReplyObjectFunctions Constructor of C++ class redisReplyObjectFunctions."); % Modify help description values as needed.
validate(redisReplyObjectFunctionsConstructor2Definition);

%% C++ class |redisReader| with MATLAB name |clib.hiredis_matlab.redisReader| 
redisReaderDefinition = addClass(libDef, "redisReader", "MATLABName", "clib.hiredis_matlab.redisReader", ...
    "Description", "clib.hiredis_matlab.redisReader    Representation of C++ class redisReader."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReader| 
% C++ Signature: redisReader::redisReader(redisReader const & input1)

redisReaderConstructor1Definition = addConstructor(redisReaderDefinition, ...
    "redisReader::redisReader(redisReader const & input1)", ...
    "Description", "clib.hiredis_matlab.redisReader Constructor of C++ class redisReader."); % Modify help description values as needed.
defineArgument(redisReaderConstructor1Definition, "input1", "clib.hiredis_matlab.redisReader", "input");
validate(redisReaderConstructor1Definition);

%% C++ class constructor for C++ class |redisReader| 
% C++ Signature: redisReader::redisReader()

redisReaderConstructor2Definition = addConstructor(redisReaderDefinition, ...
    "redisReader::redisReader()", ...
    "Description", "clib.hiredis_matlab.redisReader Constructor of C++ class redisReader."); % Modify help description values as needed.
validate(redisReaderConstructor2Definition);

%% C++ class public data member |err| for C++ class |redisReader| 
% C++ Signature: int redisReader::err

addProperty(redisReaderDefinition, "err", "int32", ...
    "Description", "int32    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |errstr| for C++ class |redisReader| 
% C++ Signature: char [128] redisReader::errstr

addProperty(redisReaderDefinition, "errstr", "clib.array.hiredis_matlab.Char", [128], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |redisReader| 
% C++ Signature: char * redisReader::buf

%addProperty(redisReaderDefinition, "buf", <MLTYPE>, <SHAPE>, ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%    "Description", "<MLTYPE>    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |pos| for C++ class |redisReader| 
% C++ Signature: size_t redisReader::pos

addProperty(redisReaderDefinition, "pos", "uint64", ...
    "Description", "uint64    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |len| for C++ class |redisReader| 
% C++ Signature: size_t redisReader::len

addProperty(redisReaderDefinition, "len", "uint64", ...
    "Description", "uint64    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |maxbuf| for C++ class |redisReader| 
% C++ Signature: size_t redisReader::maxbuf

addProperty(redisReaderDefinition, "maxbuf", "uint64", ...
    "Description", "uint64    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |maxelements| for C++ class |redisReader| 
% C++ Signature: long long redisReader::maxelements

addProperty(redisReaderDefinition, "maxelements", "int64", ...
    "Description", "int64    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |tasks| for C++ class |redisReader| 
% C++ Signature: int redisReader::tasks

addProperty(redisReaderDefinition, "tasks", "int32", ...
    "Description", "int32    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |ridx| for C++ class |redisReader| 
% C++ Signature: int redisReader::ridx

addProperty(redisReaderDefinition, "ridx", "int32", ...
    "Description", "int32    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |fn| for C++ class |redisReader| 
% C++ Signature: redisReplyObjectFunctions * redisReader::fn

%addProperty(redisReaderDefinition, "fn", "clib.hiredis_matlab.redisReplyObjectFunctions", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.redisReplyObjectFunctions", or "clib.array.hiredis_matlab.redisReplyObjectFunctions"
%    "Description", "clib.hiredis_matlab.redisReplyObjectFunctions    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class |sdshdr5| with MATLAB name |clib.hiredis_matlab.sdshdr5| 
sdshdr5Definition = addClass(libDef, "sdshdr5", "MATLABName", "clib.hiredis_matlab.sdshdr5", ...
    "Description", "clib.hiredis_matlab.sdshdr5    Representation of C++ class sdshdr5."); % Modify help description values as needed.

%% C++ class constructor for C++ class |sdshdr5| 
% C++ Signature: sdshdr5::sdshdr5(sdshdr5 const & input1)

sdshdr5Constructor1Definition = addConstructor(sdshdr5Definition, ...
    "sdshdr5::sdshdr5(sdshdr5 const & input1)", ...
    "Description", "clib.hiredis_matlab.sdshdr5 Constructor of C++ class sdshdr5."); % Modify help description values as needed.
defineArgument(sdshdr5Constructor1Definition, "input1", "clib.hiredis_matlab.sdshdr5", "input");
validate(sdshdr5Constructor1Definition);

%% C++ class constructor for C++ class |sdshdr5| 
% C++ Signature: sdshdr5::sdshdr5()

sdshdr5Constructor2Definition = addConstructor(sdshdr5Definition, ...
    "sdshdr5::sdshdr5()", ...
    "Description", "clib.hiredis_matlab.sdshdr5 Constructor of C++ class sdshdr5."); % Modify help description values as needed.
validate(sdshdr5Constructor2Definition);

%% C++ class public data member |flags| for C++ class |sdshdr5| 
% C++ Signature: unsigned char sdshdr5::flags

addProperty(sdshdr5Definition, "flags", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr5."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |sdshdr5| 
% C++ Signature: char [] sdshdr5::buf

addProperty(sdshdr5Definition, "buf", "clib.array.hiredis_matlab.Char", [0], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class sdshdr5."); % Modify help description values as needed.

%% C++ class |sdshdr8| with MATLAB name |clib.hiredis_matlab.sdshdr8| 
sdshdr8Definition = addClass(libDef, "sdshdr8", "MATLABName", "clib.hiredis_matlab.sdshdr8", ...
    "Description", "clib.hiredis_matlab.sdshdr8    Representation of C++ class sdshdr8."); % Modify help description values as needed.

%% C++ class constructor for C++ class |sdshdr8| 
% C++ Signature: sdshdr8::sdshdr8(sdshdr8 const & input1)

sdshdr8Constructor1Definition = addConstructor(sdshdr8Definition, ...
    "sdshdr8::sdshdr8(sdshdr8 const & input1)", ...
    "Description", "clib.hiredis_matlab.sdshdr8 Constructor of C++ class sdshdr8."); % Modify help description values as needed.
defineArgument(sdshdr8Constructor1Definition, "input1", "clib.hiredis_matlab.sdshdr8", "input");
validate(sdshdr8Constructor1Definition);

%% C++ class constructor for C++ class |sdshdr8| 
% C++ Signature: sdshdr8::sdshdr8()

sdshdr8Constructor2Definition = addConstructor(sdshdr8Definition, ...
    "sdshdr8::sdshdr8()", ...
    "Description", "clib.hiredis_matlab.sdshdr8 Constructor of C++ class sdshdr8."); % Modify help description values as needed.
validate(sdshdr8Constructor2Definition);

%% C++ class public data member |len| for C++ class |sdshdr8| 
% C++ Signature: uint8_t sdshdr8::len

addProperty(sdshdr8Definition, "len", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr8."); % Modify help description values as needed.

%% C++ class public data member |alloc| for C++ class |sdshdr8| 
% C++ Signature: uint8_t sdshdr8::alloc

addProperty(sdshdr8Definition, "alloc", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr8."); % Modify help description values as needed.

%% C++ class public data member |flags| for C++ class |sdshdr8| 
% C++ Signature: unsigned char sdshdr8::flags

addProperty(sdshdr8Definition, "flags", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr8."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |sdshdr8| 
% C++ Signature: char [] sdshdr8::buf

addProperty(sdshdr8Definition, "buf", "clib.array.hiredis_matlab.Char", [0], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class sdshdr8."); % Modify help description values as needed.

%% C++ class |sdshdr16| with MATLAB name |clib.hiredis_matlab.sdshdr16| 
sdshdr16Definition = addClass(libDef, "sdshdr16", "MATLABName", "clib.hiredis_matlab.sdshdr16", ...
    "Description", "clib.hiredis_matlab.sdshdr16    Representation of C++ class sdshdr16."); % Modify help description values as needed.

%% C++ class constructor for C++ class |sdshdr16| 
% C++ Signature: sdshdr16::sdshdr16(sdshdr16 const & input1)

sdshdr16Constructor1Definition = addConstructor(sdshdr16Definition, ...
    "sdshdr16::sdshdr16(sdshdr16 const & input1)", ...
    "Description", "clib.hiredis_matlab.sdshdr16 Constructor of C++ class sdshdr16."); % Modify help description values as needed.
defineArgument(sdshdr16Constructor1Definition, "input1", "clib.hiredis_matlab.sdshdr16", "input");
validate(sdshdr16Constructor1Definition);

%% C++ class constructor for C++ class |sdshdr16| 
% C++ Signature: sdshdr16::sdshdr16()

sdshdr16Constructor2Definition = addConstructor(sdshdr16Definition, ...
    "sdshdr16::sdshdr16()", ...
    "Description", "clib.hiredis_matlab.sdshdr16 Constructor of C++ class sdshdr16."); % Modify help description values as needed.
validate(sdshdr16Constructor2Definition);

%% C++ class public data member |len| for C++ class |sdshdr16| 
% C++ Signature: uint16_t sdshdr16::len

addProperty(sdshdr16Definition, "len", "uint16", ...
    "Description", "uint16    Data member of C++ class sdshdr16."); % Modify help description values as needed.

%% C++ class public data member |alloc| for C++ class |sdshdr16| 
% C++ Signature: uint16_t sdshdr16::alloc

addProperty(sdshdr16Definition, "alloc", "uint16", ...
    "Description", "uint16    Data member of C++ class sdshdr16."); % Modify help description values as needed.

%% C++ class public data member |flags| for C++ class |sdshdr16| 
% C++ Signature: unsigned char sdshdr16::flags

addProperty(sdshdr16Definition, "flags", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr16."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |sdshdr16| 
% C++ Signature: char [] sdshdr16::buf

addProperty(sdshdr16Definition, "buf", "clib.array.hiredis_matlab.Char", [0], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class sdshdr16."); % Modify help description values as needed.

%% C++ class |sdshdr32| with MATLAB name |clib.hiredis_matlab.sdshdr32| 
sdshdr32Definition = addClass(libDef, "sdshdr32", "MATLABName", "clib.hiredis_matlab.sdshdr32", ...
    "Description", "clib.hiredis_matlab.sdshdr32    Representation of C++ class sdshdr32."); % Modify help description values as needed.

%% C++ class constructor for C++ class |sdshdr32| 
% C++ Signature: sdshdr32::sdshdr32(sdshdr32 const & input1)

sdshdr32Constructor1Definition = addConstructor(sdshdr32Definition, ...
    "sdshdr32::sdshdr32(sdshdr32 const & input1)", ...
    "Description", "clib.hiredis_matlab.sdshdr32 Constructor of C++ class sdshdr32."); % Modify help description values as needed.
defineArgument(sdshdr32Constructor1Definition, "input1", "clib.hiredis_matlab.sdshdr32", "input");
validate(sdshdr32Constructor1Definition);

%% C++ class constructor for C++ class |sdshdr32| 
% C++ Signature: sdshdr32::sdshdr32()

sdshdr32Constructor2Definition = addConstructor(sdshdr32Definition, ...
    "sdshdr32::sdshdr32()", ...
    "Description", "clib.hiredis_matlab.sdshdr32 Constructor of C++ class sdshdr32."); % Modify help description values as needed.
validate(sdshdr32Constructor2Definition);

%% C++ class public data member |len| for C++ class |sdshdr32| 
% C++ Signature: uint32_t sdshdr32::len

addProperty(sdshdr32Definition, "len", "uint32", ...
    "Description", "uint32    Data member of C++ class sdshdr32."); % Modify help description values as needed.

%% C++ class public data member |alloc| for C++ class |sdshdr32| 
% C++ Signature: uint32_t sdshdr32::alloc

addProperty(sdshdr32Definition, "alloc", "uint32", ...
    "Description", "uint32    Data member of C++ class sdshdr32."); % Modify help description values as needed.

%% C++ class public data member |flags| for C++ class |sdshdr32| 
% C++ Signature: unsigned char sdshdr32::flags

addProperty(sdshdr32Definition, "flags", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr32."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |sdshdr32| 
% C++ Signature: char [] sdshdr32::buf

addProperty(sdshdr32Definition, "buf", "clib.array.hiredis_matlab.Char", [0], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class sdshdr32."); % Modify help description values as needed.

%% C++ class |sdshdr64| with MATLAB name |clib.hiredis_matlab.sdshdr64| 
sdshdr64Definition = addClass(libDef, "sdshdr64", "MATLABName", "clib.hiredis_matlab.sdshdr64", ...
    "Description", "clib.hiredis_matlab.sdshdr64    Representation of C++ class sdshdr64."); % Modify help description values as needed.

%% C++ class constructor for C++ class |sdshdr64| 
% C++ Signature: sdshdr64::sdshdr64(sdshdr64 const & input1)

sdshdr64Constructor1Definition = addConstructor(sdshdr64Definition, ...
    "sdshdr64::sdshdr64(sdshdr64 const & input1)", ...
    "Description", "clib.hiredis_matlab.sdshdr64 Constructor of C++ class sdshdr64."); % Modify help description values as needed.
defineArgument(sdshdr64Constructor1Definition, "input1", "clib.hiredis_matlab.sdshdr64", "input");
validate(sdshdr64Constructor1Definition);

%% C++ class constructor for C++ class |sdshdr64| 
% C++ Signature: sdshdr64::sdshdr64()

sdshdr64Constructor2Definition = addConstructor(sdshdr64Definition, ...
    "sdshdr64::sdshdr64()", ...
    "Description", "clib.hiredis_matlab.sdshdr64 Constructor of C++ class sdshdr64."); % Modify help description values as needed.
validate(sdshdr64Constructor2Definition);

%% C++ class public data member |len| for C++ class |sdshdr64| 
% C++ Signature: uint64_t sdshdr64::len

addProperty(sdshdr64Definition, "len", "uint64", ...
    "Description", "uint64    Data member of C++ class sdshdr64."); % Modify help description values as needed.

%% C++ class public data member |alloc| for C++ class |sdshdr64| 
% C++ Signature: uint64_t sdshdr64::alloc

addProperty(sdshdr64Definition, "alloc", "uint64", ...
    "Description", "uint64    Data member of C++ class sdshdr64."); % Modify help description values as needed.

%% C++ class public data member |flags| for C++ class |sdshdr64| 
% C++ Signature: unsigned char sdshdr64::flags

addProperty(sdshdr64Definition, "flags", "uint8", ...
    "Description", "uint8    Data member of C++ class sdshdr64."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |sdshdr64| 
% C++ Signature: char [] sdshdr64::buf

addProperty(sdshdr64Definition, "buf", "clib.array.hiredis_matlab.Char", [0], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class sdshdr64."); % Modify help description values as needed.

%% C++ class |hiredisAllocFuncs| with MATLAB name |clib.hiredis_matlab.hiredisAllocFuncs| 
hiredisAllocFuncsDefinition = addClass(libDef, "hiredisAllocFuncs", "MATLABName", "clib.hiredis_matlab.hiredisAllocFuncs", ...
    "Description", "clib.hiredis_matlab.hiredisAllocFuncs    Representation of C++ class hiredisAllocFuncs."); % Modify help description values as needed.

%% C++ class constructor for C++ class |hiredisAllocFuncs| 
% C++ Signature: hiredisAllocFuncs::hiredisAllocFuncs(hiredisAllocFuncs const & input1)

hiredisAllocFuncsConstructor1Definition = addConstructor(hiredisAllocFuncsDefinition, ...
    "hiredisAllocFuncs::hiredisAllocFuncs(hiredisAllocFuncs const & input1)", ...
    "Description", "clib.hiredis_matlab.hiredisAllocFuncs Constructor of C++ class hiredisAllocFuncs."); % Modify help description values as needed.
defineArgument(hiredisAllocFuncsConstructor1Definition, "input1", "clib.hiredis_matlab.hiredisAllocFuncs", "input");
validate(hiredisAllocFuncsConstructor1Definition);

%% C++ class constructor for C++ class |hiredisAllocFuncs| 
% C++ Signature: hiredisAllocFuncs::hiredisAllocFuncs()

hiredisAllocFuncsConstructor2Definition = addConstructor(hiredisAllocFuncsDefinition, ...
    "hiredisAllocFuncs::hiredisAllocFuncs()", ...
    "Description", "clib.hiredis_matlab.hiredisAllocFuncs Constructor of C++ class hiredisAllocFuncs."); % Modify help description values as needed.
validate(hiredisAllocFuncsConstructor2Definition);

%% C++ class |redisAsyncContext| with MATLAB name |clib.hiredis_matlab.redisAsyncContext| 
redisAsyncContextDefinition = addClass(libDef, "redisAsyncContext", "MATLABName", "clib.hiredis_matlab.redisAsyncContext", ...
    "Description", "clib.hiredis_matlab.redisAsyncContext    Representation of C++ class redisAsyncContext."); % Modify help description values as needed.

%% C++ class |redisReply| with MATLAB name |clib.hiredis_matlab.redisReply| 
redisReplyDefinition = addClass(libDef, "redisReply", "MATLABName", "clib.hiredis_matlab.redisReply", ...
    "Description", "clib.hiredis_matlab.redisReply    Representation of C++ class redisReply."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReply| 
% C++ Signature: redisReply::redisReply(redisReply const & input1)

redisReplyConstructor1Definition = addConstructor(redisReplyDefinition, ...
    "redisReply::redisReply(redisReply const & input1)", ...
    "Description", "clib.hiredis_matlab.redisReply Constructor of C++ class redisReply."); % Modify help description values as needed.
defineArgument(redisReplyConstructor1Definition, "input1", "clib.hiredis_matlab.redisReply", "input");
validate(redisReplyConstructor1Definition);

%% C++ class constructor for C++ class |redisReply| 
% C++ Signature: redisReply::redisReply()

redisReplyConstructor2Definition = addConstructor(redisReplyDefinition, ...
    "redisReply::redisReply()", ...
    "Description", "clib.hiredis_matlab.redisReply Constructor of C++ class redisReply."); % Modify help description values as needed.
validate(redisReplyConstructor2Definition);

%% C++ class public data member |type| for C++ class |redisReply| 
% C++ Signature: int redisReply::type

addProperty(redisReplyDefinition, "type", "int32", ...
    "Description", "int32    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |integer| for C++ class |redisReply| 
% C++ Signature: long long redisReply::integer

addProperty(redisReplyDefinition, "integer", "int64", ...
    "Description", "int64    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |dval| for C++ class |redisReply| 
% C++ Signature: double redisReply::dval

addProperty(redisReplyDefinition, "dval", "double", ...
    "Description", "double    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |len| for C++ class |redisReply| 
% C++ Signature: size_t redisReply::len

addProperty(redisReplyDefinition, "len", "uint64", ...
    "Description", "uint64    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |str| for C++ class |redisReply| 
% C++ Signature: char * redisReply::str

%addProperty(redisReplyDefinition, "str", <MLTYPE>, <SHAPE>, ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%    "Description", "<MLTYPE>    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |vtype| for C++ class |redisReply| 
% C++ Signature: char [4] redisReply::vtype

addProperty(redisReplyDefinition, "vtype", "clib.array.hiredis_matlab.Char", [4], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |elements| for C++ class |redisReply| 
% C++ Signature: size_t redisReply::elements

addProperty(redisReplyDefinition, "elements", "uint64", ...
    "Description", "uint64    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ enumeration |redisConnectionType| with MATLAB name |clib.hiredis_matlab.redisConnectionType| 
addEnumeration(libDef, "redisConnectionType", "int32",...
    [...
      "REDIS_CONN_TCP",...  % 0
      "REDIS_CONN_UNIX",...  % 1
      "REDIS_CONN_USERFD",...  % 2
    ],...
    "MATLABName", "clib.hiredis_matlab.redisConnectionType", ...
    "Description", "clib.hiredis_matlab.redisConnectionType    Representation of C++ enumeration redisConnectionType."); % Modify help description values as needed.

%% C++ class |redisSsl| with MATLAB name |clib.hiredis_matlab.redisSsl| 
redisSslDefinition = addClass(libDef, "redisSsl", "MATLABName", "clib.hiredis_matlab.redisSsl", ...
    "Description", "clib.hiredis_matlab.redisSsl    Representation of C++ class redisSsl."); % Modify help description values as needed.

%% C++ class |redisOptions| with MATLAB name |clib.hiredis_matlab.redisOptions| 
redisOptionsDefinition = addClass(libDef, "redisOptions", "MATLABName", "clib.hiredis_matlab.redisOptions", ...
    "Description", "clib.hiredis_matlab.redisOptions    Representation of C++ class redisOptions."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisOptions| 
% C++ Signature: redisOptions::redisOptions(redisOptions const & input1)

redisOptionsConstructor1Definition = addConstructor(redisOptionsDefinition, ...
    "redisOptions::redisOptions(redisOptions const & input1)", ...
    "Description", "clib.hiredis_matlab.redisOptions Constructor of C++ class redisOptions."); % Modify help description values as needed.
defineArgument(redisOptionsConstructor1Definition, "input1", "clib.hiredis_matlab.redisOptions", "input");
validate(redisOptionsConstructor1Definition);

%% C++ class constructor for C++ class |redisOptions| 
% C++ Signature: redisOptions::redisOptions()

redisOptionsConstructor2Definition = addConstructor(redisOptionsDefinition, ...
    "redisOptions::redisOptions()", ...
    "Description", "clib.hiredis_matlab.redisOptions Constructor of C++ class redisOptions."); % Modify help description values as needed.
validate(redisOptionsConstructor2Definition);

%% C++ class public data member |type| for C++ class |redisOptions| 
% C++ Signature: int redisOptions::type

addProperty(redisOptionsDefinition, "type", "int32", ...
    "Description", "int32    Data member of C++ class redisOptions."); % Modify help description values as needed.

%% C++ class public data member |options| for C++ class |redisOptions| 
% C++ Signature: int redisOptions::options

addProperty(redisOptionsDefinition, "options", "int32", ...
    "Description", "int32    Data member of C++ class redisOptions."); % Modify help description values as needed.

%% C++ class |redisContextFuncs| with MATLAB name |clib.hiredis_matlab.redisContextFuncs| 
redisContextFuncsDefinition = addClass(libDef, "redisContextFuncs", "MATLABName", "clib.hiredis_matlab.redisContextFuncs", ...
    "Description", "clib.hiredis_matlab.redisContextFuncs    Representation of C++ class redisContextFuncs."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisContextFuncs| 
% C++ Signature: redisContextFuncs::redisContextFuncs(redisContextFuncs const & input1)

redisContextFuncsConstructor1Definition = addConstructor(redisContextFuncsDefinition, ...
    "redisContextFuncs::redisContextFuncs(redisContextFuncs const & input1)", ...
    "Description", "clib.hiredis_matlab.redisContextFuncs Constructor of C++ class redisContextFuncs."); % Modify help description values as needed.
defineArgument(redisContextFuncsConstructor1Definition, "input1", "clib.hiredis_matlab.redisContextFuncs", "input");
validate(redisContextFuncsConstructor1Definition);

%% C++ class constructor for C++ class |redisContextFuncs| 
% C++ Signature: redisContextFuncs::redisContextFuncs()

redisContextFuncsConstructor2Definition = addConstructor(redisContextFuncsDefinition, ...
    "redisContextFuncs::redisContextFuncs()", ...
    "Description", "clib.hiredis_matlab.redisContextFuncs Constructor of C++ class redisContextFuncs."); % Modify help description values as needed.
validate(redisContextFuncsConstructor2Definition);

%% C++ class |redisContext| with MATLAB name |clib.hiredis_matlab.redisContext| 
redisContextDefinition = addClass(libDef, "redisContext", "MATLABName", "clib.hiredis_matlab.redisContext", ...
    "Description", "clib.hiredis_matlab.redisContext    Representation of C++ class redisContext."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisContext| 
% C++ Signature: redisContext::redisContext(redisContext const & input1)

redisContextConstructor1Definition = addConstructor(redisContextDefinition, ...
    "redisContext::redisContext(redisContext const & input1)", ...
    "Description", "clib.hiredis_matlab.redisContext Constructor of C++ class redisContext."); % Modify help description values as needed.
defineArgument(redisContextConstructor1Definition, "input1", "clib.hiredis_matlab.redisContext", "input");
validate(redisContextConstructor1Definition);

%% C++ class constructor for C++ class |redisContext| 
% C++ Signature: redisContext::redisContext()

redisContextConstructor2Definition = addConstructor(redisContextDefinition, ...
    "redisContext::redisContext()", ...
    "Description", "clib.hiredis_matlab.redisContext Constructor of C++ class redisContext."); % Modify help description values as needed.
validate(redisContextConstructor2Definition);

%% C++ class public data member |funcs| for C++ class |redisContext| 
% C++ Signature: redisContextFuncs const * redisContext::funcs

%addProperty(redisContextDefinition, "funcs", "clib.hiredis_matlab.redisContextFuncs", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.redisContextFuncs", or "clib.array.hiredis_matlab.redisContextFuncs"
%    "Description", "clib.hiredis_matlab.redisContextFuncs    read-only Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |err| for C++ class |redisContext| 
% C++ Signature: int redisContext::err

addProperty(redisContextDefinition, "err", "int32", ...
    "Description", "int32    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |errstr| for C++ class |redisContext| 
% C++ Signature: char [128] redisContext::errstr

addProperty(redisContextDefinition, "errstr", "clib.array.hiredis_matlab.Char", [128], ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
    "Description", "clib.array.hiredis_matlab.Char    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |fd| for C++ class |redisContext| 
% C++ Signature: redisFD redisContext::fd

addProperty(redisContextDefinition, "fd", "int32", ...
    "Description", "int32    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |flags| for C++ class |redisContext| 
% C++ Signature: int redisContext::flags

addProperty(redisContextDefinition, "flags", "int32", ...
    "Description", "int32    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |obuf| for C++ class |redisContext| 
% C++ Signature: char * redisContext::obuf

%addProperty(redisContextDefinition, "obuf", <MLTYPE>, <SHAPE>, ... % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%    "Description", "<MLTYPE>    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |reader| for C++ class |redisContext| 
% C++ Signature: redisReader * redisContext::reader

%addProperty(redisContextDefinition, "reader", "clib.hiredis_matlab.redisReader", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.redisReader", or "clib.array.hiredis_matlab.redisReader"
%    "Description", "clib.hiredis_matlab.redisReader    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |connection_type| for C++ class |redisContext| 
% C++ Signature: redisConnectionType redisContext::connection_type

addProperty(redisContextDefinition, "connection_type", "clib.hiredis_matlab.redisConnectionType", ...
    "Description", "clib.hiredis_matlab.redisConnectionType    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |saddr| for C++ class |redisContext| 
% C++ Signature: sockaddr * redisContext::saddr

%addProperty(redisContextDefinition, "saddr", "clib.hiredis_matlab.sockaddr", <SHAPE>, ...
%    "Description", "clib.hiredis_matlab.sockaddr    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |addrlen| for C++ class |redisContext| 
% C++ Signature: size_t redisContext::addrlen

addProperty(redisContextDefinition, "addrlen", "uint64", ...
    "Description", "uint64    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class |sockaddr| with MATLAB name |clib.hiredis_matlab.sockaddr| 
sockaddrDefinition = addClass(libDef, "sockaddr", "MATLABName", "clib.hiredis_matlab.sockaddr", ...
    "Description", "clib.hiredis_matlab.sockaddr    Representation of C++ class sockaddr."); % Modify help description values as needed.

%% C++ class |dictEntry| with MATLAB name |clib.hiredis_matlab.dictEntry| 
dictEntryDefinition = addClass(libDef, "dictEntry", "MATLABName", "clib.hiredis_matlab.dictEntry", ...
    "Description", "clib.hiredis_matlab.dictEntry    Representation of C++ class dictEntry."); % Modify help description values as needed.

%% C++ class constructor for C++ class |dictEntry| 
% C++ Signature: dictEntry::dictEntry(dictEntry const & input1)

dictEntryConstructor1Definition = addConstructor(dictEntryDefinition, ...
    "dictEntry::dictEntry(dictEntry const & input1)", ...
    "Description", "clib.hiredis_matlab.dictEntry Constructor of C++ class dictEntry."); % Modify help description values as needed.
defineArgument(dictEntryConstructor1Definition, "input1", "clib.hiredis_matlab.dictEntry", "input");
validate(dictEntryConstructor1Definition);

%% C++ class constructor for C++ class |dictEntry| 
% C++ Signature: dictEntry::dictEntry()

dictEntryConstructor2Definition = addConstructor(dictEntryDefinition, ...
    "dictEntry::dictEntry()", ...
    "Description", "clib.hiredis_matlab.dictEntry Constructor of C++ class dictEntry."); % Modify help description values as needed.
validate(dictEntryConstructor2Definition);

%% C++ class public data member |next| for C++ class |dictEntry| 
% C++ Signature: dictEntry * dictEntry::next

%addProperty(dictEntryDefinition, "next", "clib.hiredis_matlab.dictEntry", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.dictEntry", or "clib.array.hiredis_matlab.dictEntry"
%    "Description", "clib.hiredis_matlab.dictEntry    Data member of C++ class dictEntry."); % Modify help description values as needed.

%% C++ class |dictType| with MATLAB name |clib.hiredis_matlab.dictType| 
dictTypeDefinition = addClass(libDef, "dictType", "MATLABName", "clib.hiredis_matlab.dictType", ...
    "Description", "clib.hiredis_matlab.dictType    Representation of C++ class dictType."); % Modify help description values as needed.

%% C++ class constructor for C++ class |dictType| 
% C++ Signature: dictType::dictType(dictType const & input1)

dictTypeConstructor1Definition = addConstructor(dictTypeDefinition, ...
    "dictType::dictType(dictType const & input1)", ...
    "Description", "clib.hiredis_matlab.dictType Constructor of C++ class dictType."); % Modify help description values as needed.
defineArgument(dictTypeConstructor1Definition, "input1", "clib.hiredis_matlab.dictType", "input");
validate(dictTypeConstructor1Definition);

%% C++ class constructor for C++ class |dictType| 
% C++ Signature: dictType::dictType()

dictTypeConstructor2Definition = addConstructor(dictTypeDefinition, ...
    "dictType::dictType()", ...
    "Description", "clib.hiredis_matlab.dictType Constructor of C++ class dictType."); % Modify help description values as needed.
validate(dictTypeConstructor2Definition);

%% C++ class |dict| with MATLAB name |clib.hiredis_matlab.dict| 
dictDefinition = addClass(libDef, "dict", "MATLABName", "clib.hiredis_matlab.dict", ...
    "Description", "clib.hiredis_matlab.dict    Representation of C++ class dict."); % Modify help description values as needed.

%% C++ class constructor for C++ class |dict| 
% C++ Signature: dict::dict(dict const & input1)

dictConstructor1Definition = addConstructor(dictDefinition, ...
    "dict::dict(dict const & input1)", ...
    "Description", "clib.hiredis_matlab.dict Constructor of C++ class dict."); % Modify help description values as needed.
defineArgument(dictConstructor1Definition, "input1", "clib.hiredis_matlab.dict", "input");
validate(dictConstructor1Definition);

%% C++ class constructor for C++ class |dict| 
% C++ Signature: dict::dict()

dictConstructor2Definition = addConstructor(dictDefinition, ...
    "dict::dict()", ...
    "Description", "clib.hiredis_matlab.dict Constructor of C++ class dict."); % Modify help description values as needed.
validate(dictConstructor2Definition);

%% C++ class public data member |type| for C++ class |dict| 
% C++ Signature: dictType * dict::type

%addProperty(dictDefinition, "type", "clib.hiredis_matlab.dictType", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.dictType", or "clib.array.hiredis_matlab.dictType"
%    "Description", "clib.hiredis_matlab.dictType    Data member of C++ class dict."); % Modify help description values as needed.

%% C++ class public data member |size| for C++ class |dict| 
% C++ Signature: unsigned long dict::size

addProperty(dictDefinition, "size", "uint64", ...
    "Description", "uint64    Data member of C++ class dict."); % Modify help description values as needed.

%% C++ class public data member |sizemask| for C++ class |dict| 
% C++ Signature: unsigned long dict::sizemask

addProperty(dictDefinition, "sizemask", "uint64", ...
    "Description", "uint64    Data member of C++ class dict."); % Modify help description values as needed.

%% C++ class public data member |used| for C++ class |dict| 
% C++ Signature: unsigned long dict::used

addProperty(dictDefinition, "used", "uint64", ...
    "Description", "uint64    Data member of C++ class dict."); % Modify help description values as needed.

%% C++ class |dictIterator| with MATLAB name |clib.hiredis_matlab.dictIterator| 
dictIteratorDefinition = addClass(libDef, "dictIterator", "MATLABName", "clib.hiredis_matlab.dictIterator", ...
    "Description", "clib.hiredis_matlab.dictIterator    Representation of C++ class dictIterator."); % Modify help description values as needed.

%% C++ class constructor for C++ class |dictIterator| 
% C++ Signature: dictIterator::dictIterator(dictIterator const & input1)

dictIteratorConstructor1Definition = addConstructor(dictIteratorDefinition, ...
    "dictIterator::dictIterator(dictIterator const & input1)", ...
    "Description", "clib.hiredis_matlab.dictIterator Constructor of C++ class dictIterator."); % Modify help description values as needed.
defineArgument(dictIteratorConstructor1Definition, "input1", "clib.hiredis_matlab.dictIterator", "input");
validate(dictIteratorConstructor1Definition);

%% C++ class constructor for C++ class |dictIterator| 
% C++ Signature: dictIterator::dictIterator()

dictIteratorConstructor2Definition = addConstructor(dictIteratorDefinition, ...
    "dictIterator::dictIterator()", ...
    "Description", "clib.hiredis_matlab.dictIterator Constructor of C++ class dictIterator."); % Modify help description values as needed.
validate(dictIteratorConstructor2Definition);

%% C++ class public data member |ht| for C++ class |dictIterator| 
% C++ Signature: dict * dictIterator::ht

%addProperty(dictIteratorDefinition, "ht", "clib.hiredis_matlab.dict", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%    "Description", "clib.hiredis_matlab.dict    Data member of C++ class dictIterator."); % Modify help description values as needed.

%% C++ class public data member |index| for C++ class |dictIterator| 
% C++ Signature: int dictIterator::index

addProperty(dictIteratorDefinition, "index", "int32", ...
    "Description", "int32    Data member of C++ class dictIterator."); % Modify help description values as needed.

%% C++ class public data member |entry| for C++ class |dictIterator| 
% C++ Signature: dictEntry * dictIterator::entry

%addProperty(dictIteratorDefinition, "entry", "clib.hiredis_matlab.dictEntry", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.dictEntry", or "clib.array.hiredis_matlab.dictEntry"
%    "Description", "clib.hiredis_matlab.dictEntry    Data member of C++ class dictIterator."); % Modify help description values as needed.

%% C++ class public data member |nextEntry| for C++ class |dictIterator| 
% C++ Signature: dictEntry * dictIterator::nextEntry

%addProperty(dictIteratorDefinition, "nextEntry", "clib.hiredis_matlab.dictEntry", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis_matlab.dictEntry", or "clib.array.hiredis_matlab.dictEntry"
%    "Description", "clib.hiredis_matlab.dictEntry    Data member of C++ class dictIterator."); % Modify help description values as needed.

%% C++ function |redisReaderCreateWithFunctions| with MATLAB name |clib.hiredis_matlab.redisReaderCreateWithFunctions|
% C++ Signature: redisReader * redisReaderCreateWithFunctions(redisReplyObjectFunctions * fn)

%redisReaderCreateWithFunctionsDefinition = addFunction(libDef, ...
%    "redisReader * redisReaderCreateWithFunctions(redisReplyObjectFunctions * fn)", ...
%    "MATLABName", "clib.hiredis_matlab.redisReaderCreateWithFunctions", ...
%    "Description", "clib.hiredis_matlab.redisReaderCreateWithFunctions Representation of C++ function redisReaderCreateWithFunctions."); % Modify help description values as needed.
%defineArgument(redisReaderCreateWithFunctionsDefinition, "fn", "clib.hiredis_matlab.redisReplyObjectFunctions", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisReplyObjectFunctions", or "clib.array.hiredis_matlab.redisReplyObjectFunctions"
%defineOutput(redisReaderCreateWithFunctionsDefinition, "RetVal", "clib.hiredis_matlab.redisReader", <SHAPE>);
%validate(redisReaderCreateWithFunctionsDefinition);

%% C++ function |redisReaderFree| with MATLAB name |clib.hiredis_matlab.redisReaderFree|
% C++ Signature: void redisReaderFree(redisReader * r)

%redisReaderFreeDefinition = addFunction(libDef, ...
%    "void redisReaderFree(redisReader * r)", ...
%    "MATLABName", "clib.hiredis_matlab.redisReaderFree", ...
%    "Description", "clib.hiredis_matlab.redisReaderFree Representation of C++ function redisReaderFree."); % Modify help description values as needed.
%defineArgument(redisReaderFreeDefinition, "r", "clib.hiredis_matlab.redisReader", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisReader", or "clib.array.hiredis_matlab.redisReader"
%validate(redisReaderFreeDefinition);

%% C++ function |redisReaderFeed| with MATLAB name |clib.hiredis_matlab.redisReaderFeed|
% C++ Signature: int redisReaderFeed(redisReader * r,char const * buf,size_t len)

%redisReaderFeedDefinition = addFunction(libDef, ...
%    "int redisReaderFeed(redisReader * r,char const * buf,size_t len)", ...
%    "MATLABName", "clib.hiredis_matlab.redisReaderFeed", ...
%    "Description", "clib.hiredis_matlab.redisReaderFeed Representation of C++ function redisReaderFeed."); % Modify help description values as needed.
%defineArgument(redisReaderFeedDefinition, "r", "clib.hiredis_matlab.redisReader", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisReader", or "clib.array.hiredis_matlab.redisReader"
%defineArgument(redisReaderFeedDefinition, "buf", "string", "input", "nullTerminated");
%defineArgument(redisReaderFeedDefinition, "len", "uint64");
%defineOutput(redisReaderFeedDefinition, "RetVal", "int32");
%validate(redisReaderFeedDefinition);

%% C++ function |redisReaderGetReply| with MATLAB name |clib.hiredis_matlab.redisReaderGetReply|
% C++ Signature: int redisReaderGetReply(redisReader * r,void * * reply)

%redisReaderGetReplyDefinition = addFunction(libDef, ...
%    "int redisReaderGetReply(redisReader * r,void * * reply)", ...
%    "MATLABName", "clib.hiredis_matlab.redisReaderGetReply", ...
%    "Description", "clib.hiredis_matlab.redisReaderGetReply Representation of C++ function redisReaderGetReply."); % Modify help description values as needed.
%defineArgument(redisReaderGetReplyDefinition, "r", "clib.hiredis_matlab.redisReader", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisReader", or "clib.array.hiredis_matlab.redisReader"
%defineArgument(redisReaderGetReplyDefinition, "reply", <MLTYPE>, "output", 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%defineOutput(redisReaderGetReplyDefinition, "RetVal", "int32");
%validate(redisReaderGetReplyDefinition);

%% C++ function |sdslen| with MATLAB name |clib.hiredis_matlab.sdslen|
% C++ Signature: size_t sdslen(sds const s)

%sdslenDefinition = addFunction(libDef, ...
%    "size_t sdslen(sds const s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdslen", ...
%    "Description", "clib.hiredis_matlab.sdslen Representation of C++ function sdslen."); % Modify help description values as needed.
%defineArgument(sdslenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdslenDefinition, "RetVal", "uint64");
%validate(sdslenDefinition);

%% C++ function |sdsavail| with MATLAB name |clib.hiredis_matlab.sdsavail|
% C++ Signature: size_t sdsavail(sds const s)

%sdsavailDefinition = addFunction(libDef, ...
%    "size_t sdsavail(sds const s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsavail", ...
%    "Description", "clib.hiredis_matlab.sdsavail Representation of C++ function sdsavail."); % Modify help description values as needed.
%defineArgument(sdsavailDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsavailDefinition, "RetVal", "uint64");
%validate(sdsavailDefinition);

%% C++ function |sdssetlen| with MATLAB name |clib.hiredis_matlab.sdssetlen|
% C++ Signature: void sdssetlen(sds s,size_t newlen)

%sdssetlenDefinition = addFunction(libDef, ...
%    "void sdssetlen(sds s,size_t newlen)", ...
%    "MATLABName", "clib.hiredis_matlab.sdssetlen", ...
%    "Description", "clib.hiredis_matlab.sdssetlen Representation of C++ function sdssetlen."); % Modify help description values as needed.
%defineArgument(sdssetlenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdssetlenDefinition, "newlen", "uint64");
%validate(sdssetlenDefinition);

%% C++ function |sdsinclen| with MATLAB name |clib.hiredis_matlab.sdsinclen|
% C++ Signature: void sdsinclen(sds s,size_t inc)

%sdsinclenDefinition = addFunction(libDef, ...
%    "void sdsinclen(sds s,size_t inc)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsinclen", ...
%    "Description", "clib.hiredis_matlab.sdsinclen Representation of C++ function sdsinclen."); % Modify help description values as needed.
%defineArgument(sdsinclenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdsinclenDefinition, "inc", "uint64");
%validate(sdsinclenDefinition);

%% C++ function |sdsalloc| with MATLAB name |clib.hiredis_matlab.sdsalloc|
% C++ Signature: size_t sdsalloc(sds const s)

%sdsallocDefinition = addFunction(libDef, ...
%    "size_t sdsalloc(sds const s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsalloc", ...
%    "Description", "clib.hiredis_matlab.sdsalloc Representation of C++ function sdsalloc."); % Modify help description values as needed.
%defineArgument(sdsallocDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsallocDefinition, "RetVal", "uint64");
%validate(sdsallocDefinition);

%% C++ function |sdssetalloc| with MATLAB name |clib.hiredis_matlab.sdssetalloc|
% C++ Signature: void sdssetalloc(sds s,size_t newlen)

%sdssetallocDefinition = addFunction(libDef, ...
%    "void sdssetalloc(sds s,size_t newlen)", ...
%    "MATLABName", "clib.hiredis_matlab.sdssetalloc", ...
%    "Description", "clib.hiredis_matlab.sdssetalloc Representation of C++ function sdssetalloc."); % Modify help description values as needed.
%defineArgument(sdssetallocDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdssetallocDefinition, "newlen", "uint64");
%validate(sdssetallocDefinition);

%% C++ function |sdsnewlen| with MATLAB name |clib.hiredis_matlab.sdsnewlen|
% C++ Signature: sds sdsnewlen(void const * init,size_t initlen)

%sdsnewlenDefinition = addFunction(libDef, ...
%    "sds sdsnewlen(void const * init,size_t initlen)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsnewlen", ...
%    "Description", "clib.hiredis_matlab.sdsnewlen Representation of C++ function sdsnewlen."); % Modify help description values as needed.
%defineArgument(sdsnewlenDefinition, "init", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineArgument(sdsnewlenDefinition, "initlen", "uint64");
%defineOutput(sdsnewlenDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsnewlenDefinition);

%% C++ function |sdsnew| with MATLAB name |clib.hiredis_matlab.sdsnew|
% C++ Signature: sds sdsnew(char const * init)

%sdsnewDefinition = addFunction(libDef, ...
%    "sds sdsnew(char const * init)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsnew", ...
%    "Description", "clib.hiredis_matlab.sdsnew Representation of C++ function sdsnew."); % Modify help description values as needed.
%defineArgument(sdsnewDefinition, "init", "string", "input", "nullTerminated");
%defineOutput(sdsnewDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsnewDefinition);

%% C++ function |sdsempty| with MATLAB name |clib.hiredis_matlab.sdsempty|
% C++ Signature: sds sdsempty()

%sdsemptyDefinition = addFunction(libDef, ...
%    "sds sdsempty()", ...
%    "MATLABName", "clib.hiredis_matlab.sdsempty", ...
%    "Description", "clib.hiredis_matlab.sdsempty Representation of C++ function sdsempty."); % Modify help description values as needed.
%defineOutput(sdsemptyDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsemptyDefinition);

%% C++ function |sdsdup| with MATLAB name |clib.hiredis_matlab.sdsdup|
% C++ Signature: sds sdsdup(sds const s)

%sdsdupDefinition = addFunction(libDef, ...
%    "sds sdsdup(sds const s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsdup", ...
%    "Description", "clib.hiredis_matlab.sdsdup Representation of C++ function sdsdup."); % Modify help description values as needed.
%defineArgument(sdsdupDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsdupDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsdupDefinition);

%% C++ function |sdsfree| with MATLAB name |clib.hiredis_matlab.sdsfree|
% C++ Signature: void sdsfree(sds s)

%sdsfreeDefinition = addFunction(libDef, ...
%    "void sdsfree(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsfree", ...
%    "Description", "clib.hiredis_matlab.sdsfree Representation of C++ function sdsfree."); % Modify help description values as needed.
%defineArgument(sdsfreeDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(sdsfreeDefinition);

%% C++ function |sdsgrowzero| with MATLAB name |clib.hiredis_matlab.sdsgrowzero|
% C++ Signature: sds sdsgrowzero(sds s,size_t len)

%sdsgrowzeroDefinition = addFunction(libDef, ...
%    "sds sdsgrowzero(sds s,size_t len)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsgrowzero", ...
%    "Description", "clib.hiredis_matlab.sdsgrowzero Representation of C++ function sdsgrowzero."); % Modify help description values as needed.
%defineArgument(sdsgrowzeroDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdsgrowzeroDefinition, "len", "uint64");
%defineOutput(sdsgrowzeroDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsgrowzeroDefinition);

%% C++ function |sdscatlen| with MATLAB name |clib.hiredis_matlab.sdscatlen|
% C++ Signature: sds sdscatlen(sds s,void const * t,size_t len)

%sdscatlenDefinition = addFunction(libDef, ...
%    "sds sdscatlen(sds s,void const * t,size_t len)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscatlen", ...
%    "Description", "clib.hiredis_matlab.sdscatlen Representation of C++ function sdscatlen."); % Modify help description values as needed.
%defineArgument(sdscatlenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscatlenDefinition, "t", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineArgument(sdscatlenDefinition, "len", "uint64");
%defineOutput(sdscatlenDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdscatlenDefinition);

%% C++ function |sdscat| with MATLAB name |clib.hiredis_matlab.sdscat|
% C++ Signature: sds sdscat(sds s,char const * t)

%sdscatDefinition = addFunction(libDef, ...
%    "sds sdscat(sds s,char const * t)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscat", ...
%    "Description", "clib.hiredis_matlab.sdscat Representation of C++ function sdscat."); % Modify help description values as needed.
%defineArgument(sdscatDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscatDefinition, "t", "string", "input", "nullTerminated");
%defineOutput(sdscatDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdscatDefinition);

%% C++ function |sdscatsds| with MATLAB name |clib.hiredis_matlab.sdscatsds|
% C++ Signature: sds sdscatsds(sds s,sds const t)

%sdscatsdsDefinition = addFunction(libDef, ...
%    "sds sdscatsds(sds s,sds const t)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscatsds", ...
%    "Description", "clib.hiredis_matlab.sdscatsds Representation of C++ function sdscatsds."); % Modify help description values as needed.
%defineArgument(sdscatsdsDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscatsdsDefinition, "t", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdscatsdsDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdscatsdsDefinition);

%% C++ function |sdscpylen| with MATLAB name |clib.hiredis_matlab.sdscpylen|
% C++ Signature: sds sdscpylen(sds s,char const * t,size_t len)

%sdscpylenDefinition = addFunction(libDef, ...
%    "sds sdscpylen(sds s,char const * t,size_t len)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscpylen", ...
%    "Description", "clib.hiredis_matlab.sdscpylen Representation of C++ function sdscpylen."); % Modify help description values as needed.
%defineArgument(sdscpylenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscpylenDefinition, "t", "string", "input", "nullTerminated");
%defineArgument(sdscpylenDefinition, "len", "uint64");
%defineOutput(sdscpylenDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdscpylenDefinition);

%% C++ function |sdscpy| with MATLAB name |clib.hiredis_matlab.sdscpy|
% C++ Signature: sds sdscpy(sds s,char const * t)

%sdscpyDefinition = addFunction(libDef, ...
%    "sds sdscpy(sds s,char const * t)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscpy", ...
%    "Description", "clib.hiredis_matlab.sdscpy Representation of C++ function sdscpy."); % Modify help description values as needed.
%defineArgument(sdscpyDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscpyDefinition, "t", "string", "input", "nullTerminated");
%defineOutput(sdscpyDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdscpyDefinition);

%% C++ function |sdstrim| with MATLAB name |clib.hiredis_matlab.sdstrim|
% C++ Signature: sds sdstrim(sds s,char const * cset)

%sdstrimDefinition = addFunction(libDef, ...
%    "sds sdstrim(sds s,char const * cset)", ...
%    "MATLABName", "clib.hiredis_matlab.sdstrim", ...
%    "Description", "clib.hiredis_matlab.sdstrim Representation of C++ function sdstrim."); % Modify help description values as needed.
%defineArgument(sdstrimDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdstrimDefinition, "cset", "string", "input", "nullTerminated");
%defineOutput(sdstrimDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdstrimDefinition);

%% C++ function |sdsrange| with MATLAB name |clib.hiredis_matlab.sdsrange|
% C++ Signature: int sdsrange(sds s,ssize_t start,ssize_t end)

%sdsrangeDefinition = addFunction(libDef, ...
%    "int sdsrange(sds s,ssize_t start,ssize_t end)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsrange", ...
%    "Description", "clib.hiredis_matlab.sdsrange Representation of C++ function sdsrange."); % Modify help description values as needed.
%defineArgument(sdsrangeDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdsrangeDefinition, "start", "int64");
%defineArgument(sdsrangeDefinition, "end", "int64");
%defineOutput(sdsrangeDefinition, "RetVal", "int32");
%validate(sdsrangeDefinition);

%% C++ function |sdsupdatelen| with MATLAB name |clib.hiredis_matlab.sdsupdatelen|
% C++ Signature: void sdsupdatelen(sds s)

%sdsupdatelenDefinition = addFunction(libDef, ...
%    "void sdsupdatelen(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsupdatelen", ...
%    "Description", "clib.hiredis_matlab.sdsupdatelen Representation of C++ function sdsupdatelen."); % Modify help description values as needed.
%defineArgument(sdsupdatelenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(sdsupdatelenDefinition);

%% C++ function |sdsclear| with MATLAB name |clib.hiredis_matlab.sdsclear|
% C++ Signature: void sdsclear(sds s)

%sdsclearDefinition = addFunction(libDef, ...
%    "void sdsclear(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsclear", ...
%    "Description", "clib.hiredis_matlab.sdsclear Representation of C++ function sdsclear."); % Modify help description values as needed.
%defineArgument(sdsclearDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(sdsclearDefinition);

%% C++ function |sdscmp| with MATLAB name |clib.hiredis_matlab.sdscmp|
% C++ Signature: int sdscmp(sds const s1,sds const s2)

%sdscmpDefinition = addFunction(libDef, ...
%    "int sdscmp(sds const s1,sds const s2)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscmp", ...
%    "Description", "clib.hiredis_matlab.sdscmp Representation of C++ function sdscmp."); % Modify help description values as needed.
%defineArgument(sdscmpDefinition, "s1", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscmpDefinition, "s2", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdscmpDefinition, "RetVal", "int32");
%validate(sdscmpDefinition);

%% C++ function |sdsfreesplitres| with MATLAB name |clib.hiredis_matlab.sdsfreesplitres|
% C++ Signature: void sdsfreesplitres(sds * tokens,int count)

%sdsfreesplitresDefinition = addFunction(libDef, ...
%    "void sdsfreesplitres(sds * tokens,int count)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsfreesplitres", ...
%    "Description", "clib.hiredis_matlab.sdsfreesplitres Representation of C++ function sdsfreesplitres."); % Modify help description values as needed.
%defineArgument(sdsfreesplitresDefinition, "tokens", "string", "input", <SHAPE>);
%defineArgument(sdsfreesplitresDefinition, "count", "int32");
%validate(sdsfreesplitresDefinition);

%% C++ function |sdstolower| with MATLAB name |clib.hiredis_matlab.sdstolower|
% C++ Signature: void sdstolower(sds s)

%sdstolowerDefinition = addFunction(libDef, ...
%    "void sdstolower(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdstolower", ...
%    "Description", "clib.hiredis_matlab.sdstolower Representation of C++ function sdstolower."); % Modify help description values as needed.
%defineArgument(sdstolowerDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(sdstolowerDefinition);

%% C++ function |sdstoupper| with MATLAB name |clib.hiredis_matlab.sdstoupper|
% C++ Signature: void sdstoupper(sds s)

%sdstoupperDefinition = addFunction(libDef, ...
%    "void sdstoupper(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdstoupper", ...
%    "Description", "clib.hiredis_matlab.sdstoupper Representation of C++ function sdstoupper."); % Modify help description values as needed.
%defineArgument(sdstoupperDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(sdstoupperDefinition);

%% C++ function |sdsfromlonglong| with MATLAB name |clib.hiredis_matlab.sdsfromlonglong|
% C++ Signature: sds sdsfromlonglong(long long value)

%sdsfromlonglongDefinition = addFunction(libDef, ...
%    "sds sdsfromlonglong(long long value)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsfromlonglong", ...
%    "Description", "clib.hiredis_matlab.sdsfromlonglong Representation of C++ function sdsfromlonglong."); % Modify help description values as needed.
%defineArgument(sdsfromlonglongDefinition, "value", "int64");
%defineOutput(sdsfromlonglongDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsfromlonglongDefinition);

%% C++ function |sdscatrepr| with MATLAB name |clib.hiredis_matlab.sdscatrepr|
% C++ Signature: sds sdscatrepr(sds s,char const * p,size_t len)

%sdscatreprDefinition = addFunction(libDef, ...
%    "sds sdscatrepr(sds s,char const * p,size_t len)", ...
%    "MATLABName", "clib.hiredis_matlab.sdscatrepr", ...
%    "Description", "clib.hiredis_matlab.sdscatrepr Representation of C++ function sdscatrepr."); % Modify help description values as needed.
%defineArgument(sdscatreprDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdscatreprDefinition, "p", "string", "input", "nullTerminated");
%defineArgument(sdscatreprDefinition, "len", "uint64");
%defineOutput(sdscatreprDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdscatreprDefinition);

%% C++ function |sdsmapchars| with MATLAB name |clib.hiredis_matlab.sdsmapchars|
% C++ Signature: sds sdsmapchars(sds s,char const * from,char const * to,size_t setlen)

%sdsmapcharsDefinition = addFunction(libDef, ...
%    "sds sdsmapchars(sds s,char const * from,char const * to,size_t setlen)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsmapchars", ...
%    "Description", "clib.hiredis_matlab.sdsmapchars Representation of C++ function sdsmapchars."); % Modify help description values as needed.
%defineArgument(sdsmapcharsDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdsmapcharsDefinition, "from", "string", "input", "nullTerminated");
%defineArgument(sdsmapcharsDefinition, "to", "string", "input", "nullTerminated");
%defineArgument(sdsmapcharsDefinition, "setlen", "uint64");
%defineOutput(sdsmapcharsDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsmapcharsDefinition);

%% C++ function |sdsjoin| with MATLAB name |clib.hiredis_matlab.sdsjoin|
% C++ Signature: sds sdsjoin(char * * argv,int argc,char * sep)

%sdsjoinDefinition = addFunction(libDef, ...
%    "sds sdsjoin(char * * argv,int argc,char * sep)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsjoin", ...
%    "Description", "clib.hiredis_matlab.sdsjoin Representation of C++ function sdsjoin."); % Modify help description values as needed.
%defineArgument(sdsjoinDefinition, "argv", "string", "input", <SHAPE>);
%defineArgument(sdsjoinDefinition, "argc", "int32");
%defineArgument(sdsjoinDefinition, "sep", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsjoinDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsjoinDefinition);

%% C++ function |sdsjoinsds| with MATLAB name |clib.hiredis_matlab.sdsjoinsds|
% C++ Signature: sds sdsjoinsds(sds * argv,int argc,char const * sep,size_t seplen)

%sdsjoinsdsDefinition = addFunction(libDef, ...
%    "sds sdsjoinsds(sds * argv,int argc,char const * sep,size_t seplen)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsjoinsds", ...
%    "Description", "clib.hiredis_matlab.sdsjoinsds Representation of C++ function sdsjoinsds."); % Modify help description values as needed.
%defineArgument(sdsjoinsdsDefinition, "argv", "string", "input", <SHAPE>);
%defineArgument(sdsjoinsdsDefinition, "argc", "int32");
%defineArgument(sdsjoinsdsDefinition, "sep", "string", "input", "nullTerminated");
%defineArgument(sdsjoinsdsDefinition, "seplen", "uint64");
%defineOutput(sdsjoinsdsDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsjoinsdsDefinition);

%% C++ function |sdsMakeRoomFor| with MATLAB name |clib.hiredis_matlab.sdsMakeRoomFor|
% C++ Signature: sds sdsMakeRoomFor(sds s,size_t addlen)

%sdsMakeRoomForDefinition = addFunction(libDef, ...
%    "sds sdsMakeRoomFor(sds s,size_t addlen)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsMakeRoomFor", ...
%    "Description", "clib.hiredis_matlab.sdsMakeRoomFor Representation of C++ function sdsMakeRoomFor."); % Modify help description values as needed.
%defineArgument(sdsMakeRoomForDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdsMakeRoomForDefinition, "addlen", "uint64");
%defineOutput(sdsMakeRoomForDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsMakeRoomForDefinition);

%% C++ function |sdsIncrLen| with MATLAB name |clib.hiredis_matlab.sdsIncrLen|
% C++ Signature: void sdsIncrLen(sds s,int incr)

%sdsIncrLenDefinition = addFunction(libDef, ...
%    "void sdsIncrLen(sds s,int incr)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsIncrLen", ...
%    "Description", "clib.hiredis_matlab.sdsIncrLen Representation of C++ function sdsIncrLen."); % Modify help description values as needed.
%defineArgument(sdsIncrLenDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineArgument(sdsIncrLenDefinition, "incr", "int32");
%validate(sdsIncrLenDefinition);

%% C++ function |sdsRemoveFreeSpace| with MATLAB name |clib.hiredis_matlab.sdsRemoveFreeSpace|
% C++ Signature: sds sdsRemoveFreeSpace(sds s)

%sdsRemoveFreeSpaceDefinition = addFunction(libDef, ...
%    "sds sdsRemoveFreeSpace(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsRemoveFreeSpace", ...
%    "Description", "clib.hiredis_matlab.sdsRemoveFreeSpace Representation of C++ function sdsRemoveFreeSpace."); % Modify help description values as needed.
%defineArgument(sdsRemoveFreeSpaceDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsRemoveFreeSpaceDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(sdsRemoveFreeSpaceDefinition);

%% C++ function |sdsAllocSize| with MATLAB name |clib.hiredis_matlab.sdsAllocSize|
% C++ Signature: size_t sdsAllocSize(sds s)

%sdsAllocSizeDefinition = addFunction(libDef, ...
%    "size_t sdsAllocSize(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsAllocSize", ...
%    "Description", "clib.hiredis_matlab.sdsAllocSize Representation of C++ function sdsAllocSize."); % Modify help description values as needed.
%defineArgument(sdsAllocSizeDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsAllocSizeDefinition, "RetVal", "uint64");
%validate(sdsAllocSizeDefinition);

%% C++ function |sdsAllocPtr| with MATLAB name |clib.hiredis_matlab.sdsAllocPtr|
% C++ Signature: void * sdsAllocPtr(sds s)

%sdsAllocPtrDefinition = addFunction(libDef, ...
%    "void * sdsAllocPtr(sds s)", ...
%    "MATLABName", "clib.hiredis_matlab.sdsAllocPtr", ...
%    "Description", "clib.hiredis_matlab.sdsAllocPtr Representation of C++ function sdsAllocPtr."); % Modify help description values as needed.
%defineArgument(sdsAllocPtrDefinition, "s", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%defineOutput(sdsAllocPtrDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(sdsAllocPtrDefinition);

%% C++ function |sds_malloc| with MATLAB name |clib.hiredis_matlab.sds_malloc|
% C++ Signature: void * sds_malloc(size_t size)

%sds_mallocDefinition = addFunction(libDef, ...
%    "void * sds_malloc(size_t size)", ...
%    "MATLABName", "clib.hiredis_matlab.sds_malloc", ...
%    "Description", "clib.hiredis_matlab.sds_malloc Representation of C++ function sds_malloc."); % Modify help description values as needed.
%defineArgument(sds_mallocDefinition, "size", "uint64");
%defineOutput(sds_mallocDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(sds_mallocDefinition);

%% C++ function |sds_realloc| with MATLAB name |clib.hiredis_matlab.sds_realloc|
% C++ Signature: void * sds_realloc(void * ptr,size_t size)

%sds_reallocDefinition = addFunction(libDef, ...
%    "void * sds_realloc(void * ptr,size_t size)", ...
%    "MATLABName", "clib.hiredis_matlab.sds_realloc", ...
%    "Description", "clib.hiredis_matlab.sds_realloc Representation of C++ function sds_realloc."); % Modify help description values as needed.
%defineArgument(sds_reallocDefinition, "ptr", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineArgument(sds_reallocDefinition, "size", "uint64");
%defineOutput(sds_reallocDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(sds_reallocDefinition);

%% C++ function |sds_free| with MATLAB name |clib.hiredis_matlab.sds_free|
% C++ Signature: void sds_free(void * ptr)

%sds_freeDefinition = addFunction(libDef, ...
%    "void sds_free(void * ptr)", ...
%    "MATLABName", "clib.hiredis_matlab.sds_free", ...
%    "Description", "clib.hiredis_matlab.sds_free Representation of C++ function sds_free."); % Modify help description values as needed.
%defineArgument(sds_freeDefinition, "ptr", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%validate(sds_freeDefinition);

%% C++ function |hiredisSetAllocators| with MATLAB name |clib.hiredis_matlab.hiredisSetAllocators|
% C++ Signature: hiredisAllocFuncs hiredisSetAllocators(hiredisAllocFuncs * ha)

%hiredisSetAllocatorsDefinition = addFunction(libDef, ...
%    "hiredisAllocFuncs hiredisSetAllocators(hiredisAllocFuncs * ha)", ...
%    "MATLABName", "clib.hiredis_matlab.hiredisSetAllocators", ...
%    "Description", "clib.hiredis_matlab.hiredisSetAllocators Representation of C++ function hiredisSetAllocators."); % Modify help description values as needed.
%defineArgument(hiredisSetAllocatorsDefinition, "ha", "clib.hiredis_matlab.hiredisAllocFuncs", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.hiredisAllocFuncs", or "clib.array.hiredis_matlab.hiredisAllocFuncs"
%defineOutput(hiredisSetAllocatorsDefinition, "RetVal", "clib.hiredis_matlab.hiredisAllocFuncs");
%validate(hiredisSetAllocatorsDefinition);

%% C++ function |hiredisResetAllocators| with MATLAB name |clib.hiredis_matlab.hiredisResetAllocators|
% C++ Signature: void hiredisResetAllocators()

hiredisResetAllocatorsDefinition = addFunction(libDef, ...
    "void hiredisResetAllocators()", ...
    "MATLABName", "clib.hiredis_matlab.hiredisResetAllocators", ...
    "Description", "clib.hiredis_matlab.hiredisResetAllocators Representation of C++ function hiredisResetAllocators."); % Modify help description values as needed.
validate(hiredisResetAllocatorsDefinition);

%% C++ function |hi_malloc| with MATLAB name |clib.hiredis_matlab.hi_malloc|
% C++ Signature: void * hi_malloc(size_t size)

%hi_mallocDefinition = addFunction(libDef, ...
%    "void * hi_malloc(size_t size)", ...
%    "MATLABName", "clib.hiredis_matlab.hi_malloc", ...
%    "Description", "clib.hiredis_matlab.hi_malloc Representation of C++ function hi_malloc."); % Modify help description values as needed.
%defineArgument(hi_mallocDefinition, "size", "uint64");
%defineOutput(hi_mallocDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(hi_mallocDefinition);

%% C++ function |hi_calloc| with MATLAB name |clib.hiredis_matlab.hi_calloc|
% C++ Signature: void * hi_calloc(size_t nmemb,size_t size)

%hi_callocDefinition = addFunction(libDef, ...
%    "void * hi_calloc(size_t nmemb,size_t size)", ...
%    "MATLABName", "clib.hiredis_matlab.hi_calloc", ...
%    "Description", "clib.hiredis_matlab.hi_calloc Representation of C++ function hi_calloc."); % Modify help description values as needed.
%defineArgument(hi_callocDefinition, "nmemb", "uint64");
%defineArgument(hi_callocDefinition, "size", "uint64");
%defineOutput(hi_callocDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(hi_callocDefinition);

%% C++ function |hi_realloc| with MATLAB name |clib.hiredis_matlab.hi_realloc|
% C++ Signature: void * hi_realloc(void * ptr,size_t size)

%hi_reallocDefinition = addFunction(libDef, ...
%    "void * hi_realloc(void * ptr,size_t size)", ...
%    "MATLABName", "clib.hiredis_matlab.hi_realloc", ...
%    "Description", "clib.hiredis_matlab.hi_realloc Representation of C++ function hi_realloc."); % Modify help description values as needed.
%defineArgument(hi_reallocDefinition, "ptr", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineArgument(hi_reallocDefinition, "size", "uint64");
%defineOutput(hi_reallocDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(hi_reallocDefinition);

%% C++ function |hi_strdup| with MATLAB name |clib.hiredis_matlab.hi_strdup|
% C++ Signature: char * hi_strdup(char const * str)

%hi_strdupDefinition = addFunction(libDef, ...
%    "char * hi_strdup(char const * str)", ...
%    "MATLABName", "clib.hiredis_matlab.hi_strdup", ...
%    "Description", "clib.hiredis_matlab.hi_strdup Representation of C++ function hi_strdup."); % Modify help description values as needed.
%defineArgument(hi_strdupDefinition, "str", "string", "input", "nullTerminated");
%defineOutput(hi_strdupDefinition, "RetVal", "string", "nullTerminated", "DeleteFcn", <DELETER>); % Specify <DELETER> or remove the "DeleteFcn" option
%validate(hi_strdupDefinition);

%% C++ function |hi_free| with MATLAB name |clib.hiredis_matlab.hi_free|
% C++ Signature: void hi_free(void * ptr)

%hi_freeDefinition = addFunction(libDef, ...
%    "void hi_free(void * ptr)", ...
%    "MATLABName", "clib.hiredis_matlab.hi_free", ...
%    "Description", "clib.hiredis_matlab.hi_free Representation of C++ function hi_free."); % Modify help description values as needed.
%defineArgument(hi_freeDefinition, "ptr", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%validate(hi_freeDefinition);

%% C++ function |redisReaderCreate| with MATLAB name |clib.hiredis_matlab.redisReaderCreate|
% C++ Signature: redisReader * redisReaderCreate()

%redisReaderCreateDefinition = addFunction(libDef, ...
%    "redisReader * redisReaderCreate()", ...
%    "MATLABName", "clib.hiredis_matlab.redisReaderCreate", ...
%    "Description", "clib.hiredis_matlab.redisReaderCreate Representation of C++ function redisReaderCreate."); % Modify help description values as needed.
%defineOutput(redisReaderCreateDefinition, "RetVal", "clib.hiredis_matlab.redisReader", <SHAPE>);
%validate(redisReaderCreateDefinition);

%% C++ function |freeReplyObject| with MATLAB name |clib.hiredis_matlab.freeReplyObject|
% C++ Signature: void freeReplyObject(void * reply)

%freeReplyObjectDefinition = addFunction(libDef, ...
%    "void freeReplyObject(void * reply)", ...
%    "MATLABName", "clib.hiredis_matlab.freeReplyObject", ...
%    "Description", "clib.hiredis_matlab.freeReplyObject Representation of C++ function freeReplyObject."); % Modify help description values as needed.
%defineArgument(freeReplyObjectDefinition, "reply", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%validate(freeReplyObjectDefinition);

%% C++ function |redisFormatCommandArgv| with MATLAB name |clib.hiredis_matlab.redisFormatCommandArgv|
% C++ Signature: long long redisFormatCommandArgv(char * * target,int argc,char const * * argv,size_t const * argvlen)

%redisFormatCommandArgvDefinition = addFunction(libDef, ...
%    "long long redisFormatCommandArgv(char * * target,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis_matlab.redisFormatCommandArgv", ...
%    "Description", "clib.hiredis_matlab.redisFormatCommandArgv Representation of C++ function redisFormatCommandArgv."); % Modify help description values as needed.
%defineArgument(redisFormatCommandArgvDefinition, "target", "string", "input", <SHAPE>);
%defineArgument(redisFormatCommandArgvDefinition, "argc", "int32");
%defineArgument(redisFormatCommandArgvDefinition, "argv", "string", "input", {<SHAPE>, "nullTerminated"});
%defineArgument(redisFormatCommandArgvDefinition, "argvlen", "clib.array.hiredis_matlab.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.UnsignedLong", or "uint64"
%defineOutput(redisFormatCommandArgvDefinition, "RetVal", "int64");
%validate(redisFormatCommandArgvDefinition);

%% C++ function |redisFormatSdsCommandArgv| with MATLAB name |clib.hiredis_matlab.redisFormatSdsCommandArgv|
% C++ Signature: long long redisFormatSdsCommandArgv(sds * target,int argc,char const * * argv,size_t const * argvlen)

%redisFormatSdsCommandArgvDefinition = addFunction(libDef, ...
%    "long long redisFormatSdsCommandArgv(sds * target,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis_matlab.redisFormatSdsCommandArgv", ...
%    "Description", "clib.hiredis_matlab.redisFormatSdsCommandArgv Representation of C++ function redisFormatSdsCommandArgv."); % Modify help description values as needed.
%defineArgument(redisFormatSdsCommandArgvDefinition, "target", "string", "input", <SHAPE>);
%defineArgument(redisFormatSdsCommandArgvDefinition, "argc", "int32");
%defineArgument(redisFormatSdsCommandArgvDefinition, "argv", "string", "input", {<SHAPE>, "nullTerminated"});
%defineArgument(redisFormatSdsCommandArgvDefinition, "argvlen", "clib.array.hiredis_matlab.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.UnsignedLong", or "uint64"
%defineOutput(redisFormatSdsCommandArgvDefinition, "RetVal", "int64");
%validate(redisFormatSdsCommandArgvDefinition);

%% C++ function |redisFreeCommand| with MATLAB name |clib.hiredis_matlab.redisFreeCommand|
% C++ Signature: void redisFreeCommand(char * cmd)

%redisFreeCommandDefinition = addFunction(libDef, ...
%    "void redisFreeCommand(char * cmd)", ...
%    "MATLABName", "clib.hiredis_matlab.redisFreeCommand", ...
%    "Description", "clib.hiredis_matlab.redisFreeCommand Representation of C++ function redisFreeCommand."); % Modify help description values as needed.
%defineArgument(redisFreeCommandDefinition, "cmd", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(redisFreeCommandDefinition);

%% C++ function |redisFreeSdsCommand| with MATLAB name |clib.hiredis_matlab.redisFreeSdsCommand|
% C++ Signature: void redisFreeSdsCommand(sds cmd)

%redisFreeSdsCommandDefinition = addFunction(libDef, ...
%    "void redisFreeSdsCommand(sds cmd)", ...
%    "MATLABName", "clib.hiredis_matlab.redisFreeSdsCommand", ...
%    "Description", "clib.hiredis_matlab.redisFreeSdsCommand Representation of C++ function redisFreeSdsCommand."); % Modify help description values as needed.
%defineArgument(redisFreeSdsCommandDefinition, "cmd", "clib.array.hiredis_matlab.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Char","int8","string", or "char"
%validate(redisFreeSdsCommandDefinition);

%% C++ function |redisConnectWithOptions| with MATLAB name |clib.hiredis_matlab.redisConnectWithOptions|
% C++ Signature: redisContext * redisConnectWithOptions(redisOptions const * options)

%redisConnectWithOptionsDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectWithOptions(redisOptions const * options)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectWithOptions", ...
%    "Description", "clib.hiredis_matlab.redisConnectWithOptions Representation of C++ function redisConnectWithOptions."); % Modify help description values as needed.
%defineArgument(redisConnectWithOptionsDefinition, "options", "clib.hiredis_matlab.redisOptions", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisOptions", or "clib.array.hiredis_matlab.redisOptions"
%defineOutput(redisConnectWithOptionsDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectWithOptionsDefinition);

%% C++ function |redisConnect| with MATLAB name |clib.hiredis_matlab.redisConnect|
% C++ Signature: redisContext * redisConnect(char const * ip,int port)

%redisConnectDefinition = addFunction(libDef, ...
%    "redisContext * redisConnect(char const * ip,int port)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnect", ...
%    "Description", "clib.hiredis_matlab.redisConnect Representation of C++ function redisConnect."); % Modify help description values as needed.
%defineArgument(redisConnectDefinition, "ip", "string", "input", "nullTerminated");
%defineArgument(redisConnectDefinition, "port", "int32");
%defineOutput(redisConnectDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectDefinition);

%% C++ function |redisConnectNonBlock| with MATLAB name |clib.hiredis_matlab.redisConnectNonBlock|
% C++ Signature: redisContext * redisConnectNonBlock(char const * ip,int port)

%redisConnectNonBlockDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectNonBlock(char const * ip,int port)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectNonBlock", ...
%    "Description", "clib.hiredis_matlab.redisConnectNonBlock Representation of C++ function redisConnectNonBlock."); % Modify help description values as needed.
%defineArgument(redisConnectNonBlockDefinition, "ip", "string", "input", "nullTerminated");
%defineArgument(redisConnectNonBlockDefinition, "port", "int32");
%defineOutput(redisConnectNonBlockDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectNonBlockDefinition);

%% C++ function |redisConnectBindNonBlock| with MATLAB name |clib.hiredis_matlab.redisConnectBindNonBlock|
% C++ Signature: redisContext * redisConnectBindNonBlock(char const * ip,int port,char const * source_addr)

%redisConnectBindNonBlockDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectBindNonBlock(char const * ip,int port,char const * source_addr)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectBindNonBlock", ...
%    "Description", "clib.hiredis_matlab.redisConnectBindNonBlock Representation of C++ function redisConnectBindNonBlock."); % Modify help description values as needed.
%defineArgument(redisConnectBindNonBlockDefinition, "ip", "string", "input", "nullTerminated");
%defineArgument(redisConnectBindNonBlockDefinition, "port", "int32");
%defineArgument(redisConnectBindNonBlockDefinition, "source_addr", "string", "input", "nullTerminated");
%defineOutput(redisConnectBindNonBlockDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectBindNonBlockDefinition);

%% C++ function |redisConnectBindNonBlockWithReuse| with MATLAB name |clib.hiredis_matlab.redisConnectBindNonBlockWithReuse|
% C++ Signature: redisContext * redisConnectBindNonBlockWithReuse(char const * ip,int port,char const * source_addr)

%redisConnectBindNonBlockWithReuseDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectBindNonBlockWithReuse(char const * ip,int port,char const * source_addr)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectBindNonBlockWithReuse", ...
%    "Description", "clib.hiredis_matlab.redisConnectBindNonBlockWithReuse Representation of C++ function redisConnectBindNonBlockWithReuse."); % Modify help description values as needed.
%defineArgument(redisConnectBindNonBlockWithReuseDefinition, "ip", "string", "input", "nullTerminated");
%defineArgument(redisConnectBindNonBlockWithReuseDefinition, "port", "int32");
%defineArgument(redisConnectBindNonBlockWithReuseDefinition, "source_addr", "string", "input", "nullTerminated");
%defineOutput(redisConnectBindNonBlockWithReuseDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectBindNonBlockWithReuseDefinition);

%% C++ function |redisConnectUnix| with MATLAB name |clib.hiredis_matlab.redisConnectUnix|
% C++ Signature: redisContext * redisConnectUnix(char const * path)

%redisConnectUnixDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectUnix(char const * path)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectUnix", ...
%    "Description", "clib.hiredis_matlab.redisConnectUnix Representation of C++ function redisConnectUnix."); % Modify help description values as needed.
%defineArgument(redisConnectUnixDefinition, "path", "string", "input", "nullTerminated");
%defineOutput(redisConnectUnixDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectUnixDefinition);

%% C++ function |redisConnectUnixNonBlock| with MATLAB name |clib.hiredis_matlab.redisConnectUnixNonBlock|
% C++ Signature: redisContext * redisConnectUnixNonBlock(char const * path)

%redisConnectUnixNonBlockDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectUnixNonBlock(char const * path)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectUnixNonBlock", ...
%    "Description", "clib.hiredis_matlab.redisConnectUnixNonBlock Representation of C++ function redisConnectUnixNonBlock."); % Modify help description values as needed.
%defineArgument(redisConnectUnixNonBlockDefinition, "path", "string", "input", "nullTerminated");
%defineOutput(redisConnectUnixNonBlockDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectUnixNonBlockDefinition);

%% C++ function |redisConnectFd| with MATLAB name |clib.hiredis_matlab.redisConnectFd|
% C++ Signature: redisContext * redisConnectFd(redisFD fd)

%redisConnectFdDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectFd(redisFD fd)", ...
%    "MATLABName", "clib.hiredis_matlab.redisConnectFd", ...
%    "Description", "clib.hiredis_matlab.redisConnectFd Representation of C++ function redisConnectFd."); % Modify help description values as needed.
%defineArgument(redisConnectFdDefinition, "fd", "int32");
%defineOutput(redisConnectFdDefinition, "RetVal", "clib.hiredis_matlab.redisContext", <SHAPE>);
%validate(redisConnectFdDefinition);

%% C++ function |redisReconnect| with MATLAB name |clib.hiredis_matlab.redisReconnect|
% C++ Signature: int redisReconnect(redisContext * c)

%redisReconnectDefinition = addFunction(libDef, ...
%    "int redisReconnect(redisContext * c)", ...
%    "MATLABName", "clib.hiredis_matlab.redisReconnect", ...
%    "Description", "clib.hiredis_matlab.redisReconnect Representation of C++ function redisReconnect.", ...
%    "DetailedDescription", "This content is from the external library documentation." + newline + ...
%    "" + newline + ...
%    "Reconnect the given context using the saved information." + newline + ...
%    "" + newline + ...
%    "This re-uses the exact same connect options as in the initial connection." + newline + ...
%    "host, ip (or path), timeout and bind address are reused," + newline + ...
%    "flags are used unmodified from the existing context." + newline + ...
%    "" + newline + ...
%    "Returns REDIS_OK on successful connect or REDIS_ERR otherwise."); % Modify help description values as needed.
%defineArgument(redisReconnectDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineOutput(redisReconnectDefinition, "RetVal", "int32");
%validate(redisReconnectDefinition);

%% C++ function |redisEnableKeepAlive| with MATLAB name |clib.hiredis_matlab.redisEnableKeepAlive|
% C++ Signature: int redisEnableKeepAlive(redisContext * c)

%redisEnableKeepAliveDefinition = addFunction(libDef, ...
%    "int redisEnableKeepAlive(redisContext * c)", ...
%    "MATLABName", "clib.hiredis_matlab.redisEnableKeepAlive", ...
%    "Description", "clib.hiredis_matlab.redisEnableKeepAlive Representation of C++ function redisEnableKeepAlive."); % Modify help description values as needed.
%defineArgument(redisEnableKeepAliveDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineOutput(redisEnableKeepAliveDefinition, "RetVal", "int32");
%validate(redisEnableKeepAliveDefinition);

%% C++ function |redisEnableKeepAliveWithInterval| with MATLAB name |clib.hiredis_matlab.redisEnableKeepAliveWithInterval|
% C++ Signature: int redisEnableKeepAliveWithInterval(redisContext * c,int interval)

%redisEnableKeepAliveWithIntervalDefinition = addFunction(libDef, ...
%    "int redisEnableKeepAliveWithInterval(redisContext * c,int interval)", ...
%    "MATLABName", "clib.hiredis_matlab.redisEnableKeepAliveWithInterval", ...
%    "Description", "clib.hiredis_matlab.redisEnableKeepAliveWithInterval Representation of C++ function redisEnableKeepAliveWithInterval."); % Modify help description values as needed.
%defineArgument(redisEnableKeepAliveWithIntervalDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisEnableKeepAliveWithIntervalDefinition, "interval", "int32");
%defineOutput(redisEnableKeepAliveWithIntervalDefinition, "RetVal", "int32");
%validate(redisEnableKeepAliveWithIntervalDefinition);

%% C++ function |redisSetTcpUserTimeout| with MATLAB name |clib.hiredis_matlab.redisSetTcpUserTimeout|
% C++ Signature: int redisSetTcpUserTimeout(redisContext * c,unsigned int timeout)

%redisSetTcpUserTimeoutDefinition = addFunction(libDef, ...
%    "int redisSetTcpUserTimeout(redisContext * c,unsigned int timeout)", ...
%    "MATLABName", "clib.hiredis_matlab.redisSetTcpUserTimeout", ...
%    "Description", "clib.hiredis_matlab.redisSetTcpUserTimeout Representation of C++ function redisSetTcpUserTimeout."); % Modify help description values as needed.
%defineArgument(redisSetTcpUserTimeoutDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisSetTcpUserTimeoutDefinition, "timeout", "uint32");
%defineOutput(redisSetTcpUserTimeoutDefinition, "RetVal", "int32");
%validate(redisSetTcpUserTimeoutDefinition);

%% C++ function |redisFree| with MATLAB name |clib.hiredis_matlab.redisFree|
% C++ Signature: void redisFree(redisContext * c)

%redisFreeDefinition = addFunction(libDef, ...
%    "void redisFree(redisContext * c)", ...
%    "MATLABName", "clib.hiredis_matlab.redisFree", ...
%    "Description", "clib.hiredis_matlab.redisFree Representation of C++ function redisFree."); % Modify help description values as needed.
%defineArgument(redisFreeDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%validate(redisFreeDefinition);

%% C++ function |redisFreeKeepFd| with MATLAB name |clib.hiredis_matlab.redisFreeKeepFd|
% C++ Signature: redisFD redisFreeKeepFd(redisContext * c)

%redisFreeKeepFdDefinition = addFunction(libDef, ...
%    "redisFD redisFreeKeepFd(redisContext * c)", ...
%    "MATLABName", "clib.hiredis_matlab.redisFreeKeepFd", ...
%    "Description", "clib.hiredis_matlab.redisFreeKeepFd Representation of C++ function redisFreeKeepFd."); % Modify help description values as needed.
%defineArgument(redisFreeKeepFdDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineOutput(redisFreeKeepFdDefinition, "RetVal", "int32");
%validate(redisFreeKeepFdDefinition);

%% C++ function |redisBufferRead| with MATLAB name |clib.hiredis_matlab.redisBufferRead|
% C++ Signature: int redisBufferRead(redisContext * c)

%redisBufferReadDefinition = addFunction(libDef, ...
%    "int redisBufferRead(redisContext * c)", ...
%    "MATLABName", "clib.hiredis_matlab.redisBufferRead", ...
%    "Description", "clib.hiredis_matlab.redisBufferRead Representation of C++ function redisBufferRead."); % Modify help description values as needed.
%defineArgument(redisBufferReadDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineOutput(redisBufferReadDefinition, "RetVal", "int32");
%validate(redisBufferReadDefinition);

%% C++ function |redisBufferWrite| with MATLAB name |clib.hiredis_matlab.redisBufferWrite|
% C++ Signature: int redisBufferWrite(redisContext * c,int * done)

%redisBufferWriteDefinition = addFunction(libDef, ...
%    "int redisBufferWrite(redisContext * c,int * done)", ...
%    "MATLABName", "clib.hiredis_matlab.redisBufferWrite", ...
%    "Description", "clib.hiredis_matlab.redisBufferWrite Representation of C++ function redisBufferWrite."); % Modify help description values as needed.
%defineArgument(redisBufferWriteDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisBufferWriteDefinition, "done", "clib.array.hiredis_matlab.Int", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.Int", or "int32"
%defineOutput(redisBufferWriteDefinition, "RetVal", "int32");
%validate(redisBufferWriteDefinition);

%% C++ function |redisGetReply| with MATLAB name |clib.hiredis_matlab.redisGetReply|
% C++ Signature: int redisGetReply(redisContext * c,void * * reply)

%redisGetReplyDefinition = addFunction(libDef, ...
%    "int redisGetReply(redisContext * c,void * * reply)", ...
%    "MATLABName", "clib.hiredis_matlab.redisGetReply", ...
%    "Description", "clib.hiredis_matlab.redisGetReply Representation of C++ function redisGetReply."); % Modify help description values as needed.
%defineArgument(redisGetReplyDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisGetReplyDefinition, "reply", <MLTYPE>, "output", 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%defineOutput(redisGetReplyDefinition, "RetVal", "int32");
%validate(redisGetReplyDefinition);

%% C++ function |redisGetReplyFromReader| with MATLAB name |clib.hiredis_matlab.redisGetReplyFromReader|
% C++ Signature: int redisGetReplyFromReader(redisContext * c,void * * reply)

%redisGetReplyFromReaderDefinition = addFunction(libDef, ...
%    "int redisGetReplyFromReader(redisContext * c,void * * reply)", ...
%    "MATLABName", "clib.hiredis_matlab.redisGetReplyFromReader", ...
%    "Description", "clib.hiredis_matlab.redisGetReplyFromReader Representation of C++ function redisGetReplyFromReader."); % Modify help description values as needed.
%defineArgument(redisGetReplyFromReaderDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisGetReplyFromReaderDefinition, "reply", <MLTYPE>, "output", 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%defineOutput(redisGetReplyFromReaderDefinition, "RetVal", "int32");
%validate(redisGetReplyFromReaderDefinition);

%% C++ function |redisAppendFormattedCommand| with MATLAB name |clib.hiredis_matlab.redisAppendFormattedCommand|
% C++ Signature: int redisAppendFormattedCommand(redisContext * c,char const * cmd,size_t len)

%redisAppendFormattedCommandDefinition = addFunction(libDef, ...
%    "int redisAppendFormattedCommand(redisContext * c,char const * cmd,size_t len)", ...
%    "MATLABName", "clib.hiredis_matlab.redisAppendFormattedCommand", ...
%    "Description", "clib.hiredis_matlab.redisAppendFormattedCommand Representation of C++ function redisAppendFormattedCommand."); % Modify help description values as needed.
%defineArgument(redisAppendFormattedCommandDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisAppendFormattedCommandDefinition, "cmd", "string", "input", "nullTerminated");
%defineArgument(redisAppendFormattedCommandDefinition, "len", "uint64");
%defineOutput(redisAppendFormattedCommandDefinition, "RetVal", "int32");
%validate(redisAppendFormattedCommandDefinition);

%% C++ function |redisAppendCommandArgv| with MATLAB name |clib.hiredis_matlab.redisAppendCommandArgv|
% C++ Signature: int redisAppendCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)

%redisAppendCommandArgvDefinition = addFunction(libDef, ...
%    "int redisAppendCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis_matlab.redisAppendCommandArgv", ...
%    "Description", "clib.hiredis_matlab.redisAppendCommandArgv Representation of C++ function redisAppendCommandArgv."); % Modify help description values as needed.
%defineArgument(redisAppendCommandArgvDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisAppendCommandArgvDefinition, "argc", "int32");
%defineArgument(redisAppendCommandArgvDefinition, "argv", "string", "input", {<SHAPE>, "nullTerminated"});
%defineArgument(redisAppendCommandArgvDefinition, "argvlen", "clib.array.hiredis_matlab.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.UnsignedLong", or "uint64"
%defineOutput(redisAppendCommandArgvDefinition, "RetVal", "int32");
%validate(redisAppendCommandArgvDefinition);

%% C++ function |redisCommandArgv| with MATLAB name |clib.hiredis_matlab.redisCommandArgv|
% C++ Signature: void * redisCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)

%redisCommandArgvDefinition = addFunction(libDef, ...
%    "void * redisCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis_matlab.redisCommandArgv", ...
%    "Description", "clib.hiredis_matlab.redisCommandArgv Representation of C++ function redisCommandArgv."); % Modify help description values as needed.
%defineArgument(redisCommandArgvDefinition, "c", "clib.hiredis_matlab.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.redisContext", or "clib.array.hiredis_matlab.redisContext"
%defineArgument(redisCommandArgvDefinition, "argc", "int32");
%defineArgument(redisCommandArgvDefinition, "argv", "string", "input", {<SHAPE>, "nullTerminated"});
%defineArgument(redisCommandArgvDefinition, "argvlen", "clib.array.hiredis_matlab.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.UnsignedLong", or "uint64"
%defineOutput(redisCommandArgvDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(redisCommandArgvDefinition);

%% C++ function |dictGenHashFunction| with MATLAB name |clib.hiredis_matlab.dictGenHashFunction|
% C++ Signature: unsigned int dictGenHashFunction(unsigned char const * buf,int len)

%dictGenHashFunctionDefinition = addFunction(libDef, ...
%    "unsigned int dictGenHashFunction(unsigned char const * buf,int len)", ...
%    "MATLABName", "clib.hiredis_matlab.dictGenHashFunction", ...
%    "Description", "clib.hiredis_matlab.dictGenHashFunction Representation of C++ function dictGenHashFunction."); % Modify help description values as needed.
%defineArgument(dictGenHashFunctionDefinition, "buf", "clib.array.hiredis_matlab.UnsignedChar", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis_matlab.UnsignedChar", or "uint8"
%defineArgument(dictGenHashFunctionDefinition, "len", "int32");
%defineOutput(dictGenHashFunctionDefinition, "RetVal", "uint32");
%validate(dictGenHashFunctionDefinition);

%% C++ function |dictCreate| with MATLAB name |clib.hiredis_matlab.dictCreate|
% C++ Signature: dict * dictCreate(dictType * type,void * privDataPtr)

%dictCreateDefinition = addFunction(libDef, ...
%    "dict * dictCreate(dictType * type,void * privDataPtr)", ...
%    "MATLABName", "clib.hiredis_matlab.dictCreate", ...
%    "Description", "clib.hiredis_matlab.dictCreate Representation of C++ function dictCreate."); % Modify help description values as needed.
%defineArgument(dictCreateDefinition, "type", "clib.hiredis_matlab.dictType", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dictType", or "clib.array.hiredis_matlab.dictType"
%defineArgument(dictCreateDefinition, "privDataPtr", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineOutput(dictCreateDefinition, "RetVal", "clib.hiredis_matlab.dict", <SHAPE>);
%validate(dictCreateDefinition);

%% C++ function |dictExpand| with MATLAB name |clib.hiredis_matlab.dictExpand|
% C++ Signature: int dictExpand(dict * ht,unsigned long size)

%dictExpandDefinition = addFunction(libDef, ...
%    "int dictExpand(dict * ht,unsigned long size)", ...
%    "MATLABName", "clib.hiredis_matlab.dictExpand", ...
%    "Description", "clib.hiredis_matlab.dictExpand Representation of C++ function dictExpand."); % Modify help description values as needed.
%defineArgument(dictExpandDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%defineArgument(dictExpandDefinition, "size", "uint64");
%defineOutput(dictExpandDefinition, "RetVal", "int32");
%validate(dictExpandDefinition);

%% C++ function |dictAdd| with MATLAB name |clib.hiredis_matlab.dictAdd|
% C++ Signature: int dictAdd(dict * ht,void * key,void * val)

%dictAddDefinition = addFunction(libDef, ...
%    "int dictAdd(dict * ht,void * key,void * val)", ...
%    "MATLABName", "clib.hiredis_matlab.dictAdd", ...
%    "Description", "clib.hiredis_matlab.dictAdd Representation of C++ function dictAdd."); % Modify help description values as needed.
%defineArgument(dictAddDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%defineArgument(dictAddDefinition, "key", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineArgument(dictAddDefinition, "val", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineOutput(dictAddDefinition, "RetVal", "int32");
%validate(dictAddDefinition);

%% C++ function |dictReplace| with MATLAB name |clib.hiredis_matlab.dictReplace|
% C++ Signature: int dictReplace(dict * ht,void * key,void * val)

%dictReplaceDefinition = addFunction(libDef, ...
%    "int dictReplace(dict * ht,void * key,void * val)", ...
%    "MATLABName", "clib.hiredis_matlab.dictReplace", ...
%    "Description", "clib.hiredis_matlab.dictReplace Representation of C++ function dictReplace."); % Modify help description values as needed.
%defineArgument(dictReplaceDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%defineArgument(dictReplaceDefinition, "key", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineArgument(dictReplaceDefinition, "val", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineOutput(dictReplaceDefinition, "RetVal", "int32");
%validate(dictReplaceDefinition);

%% C++ function |dictDelete| with MATLAB name |clib.hiredis_matlab.dictDelete|
% C++ Signature: int dictDelete(dict * ht,void const * key)

%dictDeleteDefinition = addFunction(libDef, ...
%    "int dictDelete(dict * ht,void const * key)", ...
%    "MATLABName", "clib.hiredis_matlab.dictDelete", ...
%    "Description", "clib.hiredis_matlab.dictDelete Representation of C++ function dictDelete."); % Modify help description values as needed.
%defineArgument(dictDeleteDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%defineArgument(dictDeleteDefinition, "key", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineOutput(dictDeleteDefinition, "RetVal", "int32");
%validate(dictDeleteDefinition);

%% C++ function |dictRelease| with MATLAB name |clib.hiredis_matlab.dictRelease|
% C++ Signature: void dictRelease(dict * ht)

%dictReleaseDefinition = addFunction(libDef, ...
%    "void dictRelease(dict * ht)", ...
%    "MATLABName", "clib.hiredis_matlab.dictRelease", ...
%    "Description", "clib.hiredis_matlab.dictRelease Representation of C++ function dictRelease."); % Modify help description values as needed.
%defineArgument(dictReleaseDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%validate(dictReleaseDefinition);

%% C++ function |dictFind| with MATLAB name |clib.hiredis_matlab.dictFind|
% C++ Signature: dictEntry * dictFind(dict * ht,void const * key)

%dictFindDefinition = addFunction(libDef, ...
%    "dictEntry * dictFind(dict * ht,void const * key)", ...
%    "MATLABName", "clib.hiredis_matlab.dictFind", ...
%    "Description", "clib.hiredis_matlab.dictFind Representation of C++ function dictFind."); % Modify help description values as needed.
%defineArgument(dictFindDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%defineArgument(dictFindDefinition, "key", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%defineOutput(dictFindDefinition, "RetVal", "clib.hiredis_matlab.dictEntry", <SHAPE>);
%validate(dictFindDefinition);

%% C++ function |dictInitIterator| with MATLAB name |clib.hiredis_matlab.dictInitIterator|
% C++ Signature: void dictInitIterator(dictIterator * iter,dict * ht)

%dictInitIteratorDefinition = addFunction(libDef, ...
%    "void dictInitIterator(dictIterator * iter,dict * ht)", ...
%    "MATLABName", "clib.hiredis_matlab.dictInitIterator", ...
%    "Description", "clib.hiredis_matlab.dictInitIterator Representation of C++ function dictInitIterator."); % Modify help description values as needed.
%defineArgument(dictInitIteratorDefinition, "iter", "clib.hiredis_matlab.dictIterator", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dictIterator", or "clib.array.hiredis_matlab.dictIterator"
%defineArgument(dictInitIteratorDefinition, "ht", "clib.hiredis_matlab.dict", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dict", or "clib.array.hiredis_matlab.dict"
%validate(dictInitIteratorDefinition);

%% C++ function |dictNext| with MATLAB name |clib.hiredis_matlab.dictNext|
% C++ Signature: dictEntry * dictNext(dictIterator * iter)

%dictNextDefinition = addFunction(libDef, ...
%    "dictEntry * dictNext(dictIterator * iter)", ...
%    "MATLABName", "clib.hiredis_matlab.dictNext", ...
%    "Description", "clib.hiredis_matlab.dictNext Representation of C++ function dictNext."); % Modify help description values as needed.
%defineArgument(dictNextDefinition, "iter", "clib.hiredis_matlab.dictIterator", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis_matlab.dictIterator", or "clib.array.hiredis_matlab.dictIterator"
%defineOutput(dictNextDefinition, "RetVal", "clib.hiredis_matlab.dictEntry", <SHAPE>);
%validate(dictNextDefinition);

%% Validate the library definition
validate(libDef);

end
