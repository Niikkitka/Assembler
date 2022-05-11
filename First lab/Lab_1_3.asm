;((X+Y)/Y^2 - 1)*X;

format PE console

entry start ;метка старта

include 'win32a.inc'

section '.code' code readable executable ;секция кода читабельно и исполняемо
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
  MOV ecx, [InputY]
  MOV eax, [InputX]
  ADD ecx, eax
  MOV [timeY], ecx
  MOV ecx, [InputY]
  IMUL ecx, ecx
  SUB ecx, 1
  MOV eax, [timeY]
  MOV edx, 0
  DIV ecx 
  IMUL eax, [InputX] 
  
  push eax
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
  timeY dd ?
  
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