#ifndef _SFME_H_
#define _SFME_H_

// See note about registering below.
enum MessageType {
    BEINDEX,
    BEDTYPE,
    BEDIM,
    BEWIDTH,
};

typedef union {
    int iValue;
    float fValue;
    double dValue;
} MessageValue;

void reportInfo(enum MessageType mType, MessageValue mValue, char dataType);


/* Registering Simulink Types
	static void mdlInitializeSizes(SimStruct *S)
	{

	    \\ Compile-time handling
	    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
	        int id;

	        \\ Register bus object data type (passed in as the
	        \\ first parameter in the block dialog

	        ssRegisterTypeFromParameter(S, 0, &id);

	        \\ Set the bus data type identifier for the input
	        \\ and output port data type of the block.

	        ssSetInputPortDataType(S, 0, id);
	        ssSetOutputPortDataType(S, 0, id);
	    }
	 }*/

#endif // _SFME_H_
