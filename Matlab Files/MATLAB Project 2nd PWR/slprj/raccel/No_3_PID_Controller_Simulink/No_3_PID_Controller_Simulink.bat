@echo off
set MATLAB=C:\Program Files\MATLAB\R2013b
"%MATLAB%\bin\win64\gmake" -f No_3_PID_Controller_Simulink.mk  RSIM_SOLVER_SELECTION=2 OPTS="-DON_TARGET_WAIT_FOR_START=0"
