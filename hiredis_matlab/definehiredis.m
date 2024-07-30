%% About definehiredis.m
% This file defines the MATLAB interface to the library |hiredis|.
%
% Commented sections represent C++ functionality that MATLAB cannot automatically define. To include
% functionality, uncomment a section and provide values for <SHAPE>, <DIRECTION>, etc. For more
% information, see helpview(fullfile(docroot,'matlab','helptargets.map'),'cpp_define_interface') to "Define MATLAB Interface for C++ Library".



%% Setup
% Do not edit this setup section.
function libDef = definehiredis()
libDef = clibgen.LibraryDefinition("hiredisData.xml");

%% OutputFolder and Libraries
libDef.OutputFolder = "/Users/deshazere/General-Atomics/fusion/projects/IRAD-1340-API/redis-simulink/hiredis_matlab";
libDef.Libraries = "/Users/deshazere/General-Atomics/fusion/projects/IRAD-1340-API/redis-simulink/redis_client/hiredis/libhiredis.dylib";

%% C++ function type |void(*)(void *, void *)| with MATLAB name |clib.type.hiredis.Function1|
addFunctionType(libDef, "void(*)(void *, void *)", "MATLABName", "clib.type.hiredis.Function1", ...
    "Description", "clib.type.hiredis.Function1    C++ function type mwCppAnonymousTypes::Function1."); % Modify help description values as needed.

%% C++ class |redisReplyObjectFunctions| with MATLAB name |clib.hiredis.redisReplyObjectFunctions|
redisReplyObjectFunctionsDefinition = addClass(libDef, "redisReplyObjectFunctions", "MATLABName", "clib.hiredis.redisReplyObjectFunctions", ...
    "Description", "clib.hiredis.redisReplyObjectFunctions    Representation of C++ class redisReplyObjectFunctions."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReplyObjectFunctions|
% C++ Signature: redisReplyObjectFunctions::redisReplyObjectFunctions(redisReplyObjectFunctions const & input1)

redisReplyObjectFunctionsConstructor1Definition = addConstructor(redisReplyObjectFunctionsDefinition, ...
    "redisReplyObjectFunctions::redisReplyObjectFunctions(redisReplyObjectFunctions const & input1)", ...
    "Description", "clib.hiredis.redisReplyObjectFunctions Constructor of C++ class redisReplyObjectFunctions."); % Modify help description values as needed.
defineArgument(redisReplyObjectFunctionsConstructor1Definition, "input1", "clib.hiredis.redisReplyObjectFunctions", "input");
validate(redisReplyObjectFunctionsConstructor1Definition);

%% C++ class constructor for C++ class |redisReplyObjectFunctions|
% C++ Signature: redisReplyObjectFunctions::redisReplyObjectFunctions()

redisReplyObjectFunctionsConstructor2Definition = addConstructor(redisReplyObjectFunctionsDefinition, ...
    "redisReplyObjectFunctions::redisReplyObjectFunctions()", ...
    "Description", "clib.hiredis.redisReplyObjectFunctions Constructor of C++ class redisReplyObjectFunctions."); % Modify help description values as needed.
validate(redisReplyObjectFunctionsConstructor2Definition);

%% C++ class |redisReader| with MATLAB name |clib.hiredis.redisReader|
redisReaderDefinition = addClass(libDef, "redisReader", "MATLABName", "clib.hiredis.redisReader", ...
    "Description", "clib.hiredis.redisReader    Representation of C++ class redisReader."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReader|
% C++ Signature: redisReader::redisReader(redisReader const & input1)

redisReaderConstructor1Definition = addConstructor(redisReaderDefinition, ...
    "redisReader::redisReader(redisReader const & input1)", ...
    "Description", "clib.hiredis.redisReader Constructor of C++ class redisReader."); % Modify help description values as needed.
defineArgument(redisReaderConstructor1Definition, "input1", "clib.hiredis.redisReader", "input");
validate(redisReaderConstructor1Definition);

%% C++ class constructor for C++ class |redisReader|
% C++ Signature: redisReader::redisReader()

redisReaderConstructor2Definition = addConstructor(redisReaderDefinition, ...
    "redisReader::redisReader()", ...
    "Description", "clib.hiredis.redisReader Constructor of C++ class redisReader."); % Modify help description values as needed.
validate(redisReaderConstructor2Definition);

%% C++ class public data member |err| for C++ class |redisReader|
% C++ Signature: int redisReader::err

addProperty(redisReaderDefinition, "err", "int32", ...
    "Description", "int32    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |errstr| for C++ class |redisReader|
% C++ Signature: char [128] redisReader::errstr

addProperty(redisReaderDefinition, "errstr", "clib.array.hiredis.Char", [128], ... % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
    "Description", "clib.array.hiredis.Char    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class public data member |buf| for C++ class |redisReader|
% C++ Signature: char * redisReader::buf

%addProperty(redisReaderDefinition, "buf", <MLTYPE>, <SHAPE>, ... % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
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

%addProperty(redisReaderDefinition, "fn", "clib.hiredis.redisReplyObjectFunctions", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis.redisReplyObjectFunctions", or "clib.array.hiredis.redisReplyObjectFunctions"
%    "Description", "clib.hiredis.redisReplyObjectFunctions    Data member of C++ class redisReader."); % Modify help description values as needed.

%% C++ class |redisAsyncContext| with MATLAB name |clib.hiredis.redisAsyncContext|
redisAsyncContextDefinition = addClass(libDef, "redisAsyncContext", "MATLABName", "clib.hiredis.redisAsyncContext", ...
    "Description", "clib.hiredis.redisAsyncContext    Representation of C++ class redisAsyncContext."); % Modify help description values as needed.

%% C++ class |redisReply| with MATLAB name |clib.hiredis.redisReply|
redisReplyDefinition = addClass(libDef, "redisReply", "MATLABName", "clib.hiredis.redisReply", ...
    "Description", "clib.hiredis.redisReply    Representation of C++ class redisReply."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisReply|
% C++ Signature: redisReply::redisReply(redisReply const & input1)

redisReplyConstructor1Definition = addConstructor(redisReplyDefinition, ...
    "redisReply::redisReply(redisReply const & input1)", ...
    "Description", "clib.hiredis.redisReply Constructor of C++ class redisReply."); % Modify help description values as needed.
defineArgument(redisReplyConstructor1Definition, "input1", "clib.hiredis.redisReply", "input");
validate(redisReplyConstructor1Definition);

%% C++ class constructor for C++ class |redisReply|
% C++ Signature: redisReply::redisReply()

redisReplyConstructor2Definition = addConstructor(redisReplyDefinition, ...
    "redisReply::redisReply()", ...
    "Description", "clib.hiredis.redisReply Constructor of C++ class redisReply."); % Modify help description values as needed.
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

%addProperty(redisReplyDefinition, "str", <MLTYPE>, <SHAPE>, ... % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%    "Description", "<MLTYPE>    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |vtype| for C++ class |redisReply|
% C++ Signature: char [4] redisReply::vtype

addProperty(redisReplyDefinition, "vtype", "clib.array.hiredis.Char", [4], ... % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
    "Description", "clib.array.hiredis.Char    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |elements| for C++ class |redisReply|
% C++ Signature: size_t redisReply::elements

addProperty(redisReplyDefinition, "elements", "uint64", ...
    "Description", "uint64    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ class public data member |element| for C++ class |redisReply|
% C++ Signature: size_t redisReply::elements

addProperty(redisReplyDefinition, "element", "clib.array.hiredis.redisReply", []...
    "Description", "uint64    Data member of C++ class redisReply."); % Modify help description values as needed.

%% C++ enumeration |redisConnectionType| with MATLAB name |clib.hiredis.redisConnectionType|
addEnumeration(libDef, "redisConnectionType", "int32",...
    [...
      "REDIS_CONN_TCP",...  % 0
      "REDIS_CONN_UNIX",...  % 1
      "REDIS_CONN_USERFD",...  % 2
    ],...
    "MATLABName", "clib.hiredis.redisConnectionType", ...
    "Description", "clib.hiredis.redisConnectionType    Representation of C++ enumeration redisConnectionType."); % Modify help description values as needed.

%% C++ class |redisSsl| with MATLAB name |clib.hiredis.redisSsl|
redisSslDefinition = addClass(libDef, "redisSsl", "MATLABName", "clib.hiredis.redisSsl", ...
    "Description", "clib.hiredis.redisSsl    Representation of C++ class redisSsl."); % Modify help description values as needed.

%% C++ class |redisOptions| with MATLAB name |clib.hiredis.redisOptions|
redisOptionsDefinition = addClass(libDef, "redisOptions", "MATLABName", "clib.hiredis.redisOptions", ...
    "Description", "clib.hiredis.redisOptions    Representation of C++ class redisOptions."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisOptions|
% C++ Signature: redisOptions::redisOptions(redisOptions const & input1)

redisOptionsConstructor1Definition = addConstructor(redisOptionsDefinition, ...
    "redisOptions::redisOptions(redisOptions const & input1)", ...
    "Description", "clib.hiredis.redisOptions Constructor of C++ class redisOptions."); % Modify help description values as needed.
defineArgument(redisOptionsConstructor1Definition, "input1", "clib.hiredis.redisOptions", "input");
validate(redisOptionsConstructor1Definition);

%% C++ class constructor for C++ class |redisOptions|
% C++ Signature: redisOptions::redisOptions()

redisOptionsConstructor2Definition = addConstructor(redisOptionsDefinition, ...
    "redisOptions::redisOptions()", ...
    "Description", "clib.hiredis.redisOptions Constructor of C++ class redisOptions."); % Modify help description values as needed.
validate(redisOptionsConstructor2Definition);

%% C++ class public data member |type| for C++ class |redisOptions|
% C++ Signature: int redisOptions::type

addProperty(redisOptionsDefinition, "type", "int32", ...
    "Description", "int32    Data member of C++ class redisOptions."); % Modify help description values as needed.

%% C++ class public data member |options| for C++ class |redisOptions|
% C++ Signature: int redisOptions::options

addProperty(redisOptionsDefinition, "options", "int32", ...
    "Description", "int32    Data member of C++ class redisOptions."); % Modify help description values as needed.

%% C++ class |redisContextFuncs| with MATLAB name |clib.hiredis.redisContextFuncs|
redisContextFuncsDefinition = addClass(libDef, "redisContextFuncs", "MATLABName", "clib.hiredis.redisContextFuncs", ...
    "Description", "clib.hiredis.redisContextFuncs    Representation of C++ class redisContextFuncs."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisContextFuncs|
% C++ Signature: redisContextFuncs::redisContextFuncs(redisContextFuncs const & input1)

redisContextFuncsConstructor1Definition = addConstructor(redisContextFuncsDefinition, ...
    "redisContextFuncs::redisContextFuncs(redisContextFuncs const & input1)", ...
    "Description", "clib.hiredis.redisContextFuncs Constructor of C++ class redisContextFuncs."); % Modify help description values as needed.
defineArgument(redisContextFuncsConstructor1Definition, "input1", "clib.hiredis.redisContextFuncs", "input");
validate(redisContextFuncsConstructor1Definition);

%% C++ class constructor for C++ class |redisContextFuncs|
% C++ Signature: redisContextFuncs::redisContextFuncs()

redisContextFuncsConstructor2Definition = addConstructor(redisContextFuncsDefinition, ...
    "redisContextFuncs::redisContextFuncs()", ...
    "Description", "clib.hiredis.redisContextFuncs Constructor of C++ class redisContextFuncs."); % Modify help description values as needed.
validate(redisContextFuncsConstructor2Definition);

%% C++ class |redisContext| with MATLAB name |clib.hiredis.redisContext|
redisContextDefinition = addClass(libDef, "redisContext", "MATLABName", "clib.hiredis.redisContext", ...
    "Description", "clib.hiredis.redisContext    Representation of C++ class redisContext."); % Modify help description values as needed.

%% C++ class constructor for C++ class |redisContext|
% C++ Signature: redisContext::redisContext(redisContext const & input1)

redisContextConstructor1Definition = addConstructor(redisContextDefinition, ...
    "redisContext::redisContext(redisContext const & input1)", ...
    "Description", "clib.hiredis.redisContext Constructor of C++ class redisContext."); % Modify help description values as needed.
defineArgument(redisContextConstructor1Definition, "input1", "clib.hiredis.redisContext", "input");
validate(redisContextConstructor1Definition);

%% C++ class constructor for C++ class |redisContext|
% C++ Signature: redisContext::redisContext()

redisContextConstructor2Definition = addConstructor(redisContextDefinition, ...
    "redisContext::redisContext()", ...
    "Description", "clib.hiredis.redisContext Constructor of C++ class redisContext."); % Modify help description values as needed.
validate(redisContextConstructor2Definition);

%% C++ class public data member |funcs| for C++ class |redisContext|
% C++ Signature: redisContextFuncs const * redisContext::funcs

%addProperty(redisContextDefinition, "funcs", "clib.hiredis.redisContextFuncs", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis.redisContextFuncs", or "clib.array.hiredis.redisContextFuncs"
%    "Description", "clib.hiredis.redisContextFuncs    read-only Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |err| for C++ class |redisContext|
% C++ Signature: int redisContext::err

addProperty(redisContextDefinition, "err", "int32", ...
    "Description", "int32    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |errstr| for C++ class |redisContext|
% C++ Signature: char [128] redisContext::errstr

addProperty(redisContextDefinition, "errstr", "clib.array.hiredis.Char", [128], ... % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
    "Description", "clib.array.hiredis.Char    Data member of C++ class redisContext."); % Modify help description values as needed.

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

%addProperty(redisContextDefinition, "obuf", <MLTYPE>, <SHAPE>, ... % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%    "Description", "<MLTYPE>    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |reader| for C++ class |redisContext|
% C++ Signature: redisReader * redisContext::reader

%addProperty(redisContextDefinition, "reader", "clib.hiredis.redisReader", <SHAPE>, ... % <MLTYPE> can be "clib.hiredis.redisReader", or "clib.array.hiredis.redisReader"
%    "Description", "clib.hiredis.redisReader    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |connection_type| for C++ class |redisContext|
% C++ Signature: redisConnectionType redisContext::connection_type

addProperty(redisContextDefinition, "connection_type", "clib.hiredis.redisConnectionType", ...
    "Description", "clib.hiredis.redisConnectionType    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |saddr| for C++ class |redisContext|
% C++ Signature: sockaddr * redisContext::saddr

%addProperty(redisContextDefinition, "saddr", "clib.hiredis.sockaddr", <SHAPE>, ...
%    "Description", "clib.hiredis.sockaddr    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class public data member |addrlen| for C++ class |redisContext|
% C++ Signature: size_t redisContext::addrlen

addProperty(redisContextDefinition, "addrlen", "uint64", ...
    "Description", "uint64    Data member of C++ class redisContext."); % Modify help description values as needed.

%% C++ class |sockaddr| with MATLAB name |clib.hiredis.sockaddr|
sockaddrDefinition = addClass(libDef, "sockaddr", "MATLABName", "clib.hiredis.sockaddr", ...
    "Description", "clib.hiredis.sockaddr    Representation of C++ class sockaddr."); % Modify help description values as needed.

%% C++ function |redisReaderCreate| with MATLAB name |clib.hiredis.redisReaderCreate|
% C++ Signature: redisReader * redisReaderCreate()

%redisReaderCreateDefinition = addFunction(libDef, ...
%    "redisReader * redisReaderCreate()", ...
%    "MATLABName", "clib.hiredis.redisReaderCreate", ...
%    "Description", "clib.hiredis.redisReaderCreate Representation of C++ function redisReaderCreate."); % Modify help description values as needed.
%defineOutput(redisReaderCreateDefinition, "RetVal", "clib.hiredis.redisReader", <SHAPE>);
%validate(redisReaderCreateDefinition);

%% C++ function |freeReplyObject| with MATLAB name |clib.hiredis.freeReplyObject|
% C++ Signature: void freeReplyObject(void * reply)

%freeReplyObjectDefinition = addFunction(libDef, ...
%    "void freeReplyObject(void * reply)", ...
%    "MATLABName", "clib.hiredis.freeReplyObject", ...
%    "Description", "clib.hiredis.freeReplyObject Representation of C++ function freeReplyObject."); % Modify help description values as needed.
%defineArgument(freeReplyObjectDefinition, "reply", <MLTYPE>, <DIRECTION>, <SHAPE>); % <MLTYPE> can be primitive type, user-defined type, clib.array type, or a list of existing typedef names for void*.
%validate(freeReplyObjectDefinition);

%% C++ function |redisFormatCommandArgv| with MATLAB name |clib.hiredis.redisFormatCommandArgv|
% C++ Signature: long long redisFormatCommandArgv(char * * target,int argc,char const * * argv,size_t const * argvlen)

%redisFormatCommandArgvDefinition = addFunction(libDef, ...
%    "long long redisFormatCommandArgv(char * * target,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis.redisFormatCommandArgv", ...
%    "Description", "clib.hiredis.redisFormatCommandArgv Representation of C++ function redisFormatCommandArgv."); % Modify help description values as needed.
%defineArgument(redisFormatCommandArgvDefinition, "target", "string", "input", <SHAPE>);
%defineArgument(redisFormatCommandArgvDefinition, "argc", "int32");
%defineArgument(redisFormatCommandArgvDefinition, "argv", "string", "input", <SHAPE>);
%defineArgument(redisFormatCommandArgvDefinition, "argvlen", "clib.array.hiredis.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.UnsignedLong", or "uint64"
%defineOutput(redisFormatCommandArgvDefinition, "RetVal", "int64");
%validate(redisFormatCommandArgvDefinition);

%% C++ function |redisFormatSdsCommandArgv| with MATLAB name |clib.hiredis.redisFormatSdsCommandArgv|
% C++ Signature: long long redisFormatSdsCommandArgv(sds * target,int argc,char const * * argv,size_t const * argvlen)

%redisFormatSdsCommandArgvDefinition = addFunction(libDef, ...
%    "long long redisFormatSdsCommandArgv(sds * target,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis.redisFormatSdsCommandArgv", ...
%    "Description", "clib.hiredis.redisFormatSdsCommandArgv Representation of C++ function redisFormatSdsCommandArgv."); % Modify help description values as needed.
%defineArgument(redisFormatSdsCommandArgvDefinition, "target", "string", "input", <SHAPE>);
%defineArgument(redisFormatSdsCommandArgvDefinition, "argc", "int32");
%defineArgument(redisFormatSdsCommandArgvDefinition, "argv", "string", "input", <SHAPE>);
%defineArgument(redisFormatSdsCommandArgvDefinition, "argvlen", "clib.array.hiredis.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.UnsignedLong", or "uint64"
%defineOutput(redisFormatSdsCommandArgvDefinition, "RetVal", "int64");
%validate(redisFormatSdsCommandArgvDefinition);

%% C++ function |redisFreeCommand| with MATLAB name |clib.hiredis.redisFreeCommand|
% C++ Signature: void redisFreeCommand(char * cmd)

%redisFreeCommandDefinition = addFunction(libDef, ...
%    "void redisFreeCommand(char * cmd)", ...
%    "MATLABName", "clib.hiredis.redisFreeCommand", ...
%    "Description", "clib.hiredis.redisFreeCommand Representation of C++ function redisFreeCommand."); % Modify help description values as needed.
%defineArgument(redisFreeCommandDefinition, "cmd", "clib.array.hiredis.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%validate(redisFreeCommandDefinition);

%% C++ function |redisFreeSdsCommand| with MATLAB name |clib.hiredis.redisFreeSdsCommand|
% C++ Signature: void redisFreeSdsCommand(sds cmd)

%redisFreeSdsCommandDefinition = addFunction(libDef, ...
%    "void redisFreeSdsCommand(sds cmd)", ...
%    "MATLABName", "clib.hiredis.redisFreeSdsCommand", ...
%    "Description", "clib.hiredis.redisFreeSdsCommand Representation of C++ function redisFreeSdsCommand."); % Modify help description values as needed.
%defineArgument(redisFreeSdsCommandDefinition, "cmd", "clib.array.hiredis.Char", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%validate(redisFreeSdsCommandDefinition);

%% C++ function |redisConnectWithOptions| with MATLAB name |clib.hiredis.redisConnectWithOptions|
% C++ Signature: redisContext * redisConnectWithOptions(redisOptions const * options)

%redisConnectWithOptionsDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectWithOptions(redisOptions const * options)", ...
%    "MATLABName", "clib.hiredis.redisConnectWithOptions", ...
%    "Description", "clib.hiredis.redisConnectWithOptions Representation of C++ function redisConnectWithOptions."); % Modify help description values as needed.
%defineArgument(redisConnectWithOptionsDefinition, "options", "clib.hiredis.redisOptions", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisOptions", or "clib.array.hiredis.redisOptions"
%defineOutput(redisConnectWithOptionsDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectWithOptionsDefinition);

%% C++ function |redisConnect| with MATLAB name |clib.hiredis.redisConnect|
% C++ Signature: redisContext * redisConnect(char const * ip,int port)

%redisConnectDefinition = addFunction(libDef, ...
%    "redisContext * redisConnect(char const * ip,int port)", ...
%    "MATLABName", "clib.hiredis.redisConnect", ...
%    "Description", "clib.hiredis.redisConnect Representation of C++ function redisConnect."); % Modify help description values as needed.
%defineArgument(redisConnectDefinition, "ip", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineArgument(redisConnectDefinition, "port", "int32");
%defineOutput(redisConnectDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectDefinition);

%% C++ function |redisConnectNonBlock| with MATLAB name |clib.hiredis.redisConnectNonBlock|
% C++ Signature: redisContext * redisConnectNonBlock(char const * ip,int port)

%redisConnectNonBlockDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectNonBlock(char const * ip,int port)", ...
%    "MATLABName", "clib.hiredis.redisConnectNonBlock", ...
%    "Description", "clib.hiredis.redisConnectNonBlock Representation of C++ function redisConnectNonBlock."); % Modify help description values as needed.
%defineArgument(redisConnectNonBlockDefinition, "ip", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineArgument(redisConnectNonBlockDefinition, "port", "int32");
%defineOutput(redisConnectNonBlockDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectNonBlockDefinition);

%% C++ function |redisConnectBindNonBlock| with MATLAB name |clib.hiredis.redisConnectBindNonBlock|
% C++ Signature: redisContext * redisConnectBindNonBlock(char const * ip,int port,char const * source_addr)

%redisConnectBindNonBlockDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectBindNonBlock(char const * ip,int port,char const * source_addr)", ...
%    "MATLABName", "clib.hiredis.redisConnectBindNonBlock", ...
%    "Description", "clib.hiredis.redisConnectBindNonBlock Representation of C++ function redisConnectBindNonBlock."); % Modify help description values as needed.
%defineArgument(redisConnectBindNonBlockDefinition, "ip", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineArgument(redisConnectBindNonBlockDefinition, "port", "int32");
%defineArgument(redisConnectBindNonBlockDefinition, "source_addr", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineOutput(redisConnectBindNonBlockDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectBindNonBlockDefinition);

%% C++ function |redisConnectBindNonBlockWithReuse| with MATLAB name |clib.hiredis.redisConnectBindNonBlockWithReuse|
% C++ Signature: redisContext * redisConnectBindNonBlockWithReuse(char const * ip,int port,char const * source_addr)

%redisConnectBindNonBlockWithReuseDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectBindNonBlockWithReuse(char const * ip,int port,char const * source_addr)", ...
%    "MATLABName", "clib.hiredis.redisConnectBindNonBlockWithReuse", ...
%    "Description", "clib.hiredis.redisConnectBindNonBlockWithReuse Representation of C++ function redisConnectBindNonBlockWithReuse."); % Modify help description values as needed.
%defineArgument(redisConnectBindNonBlockWithReuseDefinition, "ip", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineArgument(redisConnectBindNonBlockWithReuseDefinition, "port", "int32");
%defineArgument(redisConnectBindNonBlockWithReuseDefinition, "source_addr", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineOutput(redisConnectBindNonBlockWithReuseDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectBindNonBlockWithReuseDefinition);

%% C++ function |redisConnectUnix| with MATLAB name |clib.hiredis.redisConnectUnix|
% C++ Signature: redisContext * redisConnectUnix(char const * path)

%redisConnectUnixDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectUnix(char const * path)", ...
%    "MATLABName", "clib.hiredis.redisConnectUnix", ...
%    "Description", "clib.hiredis.redisConnectUnix Representation of C++ function redisConnectUnix."); % Modify help description values as needed.
%defineArgument(redisConnectUnixDefinition, "path", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineOutput(redisConnectUnixDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectUnixDefinition);

%% C++ function |redisConnectUnixNonBlock| with MATLAB name |clib.hiredis.redisConnectUnixNonBlock|
% C++ Signature: redisContext * redisConnectUnixNonBlock(char const * path)

%redisConnectUnixNonBlockDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectUnixNonBlock(char const * path)", ...
%    "MATLABName", "clib.hiredis.redisConnectUnixNonBlock", ...
%    "Description", "clib.hiredis.redisConnectUnixNonBlock Representation of C++ function redisConnectUnixNonBlock."); % Modify help description values as needed.
%defineArgument(redisConnectUnixNonBlockDefinition, "path", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineOutput(redisConnectUnixNonBlockDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectUnixNonBlockDefinition);

%% C++ function |redisConnectFd| with MATLAB name |clib.hiredis.redisConnectFd|
% C++ Signature: redisContext * redisConnectFd(redisFD fd)

%redisConnectFdDefinition = addFunction(libDef, ...
%    "redisContext * redisConnectFd(redisFD fd)", ...
%    "MATLABName", "clib.hiredis.redisConnectFd", ...
%    "Description", "clib.hiredis.redisConnectFd Representation of C++ function redisConnectFd."); % Modify help description values as needed.
%defineArgument(redisConnectFdDefinition, "fd", "int32");
%defineOutput(redisConnectFdDefinition, "RetVal", "clib.hiredis.redisContext", <SHAPE>);
%validate(redisConnectFdDefinition);

%% C++ function |redisReconnect| with MATLAB name |clib.hiredis.redisReconnect|
% C++ Signature: int redisReconnect(redisContext * c)

%redisReconnectDefinition = addFunction(libDef, ...
%    "int redisReconnect(redisContext * c)", ...
%    "MATLABName", "clib.hiredis.redisReconnect", ...
%    "Description", "clib.hiredis.redisReconnect Representation of C++ function redisReconnect.", ...
%    "DetailedDescription", "This content is from the external library documentation." + newline + ...
%    "" + newline + ...
%    "Reconnect the given context using the saved information." + newline + ...
%    "" + newline + ...
%    "This re-uses the exact same connect options as in the initial connection." + newline + ...
%    "host, ip (or path), timeout and bind address are reused," + newline + ...
%    "flags are used unmodified from the existing context." + newline + ...
%    "" + newline + ...
%    "Returns REDIS_OK on successful connect or REDIS_ERR otherwise."); % Modify help description values as needed.
%defineArgument(redisReconnectDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineOutput(redisReconnectDefinition, "RetVal", "int32");
%validate(redisReconnectDefinition);

%% C++ function |redisEnableKeepAlive| with MATLAB name |clib.hiredis.redisEnableKeepAlive|
% C++ Signature: int redisEnableKeepAlive(redisContext * c)

%redisEnableKeepAliveDefinition = addFunction(libDef, ...
%    "int redisEnableKeepAlive(redisContext * c)", ...
%    "MATLABName", "clib.hiredis.redisEnableKeepAlive", ...
%    "Description", "clib.hiredis.redisEnableKeepAlive Representation of C++ function redisEnableKeepAlive."); % Modify help description values as needed.
%defineArgument(redisEnableKeepAliveDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineOutput(redisEnableKeepAliveDefinition, "RetVal", "int32");
%validate(redisEnableKeepAliveDefinition);

%% C++ function |redisEnableKeepAliveWithInterval| with MATLAB name |clib.hiredis.redisEnableKeepAliveWithInterval|
% C++ Signature: int redisEnableKeepAliveWithInterval(redisContext * c,int interval)

%redisEnableKeepAliveWithIntervalDefinition = addFunction(libDef, ...
%    "int redisEnableKeepAliveWithInterval(redisContext * c,int interval)", ...
%    "MATLABName", "clib.hiredis.redisEnableKeepAliveWithInterval", ...
%    "Description", "clib.hiredis.redisEnableKeepAliveWithInterval Representation of C++ function redisEnableKeepAliveWithInterval."); % Modify help description values as needed.
%defineArgument(redisEnableKeepAliveWithIntervalDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisEnableKeepAliveWithIntervalDefinition, "interval", "int32");
%defineOutput(redisEnableKeepAliveWithIntervalDefinition, "RetVal", "int32");
%validate(redisEnableKeepAliveWithIntervalDefinition);

%% C++ function |redisSetTcpUserTimeout| with MATLAB name |clib.hiredis.redisSetTcpUserTimeout|
% C++ Signature: int redisSetTcpUserTimeout(redisContext * c,unsigned int timeout)

%redisSetTcpUserTimeoutDefinition = addFunction(libDef, ...
%    "int redisSetTcpUserTimeout(redisContext * c,unsigned int timeout)", ...
%    "MATLABName", "clib.hiredis.redisSetTcpUserTimeout", ...
%    "Description", "clib.hiredis.redisSetTcpUserTimeout Representation of C++ function redisSetTcpUserTimeout."); % Modify help description values as needed.
%defineArgument(redisSetTcpUserTimeoutDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisSetTcpUserTimeoutDefinition, "timeout", "uint32");
%defineOutput(redisSetTcpUserTimeoutDefinition, "RetVal", "int32");
%validate(redisSetTcpUserTimeoutDefinition);

%% C++ function |redisFree| with MATLAB name |clib.hiredis.redisFree|
% C++ Signature: void redisFree(redisContext * c)

%redisFreeDefinition = addFunction(libDef, ...
%    "void redisFree(redisContext * c)", ...
%    "MATLABName", "clib.hiredis.redisFree", ...
%    "Description", "clib.hiredis.redisFree Representation of C++ function redisFree."); % Modify help description values as needed.
%defineArgument(redisFreeDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%validate(redisFreeDefinition);

%% C++ function |redisFreeKeepFd| with MATLAB name |clib.hiredis.redisFreeKeepFd|
% C++ Signature: redisFD redisFreeKeepFd(redisContext * c)

%redisFreeKeepFdDefinition = addFunction(libDef, ...
%    "redisFD redisFreeKeepFd(redisContext * c)", ...
%    "MATLABName", "clib.hiredis.redisFreeKeepFd", ...
%    "Description", "clib.hiredis.redisFreeKeepFd Representation of C++ function redisFreeKeepFd."); % Modify help description values as needed.
%defineArgument(redisFreeKeepFdDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineOutput(redisFreeKeepFdDefinition, "RetVal", "int32");
%validate(redisFreeKeepFdDefinition);

%% C++ function |redisBufferRead| with MATLAB name |clib.hiredis.redisBufferRead|
% C++ Signature: int redisBufferRead(redisContext * c)

%redisBufferReadDefinition = addFunction(libDef, ...
%    "int redisBufferRead(redisContext * c)", ...
%    "MATLABName", "clib.hiredis.redisBufferRead", ...
%    "Description", "clib.hiredis.redisBufferRead Representation of C++ function redisBufferRead."); % Modify help description values as needed.
%defineArgument(redisBufferReadDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineOutput(redisBufferReadDefinition, "RetVal", "int32");
%validate(redisBufferReadDefinition);

%% C++ function |redisBufferWrite| with MATLAB name |clib.hiredis.redisBufferWrite|
% C++ Signature: int redisBufferWrite(redisContext * c,int * done)

%redisBufferWriteDefinition = addFunction(libDef, ...
%    "int redisBufferWrite(redisContext * c,int * done)", ...
%    "MATLABName", "clib.hiredis.redisBufferWrite", ...
%    "Description", "clib.hiredis.redisBufferWrite Representation of C++ function redisBufferWrite."); % Modify help description values as needed.
%defineArgument(redisBufferWriteDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisBufferWriteDefinition, "done", "clib.array.hiredis.Int", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Int", or "int32"
%defineOutput(redisBufferWriteDefinition, "RetVal", "int32");
%validate(redisBufferWriteDefinition);

%% C++ function |redisGetReply| with MATLAB name |clib.hiredis.redisGetReply|
% C++ Signature: int redisGetReply(redisContext * c,void * * reply)

%redisGetReplyDefinition = addFunction(libDef, ...
%    "int redisGetReply(redisContext * c,void * * reply)", ...
%    "MATLABName", "clib.hiredis.redisGetReply", ...
%    "Description", "clib.hiredis.redisGetReply Representation of C++ function redisGetReply."); % Modify help description values as needed.
%defineArgument(redisGetReplyDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisGetReplyDefinition, "reply", <MLTYPE>, "output", 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%defineOutput(redisGetReplyDefinition, "RetVal", "int32");
%validate(redisGetReplyDefinition);

%% C++ function |redisGetReplyFromReader| with MATLAB name |clib.hiredis.redisGetReplyFromReader|
% C++ Signature: int redisGetReplyFromReader(redisContext * c,void * * reply)

%redisGetReplyFromReaderDefinition = addFunction(libDef, ...
%    "int redisGetReplyFromReader(redisContext * c,void * * reply)", ...
%    "MATLABName", "clib.hiredis.redisGetReplyFromReader", ...
%    "Description", "clib.hiredis.redisGetReplyFromReader Representation of C++ function redisGetReplyFromReader."); % Modify help description values as needed.
%defineArgument(redisGetReplyFromReaderDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisGetReplyFromReaderDefinition, "reply", <MLTYPE>, "output", 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%defineOutput(redisGetReplyFromReaderDefinition, "RetVal", "int32");
%validate(redisGetReplyFromReaderDefinition);

%% C++ function |redisAppendFormattedCommand| with MATLAB name |clib.hiredis.redisAppendFormattedCommand|
% C++ Signature: int redisAppendFormattedCommand(redisContext * c,char const * cmd,size_t len)

%redisAppendFormattedCommandDefinition = addFunction(libDef, ...
%    "int redisAppendFormattedCommand(redisContext * c,char const * cmd,size_t len)", ...
%    "MATLABName", "clib.hiredis.redisAppendFormattedCommand", ...
%    "Description", "clib.hiredis.redisAppendFormattedCommand Representation of C++ function redisAppendFormattedCommand."); % Modify help description values as needed.
%defineArgument(redisAppendFormattedCommandDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisAppendFormattedCommandDefinition, "cmd", <MLTYPE>, "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.Char","int8","string", or "char"
%defineArgument(redisAppendFormattedCommandDefinition, "len", "uint64");
%defineOutput(redisAppendFormattedCommandDefinition, "RetVal", "int32");
%validate(redisAppendFormattedCommandDefinition);

%% C++ function |redisAppendCommandArgv| with MATLAB name |clib.hiredis.redisAppendCommandArgv|
% C++ Signature: int redisAppendCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)

%redisAppendCommandArgvDefinition = addFunction(libDef, ...
%    "int redisAppendCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis.redisAppendCommandArgv", ...
%    "Description", "clib.hiredis.redisAppendCommandArgv Representation of C++ function redisAppendCommandArgv."); % Modify help description values as needed.
%defineArgument(redisAppendCommandArgvDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisAppendCommandArgvDefinition, "argc", "int32");
%defineArgument(redisAppendCommandArgvDefinition, "argv", "string", "input", <SHAPE>);
%defineArgument(redisAppendCommandArgvDefinition, "argvlen", "clib.array.hiredis.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.UnsignedLong", or "uint64"
%defineOutput(redisAppendCommandArgvDefinition, "RetVal", "int32");
%validate(redisAppendCommandArgvDefinition);

%% C++ function |redisCommandArgv| with MATLAB name |clib.hiredis.redisCommandArgv|
% C++ Signature: void * redisCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)

%redisCommandArgvDefinition = addFunction(libDef, ...
%    "void * redisCommandArgv(redisContext * c,int argc,char const * * argv,size_t const * argvlen)", ...
%    "MATLABName", "clib.hiredis.redisCommandArgv", ...
%    "Description", "clib.hiredis.redisCommandArgv Representation of C++ function redisCommandArgv."); % Modify help description values as needed.
%defineArgument(redisCommandArgvDefinition, "c", "clib.hiredis.redisContext", "input", <SHAPE>); % <MLTYPE> can be "clib.hiredis.redisContext", or "clib.array.hiredis.redisContext"
%defineArgument(redisCommandArgvDefinition, "argc", "int32");
%defineArgument(redisCommandArgvDefinition, "argv", "string", "input", <SHAPE>);
%defineArgument(redisCommandArgvDefinition, "argvlen", "clib.array.hiredis.UnsignedLong", "input", <SHAPE>); % <MLTYPE> can be "clib.array.hiredis.UnsignedLong", or "uint64"
%defineOutput(redisCommandArgvDefinition, "RetVal", <MLTYPE>, 1); % <MLTYPE> can be an existing typedef name for void* or a new typedef name to void*.
%validate(redisCommandArgvDefinition);

%% Validate the library definition
validate(libDef);

end
