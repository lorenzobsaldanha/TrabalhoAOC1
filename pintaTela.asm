# Configurações do bitmap display: 8, 8, 512, 512
.data
pixels:.space 16384 #espaço total dos pixels
fraseInicio: .asciiz " Boas vindas ao Mips Tiles!\n Escolher opcoes: W  S\n Selecionar: ESPACO\n"
fraseControles: .asciiz "\n Controles do jogo:  A  D  J  L  (minúsculas)\n Botão 1: A\n Botão 2: D\n Botão 3: J\n Botão 4: L\n"
fraseGameOver: .asciiz "-------------------- FIM DE JOGO --------------------\n"
velocidade: .word 150 # tempo de atraso do jogo em milisegundos
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
flagEscolheInicio: .word 0
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
flagBotao1Desce1: .word 0
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

.text            
jal printaFraseInicio
jal pintaTela

pintaTelaInicio:
sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaTela
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaMipsTiles
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotaoJogar
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotaoSair
addi $sp, $sp, 4
lw $ra, 0($sp)



sw $ra, 0($sp)
addi $sp, $sp, -4
jal selecionaBotaoJogar
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal escolheJogar
addi $sp, $sp, 4
lw $ra, 0($sp)
  
inicio:
addi $sp, $sp, 4
lw $ra, 0($sp)

jal printaFraseControles
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

#COMECA AQUI AS ANIMAÇÕES
desceTeclas: 
jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce1
jal sleep

jal apertouForaDaHora
jal desce2
jal sleep

#desce2
jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal sleep

jal apertouForaDaHora
jal desce3
jal sleep

#desce3
jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce1
jal desce2
jal desce3
jal sleep

jal apertouForaDaHora
jal desce4
jal sleep

loopDesceTeclas: 

jal desce1
jal desce2
jal desce3
jal desce4


# VERIFICAÇÕES:

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

#verifica se apertou errado
sw $ra, 0($sp)
addi $sp, $sp, -4
jal apertouForaDaHora
addi $sp, $sp, 4
lw $ra, 0($sp) 


#atrasa a decida da tecla

jal sleep

j loopDesceTeclas # j loop
jal exit # não vai chegar nessa linha, mas tá aqui só por precaução

#          TERMINA DESCE TECLAS AQUI, EMBAIXO DISSO SÃO O CORPO DAS FUNÇÕES
#CORPO DAS FUNCOES DA TELA INICIAL:

pintaMipsTiles:
lw $t0, branco
lw $t1, corDoFundo
#M
lw $t0, vermelho
li $s0, 0x10010720
sw $t0, 0x00000000($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000800($s0)
sw $t0, 0x00000900($s0)
sw $t0, 0x00000A00($s0)

sw $t0, 0x00000004($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000304($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000504($s0)
sw $t0, 0x00000604($s0)
sw $t0, 0x00000704($s0)
sw $t0, 0x00000804($s0)
sw $t0, 0x00000904($s0)
sw $t0, 0x00000A04($s0)

sw $t0, 0x00000108($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)
sw $t0, 0x00000408($s0)

sw $t0, 0x0000030C($s0)
sw $t0, 0x0000040C($s0)
sw $t0, 0x0000050C($s0)
sw $t0, 0x0000060C($s0)

sw $t0, 0x00000510($s0)
sw $t0, 0x00000610($s0)
sw $t0, 0x00000710($s0)
sw $t0, 0x00000810($s0)

sw $t0, 0x00000514($s0)
sw $t0, 0x00000614($s0)
sw $t0, 0x00000714($s0)
sw $t0, 0x00000814($s0)

sw $t0, 0x00000318($s0)
sw $t0, 0x00000418($s0)
sw $t0, 0x00000518($s0)
sw $t0, 0x00000618($s0)

sw $t0, 0x0000011C($s0)
sw $t0, 0x0000021C($s0)
sw $t0, 0x0000031C($s0)
sw $t0, 0x0000041C($s0)

sw $t0, 0x00000020($s0)
sw $t0, 0x00000120($s0)
sw $t0, 0x00000220($s0)
sw $t0, 0x00000320($s0)
sw $t0, 0x00000420($s0)
sw $t0, 0x00000520($s0)
sw $t0, 0x00000620($s0)
sw $t0, 0x00000720($s0)
sw $t0, 0x00000820($s0)
sw $t0, 0x00000920($s0)
sw $t0, 0x00000A20($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000124($s0)
sw $t0, 0x00000224($s0)
sw $t0, 0x00000324($s0)
sw $t0, 0x00000424($s0)
sw $t0, 0x00000524($s0)
sw $t0, 0x00000624($s0)
sw $t0, 0x00000724($s0)
sw $t0, 0x00000824($s0)
sw $t0, 0x00000924($s0)
sw $t0, 0x00000A24($s0)

#I
lw $t0, amarelo
li $s0, 0x10010750
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000110($s0)
sw $t0, 0x00000210($s0)
sw $t0, 0x00000310($s0)
sw $t0, 0x00000410($s0)
sw $t0, 0x00000510($s0)
sw $t0, 0x00000610($s0)
sw $t0, 0x00000710($s0)
sw $t0, 0x00000810($s0)
sw $t0, 0x00000910($s0)
sw $t0, 0x00000A10($s0)

sw $t0, 0x00000114($s0)
sw $t0, 0x00000214($s0)
sw $t0, 0x00000314($s0)
sw $t0, 0x00000414($s0)
sw $t0, 0x00000514($s0)
sw $t0, 0x00000614($s0)
sw $t0, 0x00000714($s0)
sw $t0, 0x00000814($s0)
sw $t0, 0x00000914($s0)
sw $t0, 0x00000A14($s0)

sw $t0, 0x00000A00($s0)
sw $t0, 0x00000A04($s0)
sw $t0, 0x00000A08($s0)
sw $t0, 0x00000A0C($s0)
sw $t0, 0x00000A10($s0)
sw $t0, 0x00000A14($s0)
sw $t0, 0x00000A18($s0)
sw $t0, 0x00000A1C($s0)
sw $t0, 0x00000A20($s0)
sw $t0, 0x00000A24($s0)


#P
lw $t0, azul
li $s0, 0x10010780
sw $t0, 0x000000000($s0)
sw $t0, 0x000000100($s0)
sw $t0, 0x000000200($s0)
sw $t0, 0x000000300($s0)
sw $t0, 0x000000400($s0)
sw $t0, 0x000000500($s0)
sw $t0, 0x000000600($s0)
sw $t0, 0x000000700($s0)
sw $t0, 0x000000800($s0)
sw $t0, 0x000000900($s0)
sw $t0, 0x000000A00($s0)
sw $t0, 0x000000004($s0)
sw $t0, 0x000000104($s0)
sw $t0, 0x000000204($s0)
sw $t0, 0x000000304($s0)
sw $t0, 0x000000404($s0)
sw $t0, 0x000000504($s0)
sw $t0, 0x000000604($s0)
sw $t0, 0x000000704($s0)
sw $t0, 0x000000804($s0)
sw $t0, 0x000000904($s0)
sw $t0, 0x000000A04($s0)

sw $t0, 0x000000008($s0)
sw $t0, 0x00000000C($s0)
sw $t0, 0x000000010($s0)
sw $t0, 0x000000014($s0)
sw $t0, 0x000000018($s0)
sw $t0, 0x000000118($s0)
sw $t0, 0x00000011C($s0)
sw $t0, 0x00000021C($s0)
sw $t0, 0x000000220($s0)
sw $t0, 0x00000031C($s0)
sw $t0, 0x000000320($s0)
sw $t0, 0x000000418($s0)
sw $t0, 0x00000041C($s0)
sw $t0, 0x000000508($s0)
sw $t0, 0x00000050C($s0)
sw $t0, 0x000000510($s0)
sw $t0, 0x000000514($s0)
sw $t0, 0x000000518($s0)

#S
lw $t0, verde
li $s0, 0x100107AC
sw $t0, 0x000000008($s0)
sw $t0, 0x00000000C($s0)
sw $t0, 0x000000010($s0)
sw $t0, 0x000000014($s0)
sw $t0, 0x000000018($s0)
sw $t0, 0x00000001C($s0)
sw $t0, 0x000000104($s0)
sw $t0, 0x000000108($s0)
sw $t0, 0x00000011C($s0)
sw $t0, 0x000000120($s0)
sw $t0, 0x000000220($s0)
sw $t0, 0x000000224($s0)
sw $t0, 0x000000200($s0)
sw $t0, 0x000000204($s0)
sw $t0, 0x000000300($s0)
sw $t0, 0x000000304($s0)
sw $t0, 0x000000404($s0)
sw $t0, 0x000000408($s0)
sw $t0, 0x000000508($s0)
sw $t0, 0x00000050C($s0)
sw $t0, 0x000000510($s0)
sw $t0, 0x000000514($s0)
sw $t0, 0x000000518($s0)
sw $t0, 0x00000051C($s0)
sw $t0, 0x00000061C($s0)
sw $t0, 0x000000620($s0)
sw $t0, 0x000000720($s0)
sw $t0, 0x000000724($s0)
sw $t0, 0x000000820($s0)
sw $t0, 0x000000824($s0)
sw $t0, 0x000000920($s0)
sw $t0, 0x00000091C($s0)
sw $t0, 0x000000904($s0)
sw $t0, 0x000000908($s0)
sw $t0, 0x000000800($s0)
sw $t0, 0x000000804($s0)

sw $t0, 0x000000A08($s0)
sw $t0, 0x000000A0C($s0)
sw $t0, 0x000000A10($s0)
sw $t0, 0x000000A14($s0)
sw $t0, 0x000000A18($s0)
sw $t0, 0x000000A1C($s0)

#T
lw $t0, limao
li $s0, 0x1001160C
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000110($s0)
sw $t0, 0x00000210($s0)
sw $t0, 0x00000310($s0)
sw $t0, 0x00000410($s0)
sw $t0, 0x00000510($s0)
sw $t0, 0x00000610($s0)
sw $t0, 0x00000710($s0)
sw $t0, 0x00000810($s0)
sw $t0, 0x00000910($s0)
sw $t0, 0x00000A10($s0)

sw $t0, 0x00000114($s0)
sw $t0, 0x00000214($s0)
sw $t0, 0x00000314($s0)
sw $t0, 0x00000414($s0)
sw $t0, 0x00000514($s0)
sw $t0, 0x00000614($s0)
sw $t0, 0x00000714($s0)
sw $t0, 0x00000814($s0)
sw $t0, 0x00000914($s0)
sw $t0, 0x00000A14($s0)

#I
lw $t0, ciano
li $s0, 0x1001163C
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000110($s0)
sw $t0, 0x00000210($s0)
sw $t0, 0x00000310($s0)
sw $t0, 0x00000410($s0)
sw $t0, 0x00000510($s0)
sw $t0, 0x00000610($s0)
sw $t0, 0x00000710($s0)
sw $t0, 0x00000810($s0)
sw $t0, 0x00000910($s0)
sw $t0, 0x00000A10($s0)

sw $t0, 0x00000114($s0)
sw $t0, 0x00000214($s0)
sw $t0, 0x00000314($s0)
sw $t0, 0x00000414($s0)
sw $t0, 0x00000514($s0)
sw $t0, 0x00000614($s0)
sw $t0, 0x00000714($s0)
sw $t0, 0x00000814($s0)
sw $t0, 0x00000914($s0)
sw $t0, 0x00000A14($s0)

sw $t0, 0x00000A00($s0)
sw $t0, 0x00000A04($s0)
sw $t0, 0x00000A08($s0)
sw $t0, 0x00000A0C($s0)
sw $t0, 0x00000A10($s0)
sw $t0, 0x00000A14($s0)
sw $t0, 0x00000A18($s0)
sw $t0, 0x00000A1C($s0)
sw $t0, 0x00000A20($s0)
sw $t0, 0x00000A24($s0)

#L
lw $t0, roxo
li $s0, 0x1001166C
sw $t0, 0x00000000($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000800($s0)
sw $t0, 0x00000900($s0)
sw $t0, 0x00000A00($s0)

sw $t0, 0x00000004($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000304($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000504($s0)
sw $t0, 0x00000604($s0)
sw $t0, 0x00000704($s0)
sw $t0, 0x00000804($s0)
sw $t0, 0x00000904($s0)
sw $t0, 0x00000A04($s0)

sw $t0, 0x00000A08($s0)
sw $t0, 0x00000A0C($s0)
sw $t0, 0x00000A10($s0)
sw $t0, 0x00000A14($s0)
sw $t0, 0x00000A18($s0)
sw $t0, 0x00000A1C($s0)
sw $t0, 0x00000A20($s0)
sw $t0, 0x00000A24($s0) 

#E
lw $t0, magenta
li $s0, 0x1001169C
sw $t0, 0x00000000($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000800($s0)
sw $t0, 0x00000900($s0)
sw $t0, 0x00000A00($s0)

sw $t0, 0x00000004($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000304($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000504($s0)
sw $t0, 0x00000604($s0)
sw $t0, 0x00000704($s0)
sw $t0, 0x00000804($s0)
sw $t0, 0x00000904($s0)
sw $t0, 0x00000A04($s0)

sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)

sw $t0, 0x00000508($s0)
sw $t0, 0x0000050C($s0)
sw $t0, 0x00000510($s0)
sw $t0, 0x00000514($s0)
sw $t0, 0x00000518($s0)
sw $t0, 0x0000051C($s0)

sw $t0, 0x00000A08($s0)
sw $t0, 0x00000A0C($s0)
sw $t0, 0x00000A10($s0)
sw $t0, 0x00000A14($s0)
sw $t0, 0x00000A18($s0)
sw $t0, 0x00000A1C($s0)
sw $t0, 0x00000A20($s0)
sw $t0, 0x00000A24($s0) 

#S
lw $t0, laranja
li $s0, 0x100116CC
sw $t0, 0x000000008($s0)
sw $t0, 0x00000000C($s0)
sw $t0, 0x000000010($s0)
sw $t0, 0x000000014($s0)
sw $t0, 0x000000018($s0)
sw $t0, 0x00000001C($s0)
sw $t0, 0x000000104($s0)
sw $t0, 0x000000108($s0)
sw $t0, 0x00000011C($s0)
sw $t0, 0x000000120($s0)
sw $t0, 0x000000220($s0)
sw $t0, 0x000000224($s0)
sw $t0, 0x000000200($s0)
sw $t0, 0x000000204($s0)
sw $t0, 0x000000300($s0)
sw $t0, 0x000000304($s0)
sw $t0, 0x000000404($s0)
sw $t0, 0x000000408($s0)
sw $t0, 0x000000508($s0)
sw $t0, 0x00000050C($s0)
sw $t0, 0x000000510($s0)
sw $t0, 0x000000514($s0)
sw $t0, 0x000000518($s0)
sw $t0, 0x00000051C($s0)
sw $t0, 0x00000061C($s0)
sw $t0, 0x000000620($s0)
sw $t0, 0x000000720($s0)
sw $t0, 0x000000724($s0)
sw $t0, 0x000000820($s0)
sw $t0, 0x000000824($s0)
sw $t0, 0x000000920($s0)
sw $t0, 0x00000091C($s0)
sw $t0, 0x000000904($s0)
sw $t0, 0x000000908($s0)
sw $t0, 0x000000800($s0)
sw $t0, 0x000000804($s0)

sw $t0, 0x000000A08($s0)
sw $t0, 0x000000A0C($s0)
sw $t0, 0x000000A10($s0)
sw $t0, 0x000000A14($s0)
sw $t0, 0x000000A18($s0)
sw $t0, 0x000000A1C($s0)
jr $ra

pintaBotaoJogar:
#borda do botao:
lw $t0, branco
li $s0, 0x10012850
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)

sw $t0, 0x00000100($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000704($s0)

sw $t0, 0x00000154($s0)
sw $t0, 0x00000158($s0)
sw $t0, 0x00000258($s0)
sw $t0, 0x00000358($s0)
sw $t0, 0x00000458($s0)
sw $t0, 0x00000558($s0)
sw $t0, 0x00000658($s0)
sw $t0, 0x00000758($s0)

li $s0, 0x10013050
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)

li $s0, 0x10012FA4
sw $t0, 0x00000000($s0)
#J
li $s0, 0x10012A58
sw $t0, 0x00000008($s0)
sw $t0, 0x00000108($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000404($s0)
#O
li $s0, 0x10012A68
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000108($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)
#G
li $s0, 0x10012A78
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)

#A
li $s0, 0x10012A88
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000108($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)

#R
li $s0, 0x10012A98
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000108($s0)
sw $t0, 0x00000308($s0)

jr $ra

pintaBotaoSair:
#borda do botao:
lw $t0, branco
li $s0, 0x10013450
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)

sw $t0, 0x00000100($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000704($s0)

sw $t0, 0x00000154($s0)
sw $t0, 0x00000158($s0)
sw $t0, 0x00000258($s0)
sw $t0, 0x00000358($s0)
sw $t0, 0x00000458($s0)
sw $t0, 0x00000558($s0)
sw $t0, 0x00000658($s0)
sw $t0, 0x00000758($s0)
sw $t0, 0x00000754($s0)

li $s0, 0x10013C50
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)

#S
li $s0, 0x10013660
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)
#A
li $s0, 0x10013670
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000108($s0)
sw $t0, 0x00000208($s0)
sw $t0, 0x00000308($s0)
#I
li $s0, 0x10013680
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000304($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000404($s0)
sw $t0, 0x00000408($s0)

#R
li $s0, 0x10013690
sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x00000100($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000204($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000408($s0)
sw $t0, 0x00000108($s0)
sw $t0, 0x00000308($s0)

jr $ra

selecionaBotaoJogar:
lw $t0, laranja
li $s0, 0x10012850
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)

sw $t0, 0x00000100($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000704($s0)

sw $t0, 0x00000154($s0)
sw $t0, 0x00000158($s0)
sw $t0, 0x00000258($s0)
sw $t0, 0x00000358($s0)
sw $t0, 0x00000458($s0)
sw $t0, 0x00000558($s0)
sw $t0, 0x00000658($s0)
sw $t0, 0x00000754($s0)
sw $t0, 0x00000758($s0)

li $s0, 0x10013050
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)
jr $ra

selecionaBotaoSair:
lw $t0, laranja
li $s0, 0x10013450
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)

sw $t0, 0x00000100($s0)
sw $t0, 0x00000104($s0)
sw $t0, 0x00000200($s0)
sw $t0, 0x00000300($s0)
sw $t0, 0x00000400($s0)
sw $t0, 0x00000500($s0)
sw $t0, 0x00000600($s0)
sw $t0, 0x00000700($s0)
sw $t0, 0x00000704($s0)

sw $t0, 0x00000154($s0)
sw $t0, 0x00000158($s0)
sw $t0, 0x00000258($s0)
sw $t0, 0x00000358($s0)
sw $t0, 0x00000458($s0)
sw $t0, 0x00000558($s0)
sw $t0, 0x00000658($s0)
sw $t0, 0x00000758($s0)
sw $t0, 0x00000754($s0)

li $s0, 0x10013C50
#sw $t0, 0x00000000($s0)
sw $t0, 0x00000004($s0)
sw $t0, 0x00000008($s0)
sw $t0, 0x0000000C($s0)
sw $t0, 0x00000010($s0)
sw $t0, 0x00000014($s0)
sw $t0, 0x00000018($s0)
sw $t0, 0x0000001C($s0)
sw $t0, 0x00000020($s0)
sw $t0, 0x00000024($s0)
sw $t0, 0x00000028($s0)
sw $t0, 0x0000002C($s0)
sw $t0, 0x00000030($s0)
sw $t0, 0x00000034($s0)
sw $t0, 0x00000038($s0)
sw $t0, 0x0000003C($s0)
sw $t0, 0x00000040($s0)
sw $t0, 0x00000044($s0)
sw $t0, 0x00000048($s0)
sw $t0, 0x0000004C($s0)
sw $t0, 0x00000050($s0)
sw $t0, 0x00000054($s0)
jr $ra

escolheJogar:
ori $t1, $zero, 0
sw $t1, 0xFFFF0004
ori $t1, $zero, 0
sw $t1, flagEscolheInicio
sw $ra, 0($sp)
addi $sp, $sp, -4
jal selecionaBotaoJogar
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotaoSair
addi $sp, $sp, 4
lw $ra, 0($sp)

lw $t1, 0xFFFF0004
beq $t1, 119, escolheSair
beq $t1, 115, escolheSair
beq $t1, 32, verificaEscolhaInicio
j escolheJogar

escolheSair:
ori $t1, $zero, 0
sw $t1, 0xFFFF0004
ori $t1, $zero, 1
sw $t1, flagEscolheInicio
sw $ra, 0($sp)
addi $sp, $sp, -4
jal selecionaBotaoSair
addi $sp, $sp, 4
lw $ra, 0($sp)

sw $ra, 0($sp)
addi $sp, $sp, -4
jal pintaBotaoJogar
addi $sp, $sp, 4
lw $ra, 0($sp)

lw $t1, 0xFFFF0004
beq $t1, 119, escolheJogar
beq $t1, 115, escolheJogar
beq $t1, 32, verificaEscolhaInicio
j escolheSair

verificaEscolhaInicio:
ori $t1, $zero, 0
sw $t1, 0xFFFF0004
lw $t1, flagEscolheInicio
beq $t1, 0, inicio
beq $t1, 1, exit


printaFraseInicio:
la $a0, fraseInicio
ori $v0, $zero, 4
syscall
jr $ra
 #CORPO DAS FUNCOES DO JOGO:




printaFraseControles:
ori $v0, $zero, 4
la $a0, fraseControles
syscall
jr $ra

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


desce1:
lw $t0, limao
lw $t1, corDoFundo
lw $s0, pixel1Desce1
lw $s1, pixel2Desce1
lw $s2, pixel3Desce1
sw $s0, pixel1Temporario
sw $s1, pixel2Temporario
sw $s2, pixel3Temporario
beq $s0, 0x10010A2C, naoPintaFundoPrimeiraPosicaoDesce1 #verifica se vai pintar as primeiras posições das descidas 1, 2, 3 e 4
beq $s0, 0x10010A54, naoPintaFundoPrimeiraPosicaoDesce1
beq $s0, 0x10010A7C, naoPintaFundoPrimeiraPosicaoDesce1
beq $s0, 0x10010AA4, naoPintaFundoPrimeiraPosicaoDesce1
sw $t1, -256($s0)
sw $t1, -256($s1)
sw $t1, -256($s2)
naoPintaFundoPrimeiraPosicaoDesce1:#faz o beq ignorar a pintura da cor do fundo e pintar só de branco aqui
sw $t0, 0($s0) # coloca a cor branca na POSIÇÃO DO PIXEL dentro do buffer de pixels
sw $t0, 0($s1)
sw $t0, 0($s2)

lw $s0, pixel1Temporario 
addi $s0, $s0, 256
sw $s0, pixel1Desce1 # coloca a próxima linha no ENDEREÇO pixel1Desce1, fora do buffer de pixels

lw $s1, pixel2Temporario
addi $s1, $s1, 256
sw $s1, pixel2Desce1

lw $s2, pixel3Temporario 
addi $s2, $s2, 256
sw $s2, pixel3Desce1

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
lw $t0, 0x10013A2C # pode aumentar a área clicável do botão aqui, diminuindo a linha onde a flag de apertar a tecla é ativada
lw $t2, 0x10013B2C
lw $t3, 0x10013C2C
lw $t1, limao
beq $t0, $t1, ligaFlag1Desce1
beq $t2, $t1, ligaFlag1Desce1
beq $t3, $t1, ligaFlag1Desce1
j fimVerificaSePodeApertarBotao1Desce1
ligaFlag1Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce1
fimVerificaSePodeApertarBotao1Desce1:
jr $ra

verificaSePodeApertarBotao2Desce1:
lw $t0, 0x10013A54
lw $t2, 0x10013B54
lw $t3, 0x10013C54
lw $t1, limao
beq $t0, $t1, ligaFlag2Desce1
beq $t2, $t1, ligaFlag2Desce1
beq $t3, $t1, ligaFlag2Desce1
j fimVerificaSePodeApertarBotao2Desce1
ligaFlag2Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce1
fimVerificaSePodeApertarBotao2Desce1:
jr $ra

verificaSePodeApertarBotao3Desce1:
lw $t0, 0x10013A7C
lw $t2, 0x10013B7C
lw $t3, 0x10013C7C
lw $t1, limao
beq $t0, $t1, ligaFlag3Desce1
beq $t2, $t1, ligaFlag3Desce1
beq $t3, $t1, ligaFlag3Desce1
j fimVerificaSePodeApertarBotao3Desce1
ligaFlag3Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce1
fimVerificaSePodeApertarBotao3Desce1:
jr $ra

verificaSePodeApertarBotao4Desce1:
lw $t0, 0x10013AA4
lw $t2, 0x10013BA4
lw $t3, 0x10013CA4
lw $t1, limao
beq $t0, $t1, ligaFlag4Desce1
beq $t2, $t1, ligaFlag4Desce1
beq $t3, $t1, ligaFlag4Desce1
j fimVerificaSePodeApertarBotao4Desce1
ligaFlag4Desce1:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce1
fimVerificaSePodeApertarBotao4Desce1:
jr $ra

verificaSePodeApertarBotao1Desce2:
lw $t0, 0x10013A2C
lw $t2, 0x10013B2C
lw $t3, 0x10013C2C
lw $t1, ciano
beq $t0, $t1, ligaFlag1Desce2
beq $t2, $t1, ligaFlag1Desce2
beq $t3, $t1, ligaFlag1Desce2
j fimVerificaSePodeApertarBotao2Desce2
ligaFlag1Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce2
fimVerificaSePodeApertarBotao1Desce2:
jr $ra

verificaSePodeApertarBotao2Desce2:
lw $t0, 0x10013A54
lw $t2, 0x10013B54
lw $t3, 0x10013C54
lw $t1, ciano
beq $t0, $t1, ligaFlag2Desce2
beq $t2, $t1, ligaFlag2Desce2
beq $t3, $t1, ligaFlag2Desce2
j fimVerificaSePodeApertarBotao2Desce2
ligaFlag2Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce2
fimVerificaSePodeApertarBotao2Desce2:
jr $ra

verificaSePodeApertarBotao3Desce2:
lw $t0, 0x10013A7C
lw $t2, 0x10013B7C
lw $t3, 0x10013C7C
lw $t1, ciano
beq $t0, $t1, ligaFlag3Desce2
beq $t2, $t1, ligaFlag3Desce2
beq $t3, $t1, ligaFlag3Desce2
j fimVerificaSePodeApertarBotao3Desce2
ligaFlag3Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce2
fimVerificaSePodeApertarBotao3Desce2:
jr $ra

verificaSePodeApertarBotao4Desce2:
lw $t0, 0x10013AA4
lw $t2, 0x10013BA4
lw $t3, 0x10013CA4
lw $t1, ciano
beq $t0, $t1, ligaFlag4Desce2
beq $t2, $t1, ligaFlag4Desce2
beq $t3, $t1, ligaFlag4Desce2
j fimVerificaSePodeApertarBotao4Desce2
ligaFlag4Desce2:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce2
fimVerificaSePodeApertarBotao4Desce2:
jr $ra

verificaSePodeApertarBotao1Desce3:
lw $t0, 0x10013A2C
lw $t2, 0x10013B2C
lw $t3, 0x10013C2C
lw $t1, roxo
beq $t0, $t1, ligaFlag1Desce3
beq $t2, $t1, ligaFlag1Desce3
beq $t3, $t1, ligaFlag1Desce3
j fimVerificaSePodeApertarBotao1Desce3
ligaFlag1Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce3
fimVerificaSePodeApertarBotao1Desce3:
jr $ra

verificaSePodeApertarBotao2Desce3:
lw $t0, 0x10013A54
lw $t2, 0x10013B54
lw $t3, 0x10013C54
lw $t1, roxo
beq $t0, $t1, ligaFlag2Desce3
beq $t2, $t1, ligaFlag2Desce3
beq $t3, $t1, ligaFlag2Desce3
j fimVerificaSePodeApertarBotao2Desce3
ligaFlag2Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce3
fimVerificaSePodeApertarBotao2Desce3:
jr $ra

verificaSePodeApertarBotao3Desce3:
lw $t0, 0x10013A7C
lw $t2, 0x10013B7C
lw $t3, 0x10013C7C
lw $t1, roxo
beq $t0, $t1, ligaFlag3Desce3
beq $t2, $t1, ligaFlag3Desce3
beq $t3, $t1, ligaFlag3Desce3
j fimVerificaSePodeApertarBotao3Desce3
ligaFlag3Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce3
fimVerificaSePodeApertarBotao3Desce3:
jr $ra

verificaSePodeApertarBotao4Desce3:
lw $t0, 0x10013AA4
lw $t2, 0x10013BA4
lw $t3, 0x10013CA4
lw $t1, roxo
beq $t0, $t1, ligaFlag4Desce3
beq $t2, $t1, ligaFlag4Desce3
beq $t3, $t1, ligaFlag4Desce3
j fimVerificaSePodeApertarBotao4Desce3
ligaFlag4Desce3:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce3
fimVerificaSePodeApertarBotao4Desce3:
jr $ra

verificaSePodeApertarBotao1Desce4:
lw $t0, 0x10013A2C
lw $t2, 0x10013B2C
lw $t3, 0x10013C2C
lw $t1, magenta
beq $t0, $t1, ligaFlag1Desce4
beq $t2, $t1, ligaFlag1Desce4
beq $t3, $t1, ligaFlag1Desce4
j fimVerificaSePodeApertarBotao4Desce4
ligaFlag1Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao1Desce4
fimVerificaSePodeApertarBotao1Desce4:
jr $ra

verificaSePodeApertarBotao2Desce4:
lw $t0, 0x10013A54
lw $t2, 0x10013B54
lw $t3, 0x10013C54
lw $t1, magenta
beq $t0, $t1, ligaFlag2Desce4
beq $t2, $t1, ligaFlag2Desce4
beq $t3, $t1, ligaFlag2Desce4
j fimVerificaSePodeApertarBotao2Desce4
ligaFlag2Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao2Desce4
fimVerificaSePodeApertarBotao2Desce4:
jr $ra

verificaSePodeApertarBotao3Desce4:
lw $t0, 0x10013A7C
lw $t2, 0x10013B7C
lw $t3, 0x10013C7C
lw $t1, magenta
beq $t0, $t1, ligaFlag3Desce4
beq $t2, $t1, ligaFlag3Desce4
beq $t3, $t1, ligaFlag3Desce4
j fimVerificaSePodeApertarBotao3Desce4
ligaFlag3Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao3Desce4
fimVerificaSePodeApertarBotao3Desce4:
jr $ra

verificaSePodeApertarBotao4Desce4:
lw $t0, 0x10013AA4
lw $t2, 0x10013BA4
lw $t3, 0x10013CA4
lw $t1, magenta
beq $t0, $t1, ligaFlag4Desce4
beq $t2, $t1, ligaFlag4Desce4
beq $t3, $t1, ligaFlag4Desce4
j fimVerificaSePodeApertarBotao4Desce4
ligaFlag4Desce4:
ori $t1, $zero, 1
sw $t1, flagBotao4Desce4
fimVerificaSePodeApertarBotao4Desce4:
jr $ra

#verifica se apertou os botoes
#desce1
verificaSeApertouBotoesDesce1:
lw $t0, flagBotao1Desce1
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

#desce2
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

#desce3
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

#desce4
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
apertouForaDaHora:
#desce1
lw $t0, flagBotao1Desce1
lw $t1, flagBotao2Desce1
lw $t2, flagBotao3Desce1
lw $t3, flagBotao4Desce1
lw $t4, 0xFFFF0004        
beq $t0, 1, saiApertouForaDaHora
beq $t1, 1, saiApertouForaDaHora
beq $t2, 1, saiApertouForaDaHora
beq $t3, 1, saiApertouForaDaHora
#desce2
lw $t0, flagBotao1Desce2
lw $t1, flagBotao2Desce2
lw $t2, flagBotao3Desce2
lw $t3, flagBotao4Desce2
beq $t0, 1, saiApertouForaDaHora
beq $t1, 1, saiApertouForaDaHora
beq $t2, 1, saiApertouForaDaHora
beq $t3, 1, saiApertouForaDaHora
#desce3
lw $t0, flagBotao1Desce3
lw $t1, flagBotao2Desce3
lw $t2, flagBotao3Desce3
lw $t3, flagBotao4Desce3
beq $t0, 1, saiApertouForaDaHora
beq $t1, 1, saiApertouForaDaHora
beq $t2, 1, saiApertouForaDaHora
beq $t3, 1, saiApertouForaDaHora
#desce4
lw $t0, flagBotao1Desce4
lw $t1, flagBotao2Desce4
lw $t2, flagBotao3Desce4
lw $t3, flagBotao4Desce4
beq $t0, 1, saiApertouForaDaHora
beq $t1, 1, saiApertouForaDaHora
beq $t2, 1, saiApertouForaDaHora
beq $t3, 1, saiApertouForaDaHora
bne $t4, 0, gameOver
saiApertouForaDaHora:
jr $ra


#verifica se passou botoes
#desce1
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

#desce2
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

#desce3
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

#desce4
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
addi $t0, $t0, -2
sw $t0, velocidade
jr $ra

gameOver:
addi $sp, $sp, 4
lw $ra, 0($sp)
ori $v0, $zero, 4
la $a0, fraseGameOver
syscall
j exit


exit:
ori $v0, $zero, 10
syscall
