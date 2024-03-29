rem
rem to be compiled by TURBOBAT
rem
@echo off
if "%1"=="" goto ERRORA
if "%2"=="" if "%3"=="" goto PROCB
Capture L=%3 S=%1 Q=%2 TI=15 NA NFF NONOTI NAM=%USERID% NB
goto EXIT

:PROCB
if "%1"=="1" goto MENU
if "%1"=="2" goto MENU
if "%1"=="3" goto MENU
@echo Printer Port should be 1, 2 or 3
goto EXIT

:MENU
cls
@echo ... Loading ...
sq_486dp %1
if errorlevel 14 goto M
if errorlevel 13 goto L
if errorlevel 14 goto K
if errorlevel 12 goto L
if errorlevel 11 goto K
if errorlevel 10 goto J
if errorlevel 9  goto I
if errorlevel 8  goto H
if errorlevel 7  goto G
if errorlevel 6  goto F
if errorlevel 5  goto E
if errorlevel 4  goto D
if errorlevel 3  goto C
if errorlevel 2  goto B
if errorlevel 1  goto A
goto EXIT

:A
 ENDCAP L=%1
 goto EXIT
:B
 CAPTURE S=SRH486A L=%1 Q=IID_SEC TI=15 NA NFF NAM=%USERID% NB
 goto EXIT
:C
 CAPTURE S=SRH486DP L=%1 Q=DP_LQ1050 TI=10 NA NFF NAM=%USERID% NB NOTI
 goto EXIT
:D
 CAPTURE S=SRH486DP L=%1 Q=DP_ANGEL TI=10 NA NFF NAM=%USERID% NB NOTI
 goto EXIT
:E
 CAPTURE S=SRH486DP L=%1 Q=DP_DFX5000 TI=10 NA NFF NAM=%USERID% NB NOTI
 goto EXIT
:F
 CAPTURE S=SRH386A L=%1 Q=DP_IIISI TI=15 NA NFF NAM=%USERID% NB
 goto EXIT
:G
 CAPTURE S=SRH386A L=%1 Q=DP_II TI=15 NA NFF NAM=%USERID% NB
 goto EXIT
:H
 CAPTURE S=SRH486DP L=%1 Q=DP_P300 TI=15 NA FF NAM=%USERID% NB NOTI
 goto EXIT
:I
 CAPTURE S=SRH486A L=%1 Q=PLOT_SEC TI=10 NA NFF NAM=%USERID% NB NOTI
 goto EXIT
:J
 CAPTURE S=SRH486A L=%1 Q=PAINTJET_SEC TI=10 NA NFF NAM=%USERID% NB NOTI
 goto EXIT
:K
 CAPTURE S=SRH486A L=%1 Q=QT_III TI=15 NA NFF NAM=%USERID% NB
 goto EXIT
:L
 CAPTURE S=SRH486A L=%1 Q=III_FIN TI=10 NA NFF NAM=%USERID% NB
 goto EXIT
:M
 CAPTURE S=SRH486A L=%1 Q=1050_FIN TI=15 NA NFF NAM=%USERID% NB NOTI
 goto EXIT


:ERRORA
echo ------------------------------------------------------------------------------
Echo Usage:   SeleQ [Printer Port]
Echo where    [Printer Port] can be 1, 2, or 3
Echo ------------------------------------------------------------------------------
Echo Example: SeleQ 1
Echo ------------------------------------------------------------------------------
goto EXIT

:ERRORB
echo ------------------------------------------------------------------------------
Echo Usage:   SeleQ [FileServer] [Queue] [Port]
Echo          [FileServer]  can be SRH386A, SRH486A, SRH486DP
Echo          [Queue]       can be III_RA, III_FIN, IID_SEC
Echo                               DP_II, DP_IIISI
Echo                               1050_FIN, DP_LQ1050, DP_DFX5000, DP_ANGEL
Echo          [Port]        can be 1, 2, or 3
Echo ------------------------------------------------------------------------------
Echo Example: SeleQ SRH386A DP_IIISI 1
Echo ------------------------------------------------------------------------------
 
:EXIT
