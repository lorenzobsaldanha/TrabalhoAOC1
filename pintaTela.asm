comeco:
.data
pixels:.space 16384 #espa�o total dos pixels
velocidade: .word 200
laranja: .word 0x00FFA500
vermelho: .word 0xFF0000
amarelo: .word 0xF0C807
azul: .word 0x1656AD
verde: .word 0x008000
limao: .word 0x0000FF00
ciano: .word 0x0000FFFF
roxo: .word 0x00AF33FF
magenta: .word 0x00FF00FF
branco: .word 0xFFFFFF
corDoFundo: .word 0x4B4C4E
pontuacaoPlayer1: .word 0
pixel1Desce1: .space 4
pixel2Desce1: .space 4
pixel3Desce1: .space 4
pixel1Desce2: .space 4
pixel2Desce2: .space 4
pixel3Desce2: .space 4
pixel1Desce3: .space 4
pixel2Desce3: .space 4
pixel3Desce3: .space 4
pixel1Desce4: .space 4
pixel2Desce4: .space 4
pixel3Desce4: .space 4
pixel1Temporario: .space 4
pixel2Temporario: .space 4
pixel3Temporario: .space 4
posicaoPixel1Desce1: .space 4
posicaoPixel2Desce1: .space 4
posicaoPixel3Desce1: .space 4
posicaoPixel1Desce2: .space 4
posicaoPixel2Desce2: .space 4
posicaoPixel3Desce2: .space 4
posicaoPixel1Desce3: .space 4
posicaoPixel2Desce3: .space 4
posicaoPixel3Desce3: .space 4
posicaoPixel1Desce4: .space 4
posicaoPixel2Desce4: .space 4
posicaoPixel3Desce4: .space 4
ultimoBotaoApertado: .word 0
corBotaoDesce1: .space 4
corBotaoDesce2: .space 4
corBotaoDesce3: .space 4
corBotaoDesce4: .space 4
flagBotao1Desce1: .word 0 #pode ser que precise fazer uma flag pra cada desce(1234)
flagBotao2Desce1: .word 0
flagBotao3Desce1: .word 0
flagBotao4Desce1: .word 0
flagBotao1Desce2: .word 0 
flagBotao2Desce2: .word 0
flagBotao3Desce2: .word 0
flagBotao4Desce2: .word 0
flagBotao1Desce3: .word 0 
flagBotao2Desce3: .word 0
flagBotao3Desce3: .word 0
flagBotao4Desce3: .word 0
flagBotao1Desce4: .word 0 
flagBotao2Desce4: .word 0
flagBotao3Desce4: .word 0
flagBotao4Desce4: .word 0
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

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao3Player1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao4Player1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal comecaDesceTeclas
addi $sp, $sp, 4
lw $ra, 0($sp)
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
bne $t1, 54, loopPintaEsquerda
jr $ra

pintaDireita:
ori $t1, $zero, 0
li $s0, 0x10010AFC
lw $t0, laranja
loopPintaDireita:
sw $t0, 0($s0)
addi $s0, $s0, 256
addi $t1, $t1, 1
bne $t1, 54, loopPintaDireita
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
mfhi $t1 #coloca em $t1 a unidade (o resto da divis�o por 10)
mflo $t2 # coloca em $t2 a dezena (o placar n�o vai passar de 99)
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
la $s0, pontuacaoPlayer1 # talvez n�o precise dessa linha
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

pintaBotao3Player1:
li $s0, 0x10013978
lw $t0, azul
lw $t1, corDoFundo
sw $ra 0($sp)
addi $sp, $sp, -4
jal pintaBotao
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra

pintaBotao4Player1:
li $s0, 0x100139A0
lw $t0, verde
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
sw $t1, 260($s0)
sw $t1, 264($s0)
sw $t1, 268($s0)
sw $t0, 272($s0)
#sw $t0, 512($s0)
sw $t0, 516($s0)
sw $t0, 520($s0)
sw $t0, 524($s0)
#sw $t0, 528($s0)
sw $t1, 772($s0)
sw $t1, 776($s0)
sw $t1, 780($s0)
jr $ra

numeroAleatorio:
addi $a1, $zero, 4
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
jal aleatorizaDesce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce4
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
beq $a0, 1, posicao2Desce1
beq $a0, 2, posicao3Desce1
beq $a0, 3, posicao4Desce1
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
posicao2Desce1:
li $s0, 0x10010A54
sw $s0, pixel1Desce1
li $s0, 0x10010A58
sw $s0, pixel2Desce1
li $s0, 0x10010A5C
sw $s0, pixel3Desce1
lw $t0, amarelo
sw $t0, corBotaoDesce1
jr $ra
posicao3Desce1:
li $s0, 0x10010A7C
sw $s0, pixel1Desce1
li $s0, 0x10010A80
sw $s0, pixel2Desce1
li $s0, 0x10010A84
sw $s0, pixel3Desce1
lw $t0, azul
sw $t0, corBotaoDesce1
jr $ra
posicao4Desce1:
li $s0, 0x10010AA4
sw $s0, pixel1Desce1
li $s0, 0x10010AA8
sw $s0, pixel2Desce1
li $s0, 0x10010AAC
sw $s0, pixel3Desce1
lw $t0, verde
sw $t0, corBotaoDesce1
jr $ra

aleatorizaDesce2:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal numeroAleatorio
addi $sp, $sp, 4
lw $ra, 0($sp)
beq $a0, 0, posicao1Desce2
beq $a0, 1, posicao2Desce2
beq $a0, 2, posicao3Desce2
beq $a0, 3, posicao4Desce2
posicao1Desce2:
li $s0, 0x10010A2C
sw $s0, pixel1Desce2
li $s0, 0x10010A30
sw $s0, pixel2Desce2
li $s0, 0x10010A34
sw $s0, pixel3Desce2
lw $t0, vermelho 
sw $t0, corBotaoDesce2
jr $ra
posicao2Desce2:
li $s0, 0x10010A54
sw $s0, pixel1Desce2
li $s0, 0x10010A58
sw $s0, pixel2Desce2
li $s0, 0x10010A5C
sw $s0, pixel3Desce2
lw $t0, amarelo
sw $t0, corBotaoDesce2
jr $ra
posicao3Desce2:
li $s0, 0x10010A7C
sw $s0, pixel1Desce2
li $s0, 0x10010A80
sw $s0, pixel2Desce2
li $s0, 0x10010A84
sw $s0, pixel3Desce2
lw $t0, azul
sw $t0, corBotaoDesce2
jr $ra
posicao4Desce2:
li $s0, 0x10010AA4
sw $s0, pixel1Desce2
li $s0, 0x10010AA8
sw $s0, pixel2Desce2
li $s0, 0x10010AAC
sw $s0, pixel3Desce2
lw $t0, verde
sw $t0, corBotaoDesce2
jr $ra

aleatorizaDesce3:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal numeroAleatorio
addi $sp, $sp, 4
lw $ra, 0($sp)
beq $a0, 0, posicao1Desce3
beq $a0, 1, posicao2Desce3
beq $a0, 2, posicao3Desce3
beq $a0, 3, posicao4Desce3
posicao1Desce3:
li $s0, 0x10010A2C
sw $s0, pixel1Desce3
li $s0, 0x10010A30
sw $s0, pixel2Desce3
li $s0, 0x10010A34
sw $s0, pixel3Desce3
lw $t0, vermelho 
sw $t0, corBotaoDesce3
jr $ra
posicao2Desce3:
li $s0, 0x10010A54
sw $s0, pixel1Desce3
li $s0, 0x10010A58
sw $s0, pixel2Desce3
li $s0, 0x10010A5C
sw $s0, pixel3Desce3
lw $t0, amarelo
sw $t0, corBotaoDesce3
jr $ra
posicao3Desce3:
li $s0, 0x10010A7C
sw $s0, pixel1Desce3
li $s0, 0x10010A80
sw $s0, pixel2Desce3
li $s0, 0x10010A84
sw $s0, pixel3Desce3
lw $t0, azul
sw $t0, corBotaoDesce3
jr $ra
posicao4Desce3:
li $s0, 0x10010AA4
sw $s0, pixel1Desce3
li $s0, 0x10010AA8
sw $s0, pixel2Desce3
li $s0, 0x10010AAC
sw $s0, pixel3Desce3
lw $t0, verde
sw $t0, corBotaoDesce3
jr $ra

aleatorizaDesce4:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal numeroAleatorio
addi $sp, $sp, 4
lw $ra, 0($sp)
beq $a0, 0, posicao1Desce4
beq $a0, 1, posicao2Desce4
beq $a0, 2, posicao3Desce4
beq $a0, 3, posicao4Desce4
posicao1Desce4:
li $s0, 0x10010A2C
sw $s0, pixel1Desce4
li $s0, 0x10010A30
sw $s0, pixel2Desce4
li $s0, 0x10010A34
sw $s0, pixel3Desce4
lw $t0, vermelho 
sw $t0, corBotaoDesce4
jr $ra
posicao2Desce4:
li $s0, 0x10010A54
sw $s0, pixel1Desce4
li $s0, 0x10010A58
sw $s0, pixel2Desce4
li $s0, 0x10010A5C
sw $s0, pixel3Desce4
lw $t0, amarelo
sw $t0, corBotaoDesce4
jr $ra
posicao3Desce4:
li $s0, 0x10010A7C
sw $s0, pixel1Desce4
li $s0, 0x10010A80
sw $s0, pixel2Desce4
li $s0, 0x10010A84
sw $s0, pixel3Desce4
lw $t0, azul
sw $t0, corBotaoDesce4
jr $ra
posicao4Desce4:
li $s0, 0x10010AA4
sw $s0, pixel1Desce4
li $s0, 0x10010AA8
sw $s0, pixel2Desce4
li $s0, 0x10010AAC
sw $s0, pixel3Desce4
lw $t0, verde
sw $t0, corBotaoDesce4
jr $ra

#COMECA AQUI
desceTeclas: 
sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

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

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal sleep
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal sleep
addi $sp, $sp, 4
lw $ra, 0($sp)

loopDesceTeclas: 
sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal desce4
addi $sp, $sp, 4
lw $ra, 0($sp)


# VERIFICA��ES:
#verifica se apertou o botoes Desce 
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeApertouBotoesDesce1
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeApertouBotoesDesce2
addi $sp, $sp, 4
lw $ra, 0($sp)     

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeApertouBotoesDesce3
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeApertouBotoesDesce4
addi $sp, $sp, 4
lw $ra, 0($sp)  
#BOTAO 1:
#verifica se tem que repintar botao1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeTemQueRepintarBotao1
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se pode apertar botao1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao1Desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao1Desce2
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao1Desce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao1Desce4
addi $sp, $sp, 4
lw $ra, 0($sp) 
#verifica se a tecla passou do botao e perdeu o jogo
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao1Desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao1Desce2
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao1Desce3
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao1Desce4
addi $sp, $sp, 4
lw $ra, 0($sp)  

#BOTAO 2:
#verifica se tem que repintar botao2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeTemQueRepintarBotao2
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se pode apertar botao2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao2Desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao2Desce2
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao2Desce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao2Desce4
addi $sp, $sp, 4
lw $ra, 0($sp) 
#verifca se passou botao 2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao2Desce1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao2Desce2
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao2Desce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao2Desce4
addi $sp, $sp, 4
lw $ra, 0($sp) 
#BOTAO 3:
#verifica se tem que repintar botao3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeTemQueRepintarBotao3
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se pode apertar botao3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao3Desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao3Desce2
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao3Desce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao3Desce4
addi $sp, $sp, 4
lw $ra, 0($sp) 
#verifca se passou botao 3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao3Desce1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao3Desce2
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao3Desce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao3Desce4
addi $sp, $sp, 4
lw $ra, 0($sp) 

#BOTAO 4:
#verifica se tem que repintar botao4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSeTemQueRepintarBotao4
addi $sp, $sp, 4
lw $ra, 0($sp)  
#verifica se pode apertar botao4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao4Desce1
addi $sp, $sp, 4
lw $ra, 0($sp)  

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao4Desce2
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao4Desce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePodeApertarBotao4Desce4
addi $sp, $sp, 4
lw $ra, 0($sp) 
#verifca se passou botao 4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao4Desce1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao4Desce2
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao4Desce3
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal verificaSePassouBotao4Desce4
addi $sp, $sp, 4
lw $ra, 0($sp)

#ULTIMAS FUNCOES:
#verifica se apertou errado
sw $ra, 0($sp)
addi $sp, $sp, -4
jal apertouForaDaHoraDesce1
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal apertouForaDaHoraDesce2
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal apertouForaDaHoraDesce3
addi $sp, $sp, 4
lw $ra, 0($sp) 

sw $ra, 0($sp)
addi $sp, $sp, -4
jal apertouForaDaHoraDesce4
addi $sp, $sp, 4
lw $ra, 0($sp) 

#atrasa a decida da tecla
sw $ra, 0($sp)
addi $sp, $sp, -4
jal sleep
addi $sp, $sp, 4
lw $ra, 0($sp) 
j loopDesceTeclas # j loop
jr $ra
#          TERMINA DESCE TECLAS AQUI, EMBAIXO DISSO S�O O CORPO DAS FUN��ES

desce1:
lw $t0, limao
lw $t1, corDoFundo
lw $s0, pixel1Desce1
lw $s1, pixel2Desce1
lw $s2, pixel3Desce1
sw $s0, pixel1Temporario
sw $s1, pixel2Temporario
sw $s2, pixel3Temporario
beq $s0, 0x10010A2C, naoPintaFundoPrimeiraPosicaoDesce1 #verifica se vai pintar as primeiras posi��es da posi��o1, 2, 3 e 4
beq $s0, 0x10010A54, naoPintaFundoPrimeiraPosicaoDesce1
beq $s0, 0x10010A7C, naoPintaFundoPrimeiraPosicaoDesce1
beq $s0, 0x10010AA4, naoPintaFundoPrimeiraPosicaoDesce1
sw $t1, -256($s0)
sw $t1, -256($s1)
sw $t1, -256($s2)
naoPintaFundoPrimeiraPosicaoDesce1:#faz o beq ignorar a pintura da cor do fundo e pintar s� de branco aqui
sw $t0, 0($s0) # coloca a cor branca na posi��o do pixel do buffer de pixels
sw $t0, 0($s1)
sw $t0, 0($s2)

lw $s0, pixel1Temporario #ele n�o t� pulando pra pr�xima linha no pixel2Desce1? Sim, por isso tem que ter um pixelTempor�rio pra armazenar a posi��o
addi $s0, $s0, 256
sw $s0, pixel1Desce1 # coloca a pr�xima linha no ENDERE�O pixel1Desce1, fora do buffer de pixels

lw $s1, pixel2Temporario
addi $s1, $s1, 256
sw $s1, pixel2Desce1

lw $s2, pixel3Temporario #la $s2, pixel3Desce1 antes era assim a linha
addi $s2, $s2, 256
sw $s2, pixel3Desce1
  #    SALVAR A POSICAO DOS PIXELS PRA PEGAR ELES DEPOIS aparentemente foi
jr $ra

desce2:
lw $t0, ciano
lw $t1, corDoFundo
lw $s0, pixel1Desce2
lw $s1, pixel2Desce2
lw $s2, pixel3Desce2
sw $s0, pixel1Temporario
sw $s1, pixel2Temporario
sw $s2, pixel3Temporario
beq $s0, 0x10010A2C, naoPintaFundoPrimeiraPosicaoDesce2
beq $s0, 0x10010A54, naoPintaFundoPrimeiraPosicaoDesce2
beq $s0, 0x10010A7C, naoPintaFundoPrimeiraPosicaoDesce2
beq $s0, 0x10010AA4, naoPintaFundoPrimeiraPosicaoDesce2
sw $t1, -256($s0)
sw $t1, -256($s1)
sw $t1, -256($s2)
naoPintaFundoPrimeiraPosicaoDesce2:
sw $t0, 0($s0) 
sw $t0, 0($s1)
sw $t0, 0($s2)

lw $s0, pixel1Temporario 
addi $s0, $s0, 256
sw $s0, pixel1Desce2 

lw $s1, pixel2Temporario
addi $s1, $s1, 256
sw $s1, pixel2Desce2

lw $s2, pixel3Temporario 
addi $s2, $s2, 256
sw $s2, pixel3Desce2
 
jr $ra

desce3:
lw $t0, roxo
lw $t1, corDoFundo
lw $s0, pixel1Desce3
lw $s1, pixel2Desce3
lw $s2, pixel3Desce3
sw $s0, pixel1Temporario
sw $s1, pixel2Temporario
sw $s2, pixel3Temporario
beq $s0, 0x10010A2C, naoPintaFundoPrimeiraPosicaoDesce3
beq $s0, 0x10010A54, naoPintaFundoPrimeiraPosicaoDesce3
beq $s0, 0x10010A7C, naoPintaFundoPrimeiraPosicaoDesce3
beq $s0, 0x10010AA4, naoPintaFundoPrimeiraPosicaoDesce3
sw $t1, -256($s0)
sw $t1, -256($s1)
sw $t1, -256($s2)
naoPintaFundoPrimeiraPosicaoDesce3:
sw $t0, 0($s0) 
sw $t0, 0($s1)
sw $t0, 0($s2)

lw $s0, pixel1Temporario 
addi $s0, $s0, 256
sw $s0, pixel1Desce3 

lw $s1, pixel2Temporario
addi $s1, $s1, 256
sw $s1, pixel2Desce3

lw $s2, pixel3Temporario 
addi $s2, $s2, 256
sw $s2, pixel3Desce3
 
jr $ra

desce4:
lw $t0, magenta
lw $t1, corDoFundo
lw $s0, pixel1Desce4
lw $s1, pixel2Desce4
lw $s2, pixel3Desce4
sw $s0, pixel1Temporario
sw $s1, pixel2Temporario
sw $s2, pixel3Temporario
beq $s0, 0x10010A2C, naoPintaFundoPrimeiraPosicaoDesce4
beq $s0, 0x10010A54, naoPintaFundoPrimeiraPosicaoDesce4
beq $s0, 0x10010A7C, naoPintaFundoPrimeiraPosicaoDesce4
beq $s0, 0x10010AA4, naoPintaFundoPrimeiraPosicaoDesce4
sw $t1, -256($s0)
sw $t1, -256($s1)
sw $t1, -256($s2)
naoPintaFundoPrimeiraPosicaoDesce4:
sw $t0, 0($s0) 
sw $t0, 0($s1)
sw $t0, 0($s2)

lw $s0, pixel1Temporario 
addi $s0, $s0, 256
sw $s0, pixel1Desce4 

lw $s1, pixel2Temporario
addi $s1, $s1, 256
sw $s1, pixel2Desce4

lw $s2, pixel3Temporario 
addi $s2, $s2, 256
sw $s2, pixel3Desce4
 
jr $ra

#verificaSeTemQueRepintarBotoes:
verificaSeTemQueRepintarBotao1:
lw $t0, 0x1001392C
lw $t1, corDoFundo
beq $t0, $t1, repintaBotao1Cima
voltaRepintaBotao1Cima:
lw $t0, 0x10013B2C
beq $t0, $t1, repintaBotao1Baixo
j fimVerificaSeTemQueRepintarBotao1
repintaBotao1Cima:
lw $t1, vermelho
sw $t1, 0x1001392C
sw $t1, 0x10013930
sw $t1, 0x10013934
j voltaRepintaBotao1Cima
repintaBotao1Baixo:
lw $t1, vermelho
sw $t1, 0x10013B2C
sw $t1, 0x10013B30
sw $t1, 0x10013B34
fimVerificaSeTemQueRepintarBotao1:
jr $ra

verificaSeTemQueRepintarBotao2:
lw $t0, 0x10013954
lw $t1, corDoFundo
beq $t0, $t1, repintaBotao2Cima
voltaRepintaBotao2Cima:
lw $t0, 0x10013B54
beq $t0, $t1, repintaBotao2Baixo
j fimVerificaSeTemQueRepintarBotao2
repintaBotao2Cima:
lw $t1, amarelo
sw $t1, 0x10013954
sw $t1, 0x10013958
sw $t1, 0x1001395C
j voltaRepintaBotao2Cima
repintaBotao2Baixo:
lw $t1, amarelo
sw $t1, 0x10013B54
sw $t1, 0x10013B58
sw $t1, 0x10013B5C
fimVerificaSeTemQueRepintarBotao2:
jr $ra

verificaSeTemQueRepintarBotao3:
lw $t0, 0x1001397C
lw $t1, corDoFundo
beq $t0, $t1, repintaBotao3Cima
voltaRepintaBotao3Cima:
lw $t0, 0x10013B7C
beq $t0, $t1, repintaBotao3Baixo
j fimVerificaSeTemQueRepintarBotao3
repintaBotao3Cima:
lw $t1, azul
sw $t1, 0x1001397C
sw $t1, 0x10013980
sw $t1, 0x10013984
j voltaRepintaBotao3Cima
repintaBotao3Baixo:
lw $t1, azul
sw $t1, 0x10013B7C
sw $t1, 0x10013B80
sw $t1, 0x10013B84
fimVerificaSeTemQueRepintarBotao3:
jr $ra

verificaSeTemQueRepintarBotao4:
lw $t0, 0x100139A4
lw $t1, corDoFundo
beq $t0, $t1, repintaBotao4Cima
voltaRepintaBotao4Cima:
lw $t0, 0x10013BA4
beq $t0, $t1, repintaBotao4Baixo
j fimVerificaSeTemQueRepintarBotao4
repintaBotao4Cima:
lw $t1, verde
sw $t1, 0x100139A4
sw $t1, 0x100139A8
sw $t1, 0x100139AC
j voltaRepintaBotao4Cima
repintaBotao4Baixo:
lw $t1, verde
sw $t1, 0x10013BA4
sw $t1, 0x10013BA8
sw $t1, 0x10013BAC
fimVerificaSeTemQueRepintarBotao4:
jr $ra

#verificaSePodeApertarBotoes:
verificaSePodeApertarBotao1Desce1:
lw $t0, 0x1001392C
lw $t1, limao
beq $t0, $t1, ligaFlag1Desce1
j fimVerificaSePodeApertarBotao1Desce1
ligaFlag1Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce1
fimVerificaSePodeApertarBotao1Desce1:
jr $ra

verificaSePodeApertarBotao2Desce1:
lw $t0, 0x10013954
lw $t1, limao
beq $t0, $t1, ligaFlag2Desce1
j fimVerificaSePodeApertarBotao2Desce1
ligaFlag2Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce1
fimVerificaSePodeApertarBotao2Desce1:
jr $ra

verificaSePodeApertarBotao3Desce1:
lw $t0, 0x1001397C
lw $t1, limao
beq $t0, $t1, ligaFlag3Desce1
j fimVerificaSePodeApertarBotao3Desce1
ligaFlag3Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce1
fimVerificaSePodeApertarBotao3Desce1:
jr $ra

verificaSePodeApertarBotao4Desce1:
lw $t0, 0x100139A4
lw $t1, limao
beq $t0, $t1, ligaFlag4Desce1
j fimVerificaSePodeApertarBotao4Desce1
ligaFlag4Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce1
fimVerificaSePodeApertarBotao4Desce1:
jr $ra

verificaSePodeApertarBotao1Desce2:
lw $t0, 0x1001392C
lw $t1, ciano
beq $t0, $t1, ligaFlag1Desce2
j fimVerificaSePodeApertarBotao2Desce2
ligaFlag1Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce2
fimVerificaSePodeApertarBotao1Desce2:
jr $ra

verificaSePodeApertarBotao2Desce2:
lw $t0, 0x10013954
lw $t1, ciano
beq $t0, $t1, ligaFlag2Desce2
j fimVerificaSePodeApertarBotao2Desce2
ligaFlag2Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce2
fimVerificaSePodeApertarBotao2Desce2:
jr $ra

verificaSePodeApertarBotao3Desce2:
lw $t0, 0x1001397C
lw $t1, ciano
beq $t0, $t1, ligaFlag3Desce2
j fimVerificaSePodeApertarBotao3Desce2
ligaFlag3Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce2
fimVerificaSePodeApertarBotao3Desce2:
jr $ra

verificaSePodeApertarBotao4Desce2:
lw $t0, 0x100139A4
lw $t1, ciano
beq $t0, $t1, ligaFlag4Desce2
j fimVerificaSePodeApertarBotao4Desce2
ligaFlag4Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce2
fimVerificaSePodeApertarBotao4Desce2:
jr $ra

verificaSePodeApertarBotao1Desce3:
lw $t0, 0x1001392C
lw $t1, roxo
beq $t0, $t1, ligaFlag1Desce3
j fimVerificaSePodeApertarBotao1Desce3
ligaFlag1Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce3
fimVerificaSePodeApertarBotao1Desce3:
jr $ra

verificaSePodeApertarBotao2Desce3:
lw $t0, 0x10013954
lw $t1, roxo
beq $t0, $t1, ligaFlag2Desce3
j fimVerificaSePodeApertarBotao2Desce3
ligaFlag2Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce3
fimVerificaSePodeApertarBotao2Desce3:
jr $ra

verificaSePodeApertarBotao3Desce3:
lw $t0, 0x1001397C
lw $t1, roxo
beq $t0, $t1, ligaFlag3Desce3
j fimVerificaSePodeApertarBotao3Desce3
ligaFlag3Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce3
fimVerificaSePodeApertarBotao3Desce3:
jr $ra

verificaSePodeApertarBotao4Desce3:
lw $t0, 0x100139A4
lw $t1, roxo
beq $t0, $t1, ligaFlag4Desce3
j fimVerificaSePodeApertarBotao4Desce3
ligaFlag4Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce3
fimVerificaSePodeApertarBotao4Desce3:
jr $ra

verificaSePodeApertarBotao1Desce4:
lw $t0, 0x1001392C
lw $t1, magenta
beq $t0, $t1, ligaFlag1Desce4
j fimVerificaSePodeApertarBotao4Desce4
ligaFlag1Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce4
fimVerificaSePodeApertarBotao1Desce4:
jr $ra

verificaSePodeApertarBotao2Desce4:
lw $t0, 0x10013954
lw $t1, magenta
beq $t0, $t1, ligaFlag2Desce4
j fimVerificaSePodeApertarBotao2Desce4
ligaFlag2Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce4
fimVerificaSePodeApertarBotao2Desce4:
jr $ra

verificaSePodeApertarBotao3Desce4:
lw $t0, 0x1001397C
lw $t1, magenta
beq $t0, $t1, ligaFlag3Desce4
j fimVerificaSePodeApertarBotao3Desce4
ligaFlag3Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce4
fimVerificaSePodeApertarBotao3Desce4:
jr $ra

verificaSePodeApertarBotao4Desce4:
lw $t0, 0x100139A4
lw $t1, magenta
beq $t0, $t1, ligaFlag4Desce4
j fimVerificaSePodeApertarBotao4Desce4
ligaFlag4Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce4
fimVerificaSePodeApertarBotao4Desce4:
jr $ra

#NOVA FUN��O	     PROBLEMA: as flags dos botoes atuais resetam s� o desce 1, teria que fazer flags pro desce2, 3 e 4
verificaSeApertouBotoesDesce1:
lw $t0, flagBotao1Desce1#flagBotao1Desce1
lw $t1, flagBotao2Desce1
lw $t2, flagBotao3Desce1
lw $t3, flagBotao4Desce1
lw $t4, 0xFFFF0004
beq $t0, 1, verificaSeApertouBotao1Desce1#se apertou na hora certa, reseta a tecla
beq $t1, 1, verificaSeApertouBotao2Desce1
beq $t2, 1, verificaSeApertouBotao3Desce1
beq $t3, 1, verificaSeApertouBotao4Desce1
fimVerificaSeApertouBotoesDesce1:
jr $ra

verificaSeApertouBotao1Desce1:
beq $t4, 97, resetaBotaoApertado1Desce1
j fimVerificaSeApertouBotoesDesce1
verificaSeApertouBotao2Desce1:
beq $t4, 100, resetaBotaoApertado2Desce1
j fimVerificaSeApertouBotoesDesce1
verificaSeApertouBotao3Desce1:
beq $t4, 106, resetaBotaoApertado3Desce1
j fimVerificaSeApertouBotoesDesce1
verificaSeApertouBotao4Desce1:
beq $t4, 108, resetaBotaoApertado4Desce1
j fimVerificaSeApertouBotoesDesce1

resetaBotaoApertado1Desce1:
sw $zero, 0xFFFF0004
sw $zero, flagBotao1Desce1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao1Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce1
resetaBotaoApertado2Desce1:
sw $zero, 0xFFFF0004
sw $zero, flagBotao2Desce1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao2Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce1
resetaBotaoApertado3Desce1:
sw $zero, 0xFFFF0004
sw $zero, flagBotao3Desce1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao3Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce1
resetaBotaoApertado4Desce1:
sw $zero, 0xFFFF0004
sw $zero, flagBotao4Desce1
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao4Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce1

resetaDesce1:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce1
#jal chamanumeroaleatorio e recoloca desce1, e repinta botao1
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
j fimVerificaSeApertouBotoesDesce1
#2
verificaSeApertouBotoesDesce2:
lw $t0, flagBotao1Desce2
lw $t1, flagBotao2Desce2
lw $t2, flagBotao3Desce2
lw $t3, flagBotao4Desce2
lw $t4, 0xFFFF0004
beq $t0, 1, verificaSeApertouBotao1Desce2
beq $t1, 1, verificaSeApertouBotao2Desce2
beq $t2, 1, verificaSeApertouBotao3Desce2
beq $t3, 1, verificaSeApertouBotao4Desce2
fimVerificaSeApertouBotoesDesce2:
jr $ra

verificaSeApertouBotao1Desce2:
beq $t4, 97, resetaBotaoApertado1Desce2
j fimVerificaSeApertouBotoesDesce2
verificaSeApertouBotao2Desce2:
beq $t4, 100, resetaBotaoApertado2Desce2
j fimVerificaSeApertouBotoesDesce2
verificaSeApertouBotao3Desce2:
beq $t4, 106, resetaBotaoApertado3Desce2
j fimVerificaSeApertouBotoesDesce2
verificaSeApertouBotao4Desce2:
beq $t4, 108, resetaBotaoApertado4Desce2
j fimVerificaSeApertouBotoesDesce2

resetaBotaoApertado1Desce2:
sw $zero, 0xFFFF0004
sw $zero, flagBotao1Desce2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao1Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce2
resetaBotaoApertado2Desce2:
sw $zero, 0xFFFF0004
sw $zero, flagBotao2Desce2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao2Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce2
resetaBotaoApertado3Desce2:
sw $zero, 0xFFFF0004
sw $zero, flagBotao3Desce2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao3Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce2
resetaBotaoApertado4Desce2:
sw $zero, 0xFFFF0004
sw $zero, flagBotao4Desce2
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao4Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce2

resetaDesce2:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce2
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
j fimVerificaSeApertouBotoesDesce2

#3
verificaSeApertouBotoesDesce3:
lw $t0, flagBotao1Desce3
lw $t1, flagBotao2Desce3
lw $t2, flagBotao3Desce3
lw $t3, flagBotao4Desce3
lw $t4, 0xFFFF0004
beq $t0, 1, verificaSeApertouBotao1Desce3
beq $t1, 1, verificaSeApertouBotao2Desce3
beq $t2, 1, verificaSeApertouBotao3Desce3
beq $t3, 1, verificaSeApertouBotao4Desce3
fimVerificaSeApertouBotoesDesce3:
jr $ra

verificaSeApertouBotao1Desce3:
beq $t4, 97, resetaBotaoApertado1Desce3
j fimVerificaSeApertouBotoesDesce3
verificaSeApertouBotao2Desce3:
beq $t4, 100, resetaBotaoApertado2Desce3
j fimVerificaSeApertouBotoesDesce3
verificaSeApertouBotao3Desce3:
beq $t4, 106, resetaBotaoApertado3Desce3
j fimVerificaSeApertouBotoesDesce3
verificaSeApertouBotao4Desce3:
beq $t4, 108, resetaBotaoApertado4Desce3
j fimVerificaSeApertouBotoesDesce3

resetaBotaoApertado1Desce3:
sw $zero, 0xFFFF0004
sw $zero, flagBotao1Desce3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao1Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce3
resetaBotaoApertado2Desce3:
sw $zero, 0xFFFF0004
sw $zero, flagBotao2Desce3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao2Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce3
resetaBotaoApertado3Desce3:
sw $zero, 0xFFFF0004
sw $zero, flagBotao3Desce3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao3Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce3
resetaBotaoApertado4Desce3:
sw $zero, 0xFFFF0004
sw $zero, flagBotao4Desce3
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao4Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce3

resetaDesce3:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce3
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
j fimVerificaSeApertouBotoesDesce3
#4
verificaSeApertouBotoesDesce4:
lw $t0, flagBotao1Desce4
lw $t1, flagBotao2Desce4
lw $t2, flagBotao3Desce4
lw $t3, flagBotao4Desce4
lw $t4, 0xFFFF0004
beq $t0, 1, verificaSeApertouBotao1Desce4
beq $t1, 1, verificaSeApertouBotao2Desce4
beq $t2, 1, verificaSeApertouBotao3Desce4
beq $t3, 1, verificaSeApertouBotao4Desce4
fimVerificaSeApertouBotoesDesce4:
jr $ra

verificaSeApertouBotao1Desce4:
beq $t4, 97, resetaBotaoApertado1Desce4
j fimVerificaSeApertouBotoesDesce4
verificaSeApertouBotao2Desce4:
beq $t4, 100, resetaBotaoApertado2Desce4
j fimVerificaSeApertouBotoesDesce4
verificaSeApertouBotao3Desce4:
beq $t4, 106, resetaBotaoApertado3Desce4
j fimVerificaSeApertouBotoesDesce4
verificaSeApertouBotao4Desce4:
beq $t4, 108, resetaBotaoApertado4Desce4
j fimVerificaSeApertouBotoesDesce4

resetaBotaoApertado1Desce4:
sw $zero, 0xFFFF0004
sw $zero, flagBotao1Desce4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao1Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce4
resetaBotaoApertado2Desce4:
sw $zero, 0xFFFF0004
sw $zero, flagBotao2Desce4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao2Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce4
resetaBotaoApertado3Desce4:
sw $zero, 0xFFFF0004
sw $zero, flagBotao3Desce4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao3Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce4
resetaBotaoApertado4Desce4:
sw $zero, 0xFFFF0004
sw $zero, flagBotao4Desce4
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotao4Player1
addi $sp, $sp, 4
lw $ra, 0($sp) 
j resetaDesce4

resetaDesce4:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal aleatorizaDesce4
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
j fimVerificaSeApertouBotoesDesce4

#apertou fora da hora
apertouForaDaHoraDesce1:
lw $t0, flagBotao1Desce1
lw $t1, flagBotao2Desce1
lw $t2, flagBotao3Desce1
lw $t3, flagBotao4Desce1
lw $t4, 0xFFFF0004        # talvez tivesse que fazer um save de letras pra cada desce
beq $t0, 1, saiApertouForaDaHoraDesce1
beq $t1, 1, saiApertouForaDaHoraDesce1
beq $t2, 1, saiApertouForaDaHoraDesce1
beq $t3, 1, saiApertouForaDaHoraDesce1
bne $t4, 0, gameOver
saiApertouForaDaHoraDesce1:
jr $ra
# n�o d� game over quando aperta o bot�o do desce1 provavelmente porque ele reseta a letra antes de verificar os outros desce
apertouForaDaHoraDesce2:
lw $t0, flagBotao1Desce2
lw $t1, flagBotao2Desce2
lw $t2, flagBotao3Desce2
lw $t3, flagBotao4Desce2
lw $t4, 0xFFFF0004
beq $t0, 1, saiApertouForaDaHoraDesce2
beq $t1, 1, saiApertouForaDaHoraDesce2
beq $t2, 1, saiApertouForaDaHoraDesce2
beq $t3, 1, saiApertouForaDaHoraDesce2
bne $t4, 0, gameOver
saiApertouForaDaHoraDesce2:
jr $ra

apertouForaDaHoraDesce3:
lw $t0, flagBotao1Desce3
lw $t1, flagBotao2Desce3
lw $t2, flagBotao3Desce3
lw $t3, flagBotao4Desce3
lw $t4, 0xFFFF0004
beq $t0, 1, saiApertouForaDaHoraDesce3
beq $t1, 1, saiApertouForaDaHoraDesce3
beq $t2, 1, saiApertouForaDaHoraDesce3
beq $t3, 1, saiApertouForaDaHoraDesce3
bne $t4, 0, gameOver
saiApertouForaDaHoraDesce3:
jr $ra

apertouForaDaHoraDesce4:
lw $t0, flagBotao1Desce4
lw $t1, flagBotao2Desce4
lw $t2, flagBotao3Desce4
lw $t3, flagBotao4Desce4
lw $t4, 0xFFFF0004
beq $t0, 1, saiApertouForaDaHoraDesce4
beq $t1, 1, saiApertouForaDaHoraDesce4
beq $t2, 1, saiApertouForaDaHoraDesce4
beq $t3, 1, saiApertouForaDaHoraDesce4
bne $t4, 0, gameOver
saiApertouForaDaHoraDesce4:
jr $ra

#verifica se passou botoes
verificaSePassouBotao1Desce1:
lw $t0, 0x10013D2C
lw $t1, limao
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao2Desce1:
lw $t0, 0x10013D54
lw $t1, limao
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao3Desce1:
lw $t0, 0x10013D7C
lw $t1, limao
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao4Desce1:
lw $t0, 0x10013DA4
lw $t1, limao
beq $t0, $t1, gameOver
jr $ra

#2
verificaSePassouBotao1Desce2:
lw $t0, 0x10013D2C
lw $t1, ciano
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao2Desce2:
lw $t0, 0x10013D54
lw $t1, ciano
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao3Desce2:
lw $t0, 0x10013D7C
lw $t1, ciano
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao4Desce2:
lw $t0, 0x10013DA4
lw $t1, ciano
beq $t0, $t1, gameOver
jr $ra

#3
verificaSePassouBotao1Desce3:
lw $t0, 0x10013D2C
lw $t1, roxo
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao2Desce3:
lw $t0, 0x10013D54
lw $t1, roxo
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao3Desce3:
lw $t0, 0x10013D7C
lw $t1, roxo
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao4Desce3:
lw $t0, 0x10013DA4
lw $t1, roxo
beq $t0, $t1, gameOver
jr $ra

#4
verificaSePassouBotao1Desce4:
lw $t0, 0x10013D2C
lw $t1, magenta
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao2Desce4:
lw $t0, 0x10013D54
lw $t1, magenta
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao3Desce4:
lw $t0, 0x10013D7C
lw $t1, magenta
beq $t0, $t1, gameOver
jr $ra

verificaSePassouBotao4Desce4:
lw $t0, 0x10013DA4
lw $t1, magenta
beq $t0, $t1, gameOver
jr $ra

#atrasa o jogo
sleep:
ori $v0, $zero, 32
lw $a0, velocidade 
syscall
jr $ra

aumentaVelocidade:
lw $t0, velocidade
addi $t0, $t0, -1
sw $t0, velocidade
jr $ra

gameOver:
addi $sp, $sp, 4
lw $ra, 0($sp)
#print voce perdeu
j exit
#j desejaReiniciar? se sim, pula pro come�o e chama todas as fun��es do come�o do c�digo denovo

exit:
ori $v0, $zero, 10
syscall
