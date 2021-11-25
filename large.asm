DATA SEGMENT
          MSG1 DB 'ENTER THE FIRST NUMBER: $'
          MSG2 DB 0AH,0DH,'ENTER THE SECOND NUMBER: $'
          MSG3 DB 0AH,0DH,'ENTER THE THIRD NUMBER: $'
          MSG4 DB 0AH,0DH,'LARGEST  NUMBER: $'
           NUM1 DB ?
           NUM2 DB ?
           NUM3 DB ?
           LARGEST DB ?
 DATA ENDS
 
 CODE SEGMENT
 ASSUME CS:CODE,DS:DATA
 START:  MOV AX,DATA
         MOV DS,AX
        
         LEA DX,MSG1
         MOV AH,09H
         INT 21H
        
         MOV AH,01H
         INT 21H
         SUB AL,30H
         MOV NUM1,AL
        
        
         LEA DX,MSG2
         MOV AH,09H
         INT 21H
        
         MOV AH,01H
         INT 21H
         SUB AL,30H
         MOV NUM2,AL
        
           
         LEA DX,MSG3
         MOV AH,09H
         INT 21H
        
        
         MOV AH,01H
         INT 21H
         SUB AL,30H
         MOV NUM3,AL
        
         MOV AL,NUM1
         MOV BL,NUM2
         CMP AL,BL
         JNC FIRST
        
SECOND:   MOV AL,BL
          MOV BL,NUM3
          CMP AL,BL
          JC THIRD
          MOV LARGEST,AL
          JMP EXIT
            
FIRST:    MOV BL,NUM3
          CMP AL,BL
          JC THIRD
          MOV LARGEST,AL
          JMP EXIT
            
THIRD:   MOV LARGEST,BL
  
EXIT:    LEA DX,MSG4
         MOV AH,09H
         INT 21H   
      
         MOV DL,LARGEST
         ADD DL,30H
         MOV AH,02H
         INT 21H
      
STOP:    MOV AH,4CH
         INT 21H
           
CODE ENDS
END START         
                          
