DATA SEGMENT
            MSG1 DB 'ENTER THE FIRST NUMBER: $'
            MSG2 DB 0AH,0DH,'ENTER THE SECOND NUMBER: $'
            MSG3 DB 0AH,0DH,'THE SUM IS= $'
            NUM1 DB ?
            NUM2 DB ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:     MOV AX,DATA
           MOV DS,AX
          
           LEA DX,MSG1           ;PRINT MSG1
           MOV AH,09H
           INT 21H
           
           MOV AH,01H
           INT 21H               ;READ THE FIRST NUMBER
           SUB AL,30H            ;CONVERT THE ASCII VALUE TO BINARY
           MOV NUM1,AL           ;STORE THE FIRST NUMBER IN NUM1
           
           LEA DX,MSG1           ;PRINT MSG2
           MOV AH,09H
           INT 21H
           
           MOV AH,01H
           INT 21H               ;READ THE FIRST NUMBER
           SUB AL,30H            ;CONVERT THE ASCII VALUE TO BINARY
           MOV NUM2,AL           ;STORE THE FIRST NUMBER IN NUM2
           
           LEA DX,MSG1           ;PRINT MSG3
           MOV AH,09H
           INT 21H
           
           MOV AL,NUM1           ;MOVE THE FIRST NUMBER TO AL
           MOV BL,NUM2           ;MOVE THE SECOND NUMBER TO BL
           ADD AL,BL             ;Add the numbers and store result in AL
           
           ADD AL,30H            ;CONVERT BINARY VALUE TO ASCII FOR DISLAY
           MOV DL,AL
           MOV AH,02H
           INT 21H               ;DISPLAY THE SUM NUM1+NUM2
           
           MOV AH,4CH
           INT 21H
           
CODE ENDS
END START
