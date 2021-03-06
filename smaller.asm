READNUM   MACRO NUM
          MOV AH,01H
          INT 21H
          SUB AL,30H
          MOV NUM,AL
          ENDM
          
PRINTMSG  MACRO MSG
          LEA DX,MSG
          MOV AH,09H
          INT 21H
          ENDM
          
 DATA SEGMENT
          MSG1 DB 'ENTER THE FIRST NUMBER: $'
          MSG2 DB 0AH,0DH,'ENTER THE SECOND NUMBER: $'
          MSG3 DB 0AH,0DH,'ENTER THE THIRD NUMBER: $'
          MSG4 DB 0AH,0DH,'SMALLEST  NUMBER: $'
           NUM1 DB ?
           NUM2 DB ?
           NUM3 DB ?
           SMALLEST DB ?
 DATA ENDS                   
    
 CODE SEGMENT
 ASSUME CS:CODE,DS:DATA
 START:  MOV AX,DATA
         MOV DS,AX
         
         PRINTMSG MSG1
         READNUM NUM1
         
          PRINTMSG MSG2
         READNUM NUM2
         
          PRINTMSG MSG3
         READNUM NUM3
         
         MOV AL,NUM1
         MOV BL,NUM2
         CMP AL,BL
         JC FIRST
         
SECOND:  MOV AL,BL
         MOV BL,NUM3
         CMP AL,BL
         JNC THIRD
         MOV SMALLEST,AL
         JMP EXIT
         
FIRST:    MOV BL,NUM3
         CMP AL,BL
         JNC THIRD
         MOV SMALLEST,AL
         JMP EXIT
         
THIRD:        MOV SMALLEST,BL

 EXIT:PRINTMSG MSG4
 
      MOV DL,SMALLEST
      ADD DL,30H
      MOV AH,02H
      INT 21H
      
STOP:  MOV AH,4CH
       INT 21H

CODE ENDS
END START              
         
                  
         
         
