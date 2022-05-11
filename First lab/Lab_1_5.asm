;- X/Y+Y^2 +3
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
  
  MOV eax, [InputX]
  MOV ecx, [InputY]
  MOV edx, 0
  NEG eax
  IDIV ecx
  MOV [timeVar], eax
  MOV eax, [InputY]
  IMUL eax, eax
  ADD eax, [timeVar]
  ADD eax, 3
  
  push eax ;1073741842 ???
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