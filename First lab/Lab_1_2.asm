;№13 X - Y/X +1;

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
  
  push StrY
  call [printf]
  
  push InputY
  push formatNum
  call [scanf]
  ;№13 X - Y/X +1;
  MOV eax, [InputY]
  MOV ecx, [InputX]
  MOV edx, 0
  IDIV ecx
  MOV ebx, [InputX]
  SUB ebx, eax
  ADD ebx, 1
  
  push ebx
  push Result
  call [printf]
  
  call [getch]
  
  push NULL
  call [ExitProcess]

section '.data' data readable writable
  formatNum db '%d', 0
  
  StrX db 'X = ', 0
  StrY db 'Y = ', 0
  Result db 'Z = %d', 0
  
  InputZ dd ?
  InputX dd ?
  InputY dd ?
  
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
