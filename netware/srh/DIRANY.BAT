@Echo Off
rem
rem Described by PC Magazine
rem
If '%2' == '' GoTo Syntax
For %%v In (1 2 3 4 5 6 7 8) Do If %2==%%v GoTo Ok
GoTo Sntax
:Ok
Set Temp=%1*.*
Rem If name has 8 letters, we're done
If %2==8 GoTo DoIt
Set Temp=%Temp% ?%1*.*
If %2==7 GoTo DoIt
Set Temp=%Temp% ??%1*.*
If %2==6 GoTo DoIt
Set Temp=%Temp% ???%1*.*
If %2==5 GoTo DoIt
Set Temp=%Temp% ????%1*.*
If %2==4 GoTo DoIt
Set Temp=%Temp% ?????%1*.* *.%1*
If %2==3 GoTo DoIt
Set Temp=%Temp% ??????%1*.* *.?%1*
If %2==2 GoTo DoIt
Set Temp=%Temp% ???????%1*.* *.??%1
:DoIt
For %%f In (%Temp%) Do Echo %%f
Set Temp=
GoTo End
:Syntax
Echo 旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴커
Echo 쿏irAny lists files whose names contain a certain string.    �
Echo �        Syntax: "DirAny string n"                           �
Echo �        where "string" is a string of 1 to 8 characters     �
Echo �        (no wildcards) and "n" is the length of that string.�
Echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
Echo 쿐xample on how to use this Batch File                       �
Echo 쳐컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴캑
Echo �[ C:\ ] dirany srh 3                                        �
Echo 쿞RH_FILES.DAT                                               �
Echo 쿏P_SRH.PRG                                                  �
Echo 쿞EC_SRH.MNU                                                 �
Echo �[ C:\ ]                                                     �
Echo 읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴켸
:End
