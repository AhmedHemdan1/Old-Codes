#include "__cf_No_3_PID_Controller_Simulink.h"
#include <math.h>
#include "No_3_PID_Controller_Simulink.h"
#include "No_3_PID_Controller_Simulink_private.h"
#include "No_3_PID_Controller_Simulink_dt.h"
const int_T gblNumToFiles = 0 ; const int_T gblNumFrFiles = 0 ; const int_T
gblNumFrWksBlocks = 0 ;
#ifdef RSIM_WITH_SOLVER_MULTITASKING
const boolean_T gbl_raccel_isMultitasking = 1 ;
#else
const boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
const boolean_T gbl_raccel_tid01eq = 1 ; const int_T gbl_raccel_NumST = 2 ;
const char_T * gbl_raccel_Version = "8.5 (R2013b) 08-Aug-2013" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#endif
} const char * gblSlvrJacPatternFileName =
 "slprj\\raccel\\No_3_PID_Controller_Simulink\\No_3_PID_Controller_Simulink_Jpattern.mat"
; const int_T gblNumRootInportBlks = 0 ; const int_T gblNumModelInputs = 0 ;
extern rtInportTUtable * gblInportTUtables ; extern const char *
gblInportFileName ; const int_T gblInportDataTypeIdx [ ] = { - 1 } ; const
int_T gblInportDims [ ] = { - 1 } ; const int_T gblInportComplex [ ] = { - 1
} ; const int_T gblInportInterpoFlag [ ] = { - 1 } ; const int_T
gblInportContinuous [ ] = { - 1 } ;
#include "simstruc.h"
#include "fixedpoint.h"
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; void MdlInitialize ( void ) { rtX . fgr0rckn12 [ 0 ] = 0.0 ; rtX
. fgr0rckn12 [ 1 ] = 0.0 ; rtX . fgr0rckn12 [ 2 ] = 0.0 ; rtDW . blbaqwjlau .
TimeStampA = rtInf ; rtDW . blbaqwjlau . TimeStampB = rtInf ; rtX .
km4xe20dkl = rtP . Integrator_IC ; } void MdlStart ( void ) { { int_T
dimensions [ 1 ] = { 2 } ; rtDW . lntunqnklp . LoggedData = rt_CreateLogVar (
ssGetRTWLogInfo ( rtS ) , ssGetTStart ( rtS ) , ssGetTFinal ( rtS ) , 0.0 , (
& ssGetErrorStatus ( rtS ) ) , "Data" , SS_DOUBLE , 0 , 0 , 0 , 2 , 1 ,
dimensions , NO_LOGVALDIMS , ( NULL ) , ( NULL ) , 0 , 1 , 0.001 , 1 ) ; if (
rtDW . lntunqnklp . LoggedData == ( NULL ) ) return ; } MdlInitialize ( ) ; }
void MdlOutputs ( int_T tid ) { real_T lpiravlptm ; real_T hrvbwxeayh ; if (
ssGetTaskTime ( rtS , 0 ) < rtP . Step_Time ) { rtB . l4fd5jvliy = rtP .
Step_Y0 ; } else { rtB . l4fd5jvliy = rtP . Step_YFinal ; } if (
ssIsSampleHit ( rtS , 1 , 0 ) ) { } rtB . kzi4flpno2 = 0.0 ; rtB . kzi4flpno2
+= rtP . Transfer_Fcn_C [ 0 ] * rtX . fgr0rckn12 [ 0 ] ; rtB . kzi4flpno2 +=
rtP . Transfer_Fcn_C [ 1 ] * rtX . fgr0rckn12 [ 1 ] ; rtB . kzi4flpno2 += rtP
. Transfer_Fcn_C [ 2 ] * rtX . fgr0rckn12 [ 2 ] ; if ( ssIsSampleHit ( rtS ,
1 , 0 ) ) { rtB . c5ejn52nlj [ 0 ] = rtB . l4fd5jvliy ; rtB . c5ejn52nlj [ 1
] = rtB . kzi4flpno2 ; if ( ssGetLogOutput ( rtS ) ) { rt_UpdateLogVar ( (
LogVar * ) ( LogVar * ) ( rtDW . lntunqnklp . LoggedData ) , & rtB .
c5ejn52nlj [ 0 ] , 0 ) ; } } hrvbwxeayh = rtB . l4fd5jvliy - rtB . kzi4flpno2
; rtB . lzm0gdhhhv = rtP . Derivative_Gain_Gain * hrvbwxeayh ; { real_T t =
ssGetTaskTime ( rtS , 0 ) ; real_T timeStampA = rtDW . blbaqwjlau .
TimeStampA ; real_T timeStampB = rtDW . blbaqwjlau . TimeStampB ; real_T *
lastU = & rtDW . blbaqwjlau . LastUAtTimeA ; if ( timeStampA >= t &&
timeStampB >= t ) { lpiravlptm = 0.0 ; } else { real_T deltaT ; real_T
lastTime = timeStampA ; if ( timeStampA < timeStampB ) { if ( timeStampB < t
) { lastTime = timeStampB ; lastU = & rtDW . blbaqwjlau . LastUAtTimeB ; } }
else if ( timeStampA >= t ) { lastTime = timeStampB ; lastU = & rtDW .
blbaqwjlau . LastUAtTimeB ; } deltaT = t - lastTime ; lpiravlptm = ( rtB .
lzm0gdhhhv - * lastU ++ ) / deltaT ; } } rtB . pvjrtbrsoo = rtP .
Integral_Gain_Gain * hrvbwxeayh ; rtB . gg5rlstfpw = ( rtP .
Proportional_Gain_Gain * hrvbwxeayh + rtX . km4xe20dkl ) + lpiravlptm ;
UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) { { real_T
timeStampA = rtDW . blbaqwjlau . TimeStampA ; real_T timeStampB = rtDW .
blbaqwjlau . TimeStampB ; real_T * lastTime = & rtDW . blbaqwjlau .
TimeStampA ; real_T * lastU = & rtDW . blbaqwjlau . LastUAtTimeA ; if (
timeStampA != rtInf ) { if ( timeStampB == rtInf ) { lastTime = & rtDW .
blbaqwjlau . TimeStampB ; lastU = & rtDW . blbaqwjlau . LastUAtTimeB ; } else
if ( timeStampA >= timeStampB ) { lastTime = & rtDW . blbaqwjlau . TimeStampB
; lastU = & rtDW . blbaqwjlau . LastUAtTimeB ; } } * lastTime = ssGetTaskTime
( rtS , 0 ) ; * lastU ++ = rtB . lzm0gdhhhv ; } UNUSED_PARAMETER ( tid ) ; }
void MdlDerivatives ( void ) { XDot * _rtXdot ; _rtXdot = ( ( XDot * )
ssGetdX ( rtS ) ) ; _rtXdot -> fgr0rckn12 [ 0 ] = 0.0 ; _rtXdot -> fgr0rckn12
[ 1 ] = 0.0 ; _rtXdot -> fgr0rckn12 [ 2 ] = 0.0 ; _rtXdot -> fgr0rckn12 [ 0U
] += rtP . Transfer_Fcn_A [ 0 ] * rtX . fgr0rckn12 [ 0 ] ; _rtXdot ->
fgr0rckn12 [ 0U ] += rtP . Transfer_Fcn_A [ 1 ] * rtX . fgr0rckn12 [ 1 ] ;
_rtXdot -> fgr0rckn12 [ 0U ] += rtP . Transfer_Fcn_A [ 2 ] * rtX . fgr0rckn12
[ 2 ] ; _rtXdot -> fgr0rckn12 [ 1 ] += rtX . fgr0rckn12 [ 0 ] ; _rtXdot ->
fgr0rckn12 [ 2 ] += rtX . fgr0rckn12 [ 1 ] ; _rtXdot -> fgr0rckn12 [ 0U ] +=
rtB . gg5rlstfpw ; _rtXdot -> km4xe20dkl = rtB . pvjrtbrsoo ; } void
MdlProjection ( void ) { } void MdlTerminate ( void ) { } void
MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS , 4 ) ; ssSetNumY (
rtS , 0 ) ; ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ;
ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 13 ) ;
ssSetNumBlockIO ( rtS , 6 ) ; ssSetNumBlockParams ( rtS , 13 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.001 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 0.0 ) ; } void raccel_set_checksum ( SimStruct *
rtS ) { ssSetChecksumVal ( rtS , 0 , 65986938U ) ; ssSetChecksumVal ( rtS , 1
, 972753452U ) ; ssSetChecksumVal ( rtS , 2 , 1059134802U ) ;
ssSetChecksumVal ( rtS , 3 , 3280602422U ) ; } SimStruct *
raccel_register_model ( void ) { static struct _ssMdlInfo mdlInfo ; ( void )
memset ( ( char * ) rtS , 0 , sizeof ( SimStruct ) ) ; ( void ) memset ( (
char * ) & mdlInfo , 0 , sizeof ( struct _ssMdlInfo ) ) ; ssSetMdlInfoPtr (
rtS , & mdlInfo ) ; { static time_T mdlPeriod [ NSAMPLE_TIMES ] ; static
time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T mdlTaskTimes [
NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ; static int_T
mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T mdlTNextWasAdjustedPtr [
NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits [ NSAMPLE_TIMES *
NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [ NSAMPLE_TIMES ] ; {
int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) { mdlPeriod [ i ] = 0.0 ;
mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ; mdlTsMap [ i ] = i ;
mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS , & mdlPeriod [ 0 ] )
; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ; ssSetSampleTimeTaskIDPtr (
rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , & mdlTaskTimes [ 0 ] ) ;
ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ; ssSetTNextWasAdjustedPtr
( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ; ssSetPerTaskSampleHitsPtr ( rtS ,
& mdlPerTaskSampleHits [ 0 ] ) ; ssSetTimeOfNextSampleHitPtr ( rtS , &
mdlTimeOfNextSampleHit [ 0 ] ) ; } ssSetSolverMode ( rtS ,
SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS , ( ( void * ) & rtB ) ) ;
( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof ( B ) ) ; }
ssSetDefaultParam ( rtS , ( real_T * ) & rtP ) ; { real_T * x = ( real_T * )
& rtX ; ssSetContStates ( rtS , x ) ; ( void ) memset ( ( void * ) x , 0 ,
sizeof ( X ) ) ; } { void * dwork = ( void * ) & rtDW ; ssSetRootDWork ( rtS
, dwork ) ; ( void ) memset ( dwork , 0 , sizeof ( DW ) ) ; } { static
DataTypeTransInfo dtInfo ; ( void ) memset ( ( char_T * ) & dtInfo , 0 ,
sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS , & dtInfo ) ; dtInfo .
numDataTypes = 14 ; dtInfo . dataTypeSizes = & rtDataTypeSizes [ 0 ] ; dtInfo
. dataTypeNames = & rtDataTypeNames [ 0 ] ; dtInfo . B = & rtBTransTable ;
dtInfo . P = & rtPTransTable ; } ssSetRootSS ( rtS , rtS ) ; ssSetVersion (
rtS , SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS ,
"No_3_PID_Controller_Simulink" ) ; ssSetPath ( rtS ,
"No_3_PID_Controller_Simulink" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal (
rtS , 30.0 ) ; ssSetStepSize ( rtS , 0.001 ) ; ssSetFixedStepSize ( rtS ,
0.001 ) ; { static RTWLogInfo rt_DataLoggingInfo ; ssSetRTWLogInfo ( rtS , &
rt_DataLoggingInfo ) ; } { { static int_T rt_LoggedStateWidths [ ] = { 3 , 1
} ; static int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 } ; static int_T
rt_LoggedStateDimensions [ ] = { 3 , 1 } ; static boolean_T
rt_LoggedStateIsVarDims [ ] = { 0 , 0 } ; static BuiltInDTypeId
rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE , SS_DOUBLE } ; static int_T
rt_LoggedStateComplexSignals [ ] = { 0 , 0 } ; static const char_T *
rt_LoggedStateLabels [ ] = { "CSTATE" , "CSTATE" } ; static const char_T *
rt_LoggedStateBlockNames [ ] = { "No_3_PID_Controller_Simulink/Transfer_Fcn"
, "No_3_PID_Controller_Simulink/Integrator" } ; static const char_T *
rt_LoggedStateNames [ ] = { "" , "" } ; static boolean_T
rt_LoggedStateCrossMdlRef [ ] = { 0 , 0 } ; static RTWLogDataTypeConvert
rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 ,
1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } }
; static RTWLogSignalInfo rt_LoggedStateSignalInfo = { 2 ,
rt_LoggedStateWidths , rt_LoggedStateNumDimensions , rt_LoggedStateDimensions
, rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , { rt_LoggedStateLabels } , ( NULL )
, ( NULL ) , ( NULL ) , { rt_LoggedStateBlockNames } , { rt_LoggedStateNames
} , rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert } ; static void *
rt_LoggedStateSignalPtrs [ 2 ] ; rtliSetLogXSignalPtrs ( ssGetRTWLogInfo (
rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . fgr0rckn12 [ 0 ] ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtX . km4xe20dkl ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "tmp_raccel_xout" ) ; rtliSetLogXFinal (
ssGetRTWLogInfo ( rtS ) , "xFinal" ) ; rtliSetSigLog ( ssGetRTWLogInfo ( rtS
) , "" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 1000 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo (
rtS ) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 4
] ; ssSetSolverInfo ( rtS , & slvrInfo ) ; ssSetSolverName ( rtS , "ode4" ) ;
ssSetVariableStepSolver ( rtS , 0 ) ; ssSetSolverConsistencyChecking ( rtS ,
0 ) ; ssSetSolverAdaptiveZcDetection ( rtS , 0 ) ;
ssSetSolverRobustResetMethod ( rtS , 0 ) ; ssSetSolverStateProjection ( rtS ,
0 ) ; ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelLogData ( rtS , rt_UpdateTXYLogVars ) ; ssSetModelUpdate ( rtS
, MdlUpdate ) ; ssSetModelDerivatives ( rtS , MdlDerivatives ) ;
ssSetTNextTid ( rtS , INT_MIN ) ; ssSetTNext ( rtS , rtMinusInf ) ;
ssSetSolverNeedsReset ( rtS ) ; ssSetNumNonsampledZCs ( rtS , 0 ) ;
ssSetContStateDisabled ( rtS , contStatesDisabled ) ; } ssSetChecksumVal (
rtS , 0 , 65986938U ) ; ssSetChecksumVal ( rtS , 1 , 972753452U ) ;
ssSetChecksumVal ( rtS , 2 , 1059134802U ) ; ssSetChecksumVal ( rtS , 3 ,
3280602422U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 1 ] ; ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo
) ; rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; } return
rtS ; }
