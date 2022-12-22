#include "__cf_No_3_PID_Controller_Simulink.h"
#ifndef RTW_HEADER_No_3_PID_Controller_Simulink_h_
#define RTW_HEADER_No_3_PID_Controller_Simulink_h_
#ifndef No_3_PID_Controller_Simulink_COMMON_INCLUDES_
#define No_3_PID_Controller_Simulink_COMMON_INCLUDES_
#include <stdlib.h>
#include <stddef.h>
#include <string.h>
#include "rtwtypes.h"
#include "builtin_typeid_types.h"
#include "multiword_types.h"
#include "simstruc.h"
#include "fixedpoint.h"
#include "raccel.h"
#include "rt_logging.h"
#include "dt_info.h"
#include "ext_work.h"
#include "rt_defines.h"
#include "rt_nonfinite.h"
#endif
#include "No_3_PID_Controller_Simulink_types.h"
#define MODEL_NAME No_3_PID_Controller_Simulink
#define NSAMPLE_TIMES (2) 
#define NINPUTS (0)       
#define NOUTPUTS (0)     
#define NBLOCKIO (6) 
#define NUM_ZC_EVENTS (0) 
#ifndef NCSTATES
#define NCSTATES (4)   
#elif NCSTATES != 4
#error Invalid specification of NCSTATES defined in compiler command
#endif
#ifndef rtmGetDataMapInfo
#define rtmGetDataMapInfo(rtm) (NULL)
#endif
#ifndef rtmSetDataMapInfo
#define rtmSetDataMapInfo(rtm, val)
#endif
typedef struct { real_T l4fd5jvliy ; real_T kzi4flpno2 ; real_T c5ejn52nlj [
2 ] ; real_T lzm0gdhhhv ; real_T pvjrtbrsoo ; real_T gg5rlstfpw ; } B ;
typedef struct { struct { real_T TimeStampA ; real_T LastUAtTimeA ; real_T
TimeStampB ; real_T LastUAtTimeB ; } blbaqwjlau ; struct { void * LoggedData
; } o3ihju4nnz ; struct { void * LoggedData ; } kf2nhorbhr ; struct { void *
LoggedData ; } lntunqnklp ; } DW ; typedef struct { real_T fgr0rckn12 [ 3 ] ;
real_T km4xe20dkl ; } X ; typedef struct { real_T fgr0rckn12 [ 3 ] ; real_T
km4xe20dkl ; } XDot ; typedef struct { boolean_T fgr0rckn12 [ 3 ] ; boolean_T
km4xe20dkl ; } XDis ; struct P_ { real_T Step_Time ; real_T Step_Y0 ; real_T
Step_YFinal ; real_T Transfer_Fcn_A [ 3 ] ; real_T Transfer_Fcn_C [ 3 ] ;
real_T Derivative_Gain_Gain ; real_T Integral_Gain_Gain ; real_T
Integrator_IC ; real_T Proportional_Gain_Gain ; } ; extern P rtP ; extern
const char * RT_MEMORY_ALLOCATION_ERROR ; extern B rtB ; extern X rtX ;
extern DW rtDW ; extern SimStruct * const rtS ; extern const int_T
gblNumToFiles ; extern const int_T gblNumFrFiles ; extern const int_T
gblNumFrWksBlocks ; extern rtInportTUtable * gblInportTUtables ; extern const
char * gblInportFileName ; extern const int_T gblNumRootInportBlks ; extern
const int_T gblNumModelInputs ; extern const int_T gblInportDataTypeIdx [ ] ;
extern const int_T gblInportDims [ ] ; extern const int_T gblInportComplex [
] ; extern const int_T gblInportInterpoFlag [ ] ; extern const int_T
gblInportContinuous [ ] ;
#endif
