/* Last Copy of the sfRedis_wrapper before code reuse was disabled
in the Sfunction Builder.
The intent was to try a variety of things to resolve build issues.
Preventing Model interrogation.

Monday Aug 12, 2024. W DeShazer
*/


/*
 * Include Files
 *
 */
#include "simstruc.h"



/* %%%-SFUNWIZ_wrapper_includes_Changes_BEGIN --- EDIT HERE TO _END */
#include <math.h>
#include "mex.h"
#include "hiredis.h"
/* %%%-SFUNWIZ_wrapper_includes_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Create external references here.
 *
 */
/* %%%-SFUNWIZ_wrapper_externs_Changes_BEGIN --- EDIT HERE TO _END */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum MsgNumType {
    BEINDEX,
    BEDTYPE,
    BEDTSIZE,
    BEDIM,
    BESPAN,
    BEWIDTH,
};

enum MsgCharType {
    BENAME
};


extern char* reportInfoNum(int mType, double iVal) {

    enum MsgNumType {
        BEINDEX,
        BEDTYPE,
        BEDTSIZE,
        BEDIM,
        BESPAN,
        BEWIDTH
    };

    int bs = 120;
    char *msgBuffer = (char *)malloc(bs * sizeof(char));
    if (msgBuffer == NULL) {
        return NULL; // Handle allocation failure
    }
    const char *fmt = NULL;

    switch (mType) {
        case BEINDEX:
            fmt = "Bus Element Index: %d\n";
            break;
        case BEDTYPE:
            fmt = "Bus Element Data Type: %d\n";
            break;
        case BEDTSIZE:
            fmt = "Bus Element Size: %d\n";
            break;
        case BEDIM:
            fmt = "Bus Number of Dimensions: %d\n";
            break;
        case BESPAN:
            fmt = "  Dim Span is %d\n";
            break;
        case BEWIDTH:
            fmt = "Bus Element Width: %d\n";
            break;
        default:
            ssPrintf("Unknown MessageType!\n");
    }

    snprintf(msgBuffer, bs, fmt, (int)iVal);
    return msgBuffer;

}

extern char* reportInfoChar(int mType, const char* sVal) {
    enum MsgCharType {
        BENAME
    };

    int bs = 120;
    char *msgBuffer = (char *)malloc(120 * sizeof(char));
    if (msgBuffer == NULL) {
        return NULL; // Handle allocation failure
    }
    const char *fmt = NULL;

    switch (mType) {
        case BENAME:
            fmt = "BusElement Name: %c\n";
            break;
        default:
            fmt = "Unknown MessageType!\n %s\n";
    }

    snprintf(msgBuffer, bs, fmt, (char* )sVal);
    return msgBuffer;
}
/* %%%-SFUNWIZ_wrapper_externs_Changes_END --- EDIT HERE TO _BEGIN */

/*
 * Start function
 *
 */
void sfRedis_Start_wrapper(void **pW,
			const uint16_T *host, const int_T p_width0,
			const int16_T *port, const int_T p_width1,
			const uint16_T *passwd, const int_T p_width2,
			SimStruct *S)
{

/* %%%-SFUNWIZ_wrapper_Start_Changes_END --- EDIT HERE TO _BEGIN */
}
/*
 * Output function
 *
 */
void sfRedis_Outputs_wrapper(const real_T *u0,
			real_T *y0,
			void **pW,
			const uint16_T *host, const int_T p_width0,
			const int16_T *port, const int_T p_width1,
			const uint16_T *passwd, const int_T p_width2,
			const int_T y_width,
			const int_T u_width,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_BEGIN --- EDIT HERE TO _END */

/* %%%-SFUNWIZ_wrapper_Start_Changes_BEGIN --- EDIT HERE TO _END */
enum MsgNumType {
    BEINDEX,
    BEDTYPE,
    BEDTSIZE,
    BEDIM,
    BESPAN,
    BEWIDTH,
};

enum MsgCharType {
    BENAME
};

DTypeId    dType    = ssGetOutputPortDataType(S, 0);
const void *u       = ssGetInputPortSignal(S, 0);
int        numElems = ssGetNumBusElements(S, dType);
int        i;

int_T size = ssGetDataTypeSize(S, SS_INT16);

for(i=0; i < numElems; i++) {
    char *msg;

    const char *elemName = ssGetBusElementName(S, dType, i);
    msg = reportInfoChar(BENAME, elemName);
    ssPrintf(msg);
    free(msg);

    int_T elemType = ssGetBusElementDataType(S, dType, i);
    msg = reportInfoNum(BEDTYPE, elemType);
    ssPrintf(msg);
    free(msg);



    // Custom BusElements may have custom DataTypes
    int_T size = ssGetDataTypeSize(S, elemType);
    msg = reportInfoNum(BEDTSIZE, size);
    ssPrintf(msg);
    free(msg);

    // Cofirm it is registered. Makes our S-func more flexible
    // Annoying if you don't know how to register a type.
    if(size == INVALID_DTYPE_SIZE) return;

    int_T       numDims   = ssGetBusElementNumDimensions(S, dType, i);
    const int_T *dims     = ssGetBusElementDimensions(S, dType, i);
    int         width     = 1;
    int         span;
    int         j;

    msg = reportInfoNum(BEDIM, numDims);
    free(msg);

    /* Compute width of the bus element */
    for(j=0; j<numDims; j++) {
        span = dims[j];
        width *= span;

        msg = reportInfoNum(BESPAN, span);
        ssPrintf(msg);
        free(msg);
    }

    msg = reportInfoNum(BEWIDTH, width);
    free(msg);
}
/* %%%-SFUNWIZ_wrapper_Outputs_Changes_END --- EDIT HERE TO _BEGIN */
}

/*
 * Terminate function
 *
 */
void sfRedis_Terminate_wrapper(void **pW,
			const uint16_T *host, const int_T p_width0,
			const int16_T *port, const int_T p_width1,
			const uint16_T *passwd, const int_T p_width2,
			SimStruct *S)
{
/* %%%-SFUNWIZ_wrapper_Terminate_Changes_BEGIN --- EDIT HERE TO _END */
/* %%%-SFUNWIZ_wrapper_Terminate_Changes_END --- EDIT HERE TO _BEGIN */
}

