; №12 (-x)^3 + 3

format PE console

entry start ;метка старта

include 'win32a.inc'

section '.code' code readable executable
start:
  push StrX ;Вывод строки 
  call [printf]
  
  
  push InputX
  push formatNum
  call [scanf]
  
  ;push StrY
  ;call [printf]
  
  ;push InputY
  ;call [scanf]
  
  MOV ecx, [InputX]
  NEG ecx
  IMUL ecx, [InputX]
  IMUL ecx, [InputX]
  ADD ecx, 3
  push InputZ
  MOV [InputZ], ecx
  
  push ecx
  push Result
  call [printf]
  
  call [getch]
  
  push NULL
  call [ExitProcess]

section '.data' data readable writable
  formatNum db '%d', 0
  
  StrX db 'X = ', 0
  ;StrY db 'Y = ', 0
  Result db 'Z = %d', 0
  
  InputZ dd ?
  InputX dd ?
  ;InputY dd ?
  
  NULL = 0

section '.import' data import readable
  library kernel, 'kernel32.dll',\
          msvcrt, 'msvcrt.dll'
          
  import kernel,\
          ExitProcess, 'ExitProcess'
  import msvcrt,\
          printf, 'printf',\
          getch, '_getch',\
          scanf,'scanf'
