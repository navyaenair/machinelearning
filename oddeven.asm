DATA SEGMENT
            MSG1 DB 'ENTER THE NUMBER: $'
            MSG2 DB 0AH,0DH,'THE NUMBER IS ODD $'
            MSG3 DB 0AH,0DH,' THE NUMBER IS EVEN$'
            NUM DB ?
            
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START :  MOV AX,DATA
         MOV DS,AX
         
          
           LEA DX,MSG1           ;PRINT MSG1
           MOV AH,09H
           INT 21H
           
           MOV AH,01H
           INT 21H               ;READ THE FIRST NUMBER
           SUB AL,30H            ;CONVERT THE ASCII VALUE TO BINARY
           MOV NUM,AL
         
           MOV AL,NUM
           MOV AH,00H
           SHR AX,1
           
           JC ODD
           
           LEA DX,MSG3
           MOV AH,09H
           INT 21H
           JMP STOP
           
 ODD:      LEA DX,MSG2
           MOV AH,09H
           INT 21H      
           
STOP  :    MOV AH,4CH
            INT 21H
   
   CODE ENDS
   END START                   
         
