.data
pixels:.space 16384 #espaço total dos pixels
laranja: .word 0x00FFA500
vermelho: .word 0xFF0000
amarelo: .word 0xF0C807
azul: .word 0x1656AD
verde: .word 0x008000
branco: .word 0xFFFFFF
corDoFundo: .word 0x4B4C4E
pontuacaoPlayer1: .word 99
.word 0x47474747
.text              

jal pintaTela
jal pintaCima
jal pintaBaixo
jal pintaEsquerda
jal pintaDireita
jal pintaBordaPlacarCima
jal pintaBordaPlacarBaixo
jal pintaBordaPlacarEsquerda
jal pintaBordaPlacarDireita
sw $ra, 0($sp)
addi $sp, $sp, -4
jal mostraPlacarPlayer1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao1Player1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao2Player1
addi $sp, $sp, 4
lw $ra, 0($sp)
jal desceTecla1
j exit

pintaTela:
lw $t0, corDoFundo
ori $t1, $zero, 0
lui $s0, 0x1001
loopPintaTela:
sw $t0, 0($s0)
addi $s0, $s0, 4
addi $t1, $t1, 1
bne $t1, 4096, loopPintaTela
jr $ra

pintaCima:
lw $t0, laranja # $t0 = laranja
ori $t1, $zero, 0 # $t1 = contador
li $s0, 0x10010900
loopPintaCima:
sw $t0, 0($s0)
addi $s0, $s0, 4
addi $t1, $t1, 1
bne $t1, 64, loopPintaCima
jr $ra

pintaBaixo:
ori $t1, $zero, 0
li $s0, 0x10013F00
lw $t0, laranja
loopPintaBaixo:
sw $t0, 0($s0)
addi $s0, $s0, 4
addi $t1, $t1, 1
bne $t1, 64, loopPintaBaixo
jr $ra

pintaEsquerda:
ori $t1, $zero, 0
li $s0, 0x10010A00
lw $t0, laranja
loopPintaEsquerda:
sw $t0, 0($s0)
addi $s0, $s0, 256
addi $t1, $t1, 1
bne $t1, 55, loopPintaEsquerda
jr $ra

pintaDireita:
ori $t1, $zero, 0
li $s0, 0x10010AFC
lw $t0, laranja
loopPintaDireita:
sw $t0, 0($s0)
addi $s0, $s0, 256
addi $t1, $t1, 1
bne $t1, 55, loopPintaDireita
jr $ra

pintaBordaPlacarCima:
lw $t0, branco 
ori $t1, $zero, 0 
li $s0, 0x10010000
loopPintaBordaPlacarCima:
sw $t0, 0($s0)
addi $s0, $s0, 4
addi $t1, $t1, 1
bne $t1, 64, loopPintaBordaPlacarCima
jr $ra

pintaBordaPlacarBaixo:
lw $t0, branco 
ori $t1, $zero, 0 
li $s0, 0x10010800
loopPintaBordaPlacarBaixo:
sw $t0, 0($s0)
addi $s0, $s0, 4
addi $t1, $t1, 1
bne $t1, 64, loopPintaBordaPlacarBaixo
jr $ra

pintaBordaPlacarEsquerda:
lw $t0, branco 
ori $t1, $zero, 0 
li $s0, 0x10010000
loopPintaBordaPlacarEsquerda:
sw $t0, 0($s0)
addi $s0, $s0, 256
addi $t1, $t1, 1
bne $t1, 8, loopPintaBordaPlacarEsquerda
jr $ra

pintaBordaPlacarDireita:
lw $t0, branco 
ori $t1, $zero, 0 
li $s0, 0x100100FC
loopPintaBordaPlacarDireita:
sw $t0, 0($s0)
addi $s0, $s0, 256
addi $t1, $t1, 1
bne $t1, 8, loopPintaBordaPlacarDireita
jr $ra

mostraPlacarPlayer1:
lw $t0, pontuacaoPlayer1
ori $t3, $zero, 10 # $t3 = 10
div $t0, $t3
mfhi $t1 #coloca em $t1 a unidade (o resto da divisão por 10)
mflo $t2 # coloca em $t2 a dezena (o placar não vai passar de 99)
unidade:
beq $t1, 0, zero
beq $t1, 1, um
beq $t1, 2, dois
beq $t1, 3, tres
beq $t1, 4, quatro
beq $t1, 5, cinco
beq $t1, 6, seis
beq $t1, 7, sete
beq $t1, 8, oito
beq $t1, 9, nove

zero:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroZero
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroZero:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t0,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t0,  512($s0)
sw $t3,  516($s0)
sw $t0,  520($s0)
sw $t0,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

um:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroUm
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroUm:
lw $t0, branco
lw $t3, corDoFundo
sw $t3,  0($s0)
sw $t3,  4($s0)
sw $t0,  8($s0)
sw $t3,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t3,  512($s0)
sw $t3,  516($s0)
sw $t0,  520($s0)
sw $t3,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t3,  1024($s0)
sw $t3,  1028($s0)
sw $t0,  1032($s0)
jr $ra

dois:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroDois
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroDois:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t3,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t0,  768($s0)
sw $t3,  772($s0)
sw $t3,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

tres:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroTres
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroTres:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t3,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t3,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

quatro:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroQuatro
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroQuatro:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t3,  4($s0)
sw $t0,  8($s0)
sw $t0,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t3,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t3,  1024($s0)
sw $t3,  1028($s0)
sw $t0,  1032($s0)
jr $ra

cinco:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroCinco
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroCinco:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t0,  256($s0)
sw $t3,  260($s0)
sw $t3,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t3,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

seis:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroSeis
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroSeis:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t0,  256($s0)
sw $t3,  260($s0)
sw $t3,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t0,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

sete:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroSete
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroSete:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t3,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t3,  512($s0)
sw $t3,  516($s0)
sw $t0,  520($s0)
sw $t3,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t3,  1024($s0)
sw $t3,  1028($s0)
sw $t0,  1032($s0)
jr $ra

oito:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroOito
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroOito:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t0,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t0,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

nove:
li $s0, 0x100102EC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroNove
addi $sp, $sp, 4
lw $ra, 0($sp)
j dezena

pintaNumeroNove:
lw $t0, branco
lw $t3, corDoFundo
sw $t0,  0($s0)
sw $t0,  4($s0)
sw $t0,  8($s0)
sw $t0,  256($s0)
sw $t3,  260($s0)
sw $t0,  264($s0)
sw $t0,  512($s0)
sw $t0,  516($s0)
sw $t0,  520($s0)
sw $t3,  768($s0)
sw $t3,  772($s0)
sw $t0,  776($s0)
sw $t0,  1024($s0)
sw $t0,  1028($s0)
sw $t0,  1032($s0)
jr $ra

dezena:
beq $t2, 0, zeroDezena
beq $t2, 1, umDezena
beq $t2, 2, doisDezena
beq $t2, 3, tresDezena
beq $t2, 4, quatroDezena
beq $t2, 5, cincoDezena
beq $t2, 6, seisDezena
beq $t2, 7, seteDezena
beq $t2, 8, oitoDezena
beq $t2, 9, noveDezena

zeroDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroZero
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

umDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroUm
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

doisDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroDois
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

tresDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroTres
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

quatroDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroQuatro
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

cincoDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroCinco
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

seisDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroSeis
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

seteDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroSete
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

oitoDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroOito
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

noveDezena:
li $s0, 0x100102DC
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaNumeroNove
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

exit:
ori $v0, $zero, 10
syscall

pintaBotao1Player1:
li $s0, 0x10013928
lw $t0, vermelho
lw $t1, corDoFundo
sw $ra 0($sp)
addi $sp, $sp, -4
jal pintaBotao
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

pintaBotao2Player1:
li $s0, 0x10013950
lw $t0, amarelo
lw $t1, corDoFundo
sw $ra 0($sp)
addi $sp, $sp, -4
jal pintaBotao
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

pintaBotao:
#sw $t0, -248($s0)
#sw $t0, 0($s0)
sw $t0, 4($s0)
sw $t0, 8($s0)
sw $t0, 12($s0)
#sw $t0, 16($s0)
sw $t0, 256($s0)
sw $t3, 260($s0)
sw $t3, 264($s0)
sw $t3, 268($s0)
sw $t0, 272($s0)
#sw $t0, 512($s0)
sw $t0, 516($s0)
sw $t0, 520($s0)
sw $t0, 524($s0)
#sw $t0, 528($s0)
#sw $t0, 776($s0)
jr $ra

desceTecla1:
li $s0, 0x10010A2C
li $s2, 0x10010A30
li $s4, 0x10010A34
lw $t0, branco
lw $t1, corDoFundo
lw $t6, vermelho
#sw $t6, corPraConsertarBotao
ori $t2, $zero, 0 # $t2 = contador
ori $v0, $zero, 32
ori $a0, $zero, 206
sw $t0, 0($s0)
sw $t0, 0($s2)
sw $t0, 0($s4)

desceTecla: #essa parte pode ser usada nas outras teclas também
ori $v0, $zero, 32
ori $a0, $zero, 206
syscall # PROBLEMA: tem que pintar as 4 teclas pra depois dar syscall, e não dar syscall em cada uma delas
addi $t2, $t2, 1
addi $s0, $s0, 256
addi $s1, $s0, -256
sw $t0, 0($s0)
sw $t1, 0($s1)

addi $s2, $s2, 256
addi $s3, $s2, -256
sw $t0, 0($s2)
sw $t1, 0($s3)

addi $s4, $s4, 256
addi $s5, $s4, -256
sw $t0, 0($s4)
sw $t1, 0($s5)
#beq $t2, 47, podeApertarBotao1
beq $t2, 48, repintaBotao
beq $t2, 50, repintaBotao

lw $t4, 0xFFFF0004
beq $t4, 97, printa
j voltaRepintaBotao
printa:
ori $v0, $zero, 1
ori $a0, $zero, 47
syscall

voltaRepintaBotao:bne $t2, 51, desceTecla
jr $ra
repintaBotao:
#lw $t6, corPraConsertarBotao
sw $t6, 0($s1)
sw $t6, 0($s3)
sw $t6, 0($s5)
j voltaRepintaBotao

verificaFlagTecla1:
cancelaDesceTecla1:

randomizaTecla1:#coloca um numero aleatório no registrador ou posição de memória pra tecla 1

randomizaTecla2:#mesma função só que pra tecla 2

randomizaTecla3:#mesma função só que pra tecla 3

randomizaTecla4:#mesma função só que pra tecla 4
