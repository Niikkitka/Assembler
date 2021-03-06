format PE console

entry Start

include 'win32a.inc'

section '.data' data readable writable
  resStr db 'Result: %d', 0
  A dd ?
  B dd ?
  C dd ?
  
  NULL = 0
  
section '.code' code readable executable
  Start:
    mov [A], 12
    mov [B], 10
    
    mov ecx, [A]
    add ecx, [B]
    
    push ecx
    push resStr
    call [printf]
    
    call [getch]
    
    push NULL
    call [ExitProcess]
                                   
section '.import' data import readable
  library kernel, 'kernel32.dll',\
          msvcrt, 'msvcrt.dll'
          
  import kernel,\
          ExitProcess, 'ExitProcess'
  import msvcrt,\
          printf, 'printf',\
          scanf,'scanf',\
          getch, '_getch'