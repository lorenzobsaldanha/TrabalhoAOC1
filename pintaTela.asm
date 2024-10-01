.data
pixels:.space 16384 #espaço total dos pixels
velocidade: .word 206
laranja: .word 0x00FFA500
vermelho: .word 0xFF0000
amarelo: .word 0xF0C807
azul: .word 0x1656AD
verde: .word 0x008000
branco: .word 0xFFFFFF
corDoFundo: .word 0x4B4C4E
pontuacaoPlayer1: .word 98
pixel1Desce1: .space 4
pixel2Desce1: .space 4
pixel3Desce1: .space 4
posicaoPixel1Desce1: .space 4
posicaoPixel2Desce1: .space 4
posicaoPixel3Desce1: .space 4
posicaoDesce2: .space 4
posicaoDesce3: .space 4
posicaoDesce4: .space 4
ultimoBotaoApertado: .word 0
corBotaoDesce1: .space 4
flagBotao1: .word 0
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
jal comecaDesceTeclas
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

aumentaPontuacaoPlayer1:
la $s0, pontuacaoPlayer1
lw $t0, pontuacaoPlayer1
addi $t0, $t0, 1
sw $t0, 0($s0)
sw $ra, 0($sp)
addi $sp, $sp, -4
jal mostraPlacarPlayer1
addi $sp, $sp, 4
lw $ra, 0($sp)

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

numeroAleatorio:
addi $a1, $zero, 2
addi $v0, $zero, 42
syscall
jr $ra
#coloca um numero de 0 ate 3 no $a0

comecaDesceTeclas:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
#jal aleatorizaDesce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
#jal aleatorizaDesce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
#jal aleatorizaDesce4
addi $sp, $sp, 4
lw $ra, 0($sp)
j desceTeclas

aleatorizaDesce1:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal numeroAleatorio
addi $sp, $sp, 4
lw $ra, 0($sp)
beq $a0, 0, posicao1Desce1
#beq $a0, 1, posicao2Desce1
#beq $a0, 2, posicao3Desce1
#beq $a0, 3, posicao4Desce1
posicao1Desce1:
li $s0, 0x10010A2C
sw $s0, pixel1Desce1
li $s0, 0x10010A30
sw $s0, pixel2Desce1
li $s0, 0x10010A34
sw $s0, pixel3Desce1
lw $t0, vermelho
sw $t0, corBotaoDesce1
jr $ra
#posicao2Desce1:
#posicao3Desce1:
#posicao4Desce1:

desceTeclas: #essa parte pode ser usada nas outras teclas também
sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal sleep
addi $sp, $sp, 4
lw $ra, 0($sp) 
#jal desce1
#jal desce2
#sleep
#jal desce1
#jal desce2
#jal desce3
#sleep
# LOOP: jal desce1
#jal desce2
#jal desce3
#jal desce4
#sleep

#desce2
#desce3
#desce4

# VERIFICAÇÕES:
#verifica se tem que repintar botao1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeTemQueRepintarBotao1
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se pode apertar botao1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao1
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se apertou o botao 1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeApertouBotao1
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se a tecla passou do botao e perdeu o jogo
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao1
addi $sp, $sp, 4
lw $ra, 0($sp)  

j desceTeclas #j loop
jr $ra

desce1:
lw $t0, branco
lw $s0, pixel1Desce1
lw $s1, pixel2Desce1
lw $s2, pixel3Desce1
sw $t0, 0($s0)
sw $t0, 0($s1)
sw $t0, 0($s2)

la $s0, pixel1Desce1
la $s1, pixel2Desce1
la $s2, pixel3Desce1
sw $s0, posicaoPixel1Desce1
sw $s1, posicaoPixel2Desce1
sw $s2, posicaoPixel3Desce1
addi $s0, $s0, 256  #    SALVAR A POSICAO DOS PIXELS PRA PEGAR ELES DEPOIS

addi $s1, $s1, 256
addi $s2, $s2, 256
jr $ra

verificaSeTemQueRepintarBotao1:
lw $t0, 0x1001392C
lw $t1, corDoFundo
beq $t0, $t1, repintaBotao1
j fimVerificaSeTemQueRepintarBotao1
repintaBotao1:
lw $t1, vermelho
sw $t1, 0x1001392C
sw $t1, 0x10013930
sw $t1, 0x10013934
fimVerificaSeTemQueRepintarBotao1:
jr $ra

verificaSePodeApertarBotao1:
lw $t0, 0x1001392C
lw $t1, branco
beq $t0, $t1, ligaFlag1
j fimVerificaSePodeApertarBotao1
ligaFlag1:
ori $t1, $zero, 1
sw $t1, flagBotao1
fimVerificaSePodeApertarBotao1:
jr $ra

verificaSeApertouBotao1:
lw $t0, flagBotao1
lw $t1, 0xffff0004
beq $t1, 97, verificaSePerdeu
beq $t1, 0, voltaResetaBotaoApertado1#quando digitar as outras teclas, mesmo que esteja na hora certa dos outros botoes, vai perder aqui
verificaSePerdeu:
beq $t0, 0, gameOver
beq $t0, 1, resetaBotaoApertado1
voltaResetaBotaoApertado1:
jr $ra


resetaBotaoApertado1:
ori $t0, $zero, 0
sw $t0, 0xffff0004 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce1
#jal chamanumeroaleatorio e recoloca desce1, e repinta botao1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao1Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal aumentaPontuacaoPlayer1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal aumentaVelocidade
addi $sp, $sp, 4
lw $ra, 0($sp) 
j voltaResetaBotaoApertado1

verificaSePassouBotao1:
lw $t0, 0x10013C2C
lw $t1, branco
beq $t0, $t1, gameOver
jr $ra

verificaSePerdeuBotao1234:

sleep:
ori $v0, $zero, 32
lw $a0, velocidade
syscall
jr $ra

aumentaVelocidade:
lw $t0, velocidade
addi $t0, $t0, 1
sw $t0, velocidade
jr $ra

gameOver:
addi $sp, $sp, 4
lw $ra, 0($sp)
#print voce perdeu
j exit
#j desejaReiniciar? se sim, chama todas as funções do começõ do código denovo

exit:
ori $v0, $zero, 10
syscall
