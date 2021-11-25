PRINTMSG  MACRO MSG
          MOV AH,09H
          LEA DX,MSG
          INT 21H
          ENDM
          
DATA SEGMENT
         CR EQU 0DH
         LF EQU 0AH
         MSG1 DB 'ENTER THE STRING:$'
         MSG2 DB 'ENTERD THE STRING:$'
         BUFF DB 80 DUP(0)
DATA ENDS

CODE SEGMENT 
         ASSUME CS:CODE,DS:DATA
         
START:       MOV AX,DATA 
              MOV DS,AX
              PRINTMSG MSG1
              
              MOV SI,OFFSET BUFF
              
READ:     MOV AH,01H
          INT 21H
          MOV [SI],AL
          INC SI
          CMP AL,CR
          JNE READ
          
          MOV AL,'$'
          MOV [SI],AL
          
          PRINTMSG MSG2
          PRINTMSG BUFF
          
          MOV AH,4CH
          INT 21H
          
  CODE ENDS
  END START                                  
         
