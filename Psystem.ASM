.model small
.stack 100h
.data
menu db '*****************MENU*********************$'
menu1 db 'Press 1 for rikshw$'
menu2 db 'Press 2 for cars$'
menu3 db 'Press 3 for bus$'
menu4 db 'Press 4 to show the record$'
menu5 db 'Press 5 to delete the record$'
menu6 db 'Press 6 to exit$'
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of rikshws parked=$'
msg10 db 'the total number of cars parked=$'
msg11 db 'the total number of buses parked=$'
msg12 db '***Record deleted successfully***$'
msg13 db 'Car Parked$'
msg14 db 'Bus Parked$'
msg15 db 'Rickshaw Parked$'
amount dw 0  
count dw  '0' 

r dw '0'        
c db '0'         
b db '0'         
.code
main proc
.STARTUP      

while_:   
             
mov dx,10     
mov ah,2      
int 21h       
mov dx,13    
mov ah,2
int 21h

mov dx,offset menu   
CALL message

mov dx,offset menu1   
CALL message

mov dx,offset menu2
CALL message

mov dx,offset menu3
CALL message

mov dx,offset menu4
CALL message

mov dx,offset menu5
CALL message

mov dx,offset menu6
CALL message

mov ah,1      ;user Input    
int 21h
mov bl,al          
mov dx,10          
mov ah,2             
int 21h
mov dx,13           
mov ah,2
int 21h
                     
mov al,bl
cmp al,'1'            
je rikshw
cmp al,'2'
je car
cmp al,'3'
je bus
cmp al,'4'
je rec
cmp al,'5'
je del
cmp al,'6'
je end_         
                       
mov dx,offset msg2
mov ah,9
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
jmp while_             

rikshw:
call rikshaw           

car:
call caar

rec:
call recrd

del:
call delt

bus:
call buss

end_:
mov ah,4ch 
int 21h

main endp

message proc
mov ah,9            
int 21h

mov dx,10           
mov ah,2            
int 21h
mov dx,13
mov ah,2
int 21h
ret
message endp

rikshaw proc
cmp count,'8'                       

jle rikshw1                          

mov dx,offset msg1
mov ah,9                             
int 21h
jmp while_
jmp end_

rikshw1:
mov ax,200                        
add amount, ax                     
     
mov dx,offset msg15
mov ah,9
int 21h
inc count                   

inc r                         

jmp while_
jmp end_

caar proc
cmp count,'8'                
jle car1                        
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car1:    
                      
mov ax,300              
add amount, ax 

mov dx,offset msg13
mov ah,9
int 21h 
        
mov dx,0
mov bx,10
mov cx,0                      
inc count                 
inc c
jmp while_
jmp end_

buss proc
cmp count,'8'
jle bus1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

bus1:
mov ax,400
add amount, ax

mov dx,offset msg14
mov ah,9
int 21h

inc count
inc b
jmp while_
jmp end_

recrd proc                 
mov dx,offset msg7
mov ah,9
int 21h                               
mov ax, amount               
mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
     
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,30H
        mov ah,2
        int 21h
loop totalprint

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset msg8
mov ah,9
int 21h

mov dx,count
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset msg9
mov ah,9
int 21h

mov dx,r
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset msg10
mov ah,9
int 21h

mov dl,c  
mov ah,2
int 21h

mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h

mov dx,offset msg11
mov ah,9
int 21h

mov dl,b
mov ah,2
int 21h

jmp while_
jmp end_
                      
delt proc          
mov r,'0'               
mov c,'0'
mov b,'0'
mov amount,0   

mov count,'0'
                             
mov dx,offset msg12
call message
jmp while_
jmp end_
end main