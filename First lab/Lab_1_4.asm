; №15(X-Y)/(XY+1)

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
  MOV edx, 0
  SUB eax, ecx
  MOV [timeVar], eax
  MOV eax, [InputX]
  IMUL eax, [InputY]
  ADD eax, 1
  MOV ecx, eax ; 13
  MOV eax, [timeVar] ; -1
  IDIV ecx
  
  push eax ;330382099 ???
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
  timeVar dd ?
  
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