#ifndef SFTimeSignalDemo_cap_host_h__
#define SFTimeSignalDemo_cap_host_h__
#ifdef HOST_CAPI_BUILD
#include "rtw_capi.h"
#include "rtw_modelmap.h"

typedef struct {
  rtwCAPI_ModelMappingInfo mmi;
} SFTimeSignalDemo_host_DataMapInfo_T;

#ifdef __cplusplus

extern "C"
{

#endif

  void SFTimeSignalDemo_host_InitializeDataMapInfo
    (SFTimeSignalDemo_host_DataMapInfo_T *dataMap, const char *path);

#ifdef __cplusplus

}

#endif
#endif                                 /* HOST_CAPI_BUILD */
#endif                                 /* SFTimeSignalDemo_cap_host_h__ */

/* EOF: SFTimeSignalDemo_capi_host.h */
