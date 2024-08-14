#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

void reportInfo(enum MessageType mType, MessageValue mValue, char dataType) {
    char msgBuffer[120];
    const char *fmt = NULL;

    switch (mType) {
        case BEINDEX:
            fmt = "Bus Element Index: %d\n";
            break;
        case BEDTYPE:
            fmt = "Bus Element Data Type: %d\n";
            break;
        case BEDIM:
            fmt = "Bus Number of Dimensions: %d\n";
            break;
        case BEWIDTH:
            fmt = "Bus Element Width: %d\n";
            break;
        default:
            printf("Unknown MessageType!\n");
            return;
    }

    // Handle different data types
    switch (dataType) {
        case 'i': // Integer
            snprintf(msgBuffer, sizeof(msgBuffer), fmt, mValue.iValue);
            break;
        case 'f': // Float
            snprintf(msgBuffer, sizeof(msgBuffer), fmt, mValue.fValue);
            break;
        case 'd': // Double
            snprintf(msgBuffer, sizeof(msgBuffer), fmt, mValue.dValue);
            break;
        default:
            printf("Unsupported data type!\n");
            return;
    }

    // Display the message
    printf("%s", msgBuffer);
}

int main() {
    MessageValue val;
    val.iValue = 5;
    reportInfo(BEINDEX, val, 'i');

    val.fValue = 3.14;
    reportInfo(BEWIDTH, val, 'f');

    return 0;
}
