@echo off
cls
@echo Checking for new mail ...
newmail
if errorlevel 1 goto gotsomemail
@echo �
@echo � YOU HAVE NO NEW MAIL �
:gotsomemail
waitn 1
@echo �
@echo Loading Pegasus Mail ...
map ins s1:=SYS:LIB\PMAIL > nul
PMAIL
map del s1: > nul
