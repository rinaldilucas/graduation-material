algoritmo "Exec2"

var  vet:vetor[1..100] de inteiro
i :inteiro

/////////////////////////////////////////////////////////////////////////////////////////
procedimento pergunta
var n, i, u, y, aux: inteiro

inicio

para i de 1 ate 5 faca
   escreva ("Digite o ",i,"º numero: ")
   leia (vet[i])
fimpara
fimprocedimento

/////////////////////////////////////////////////////////////////////////////////////////
procedimento troca(i,j:inteiro)
var aux: inteiro

inicio
aux <- vet[i]
vet[i] <- vet[j]
vet[j] <- aux
fimprocedimento

/////////////////////////////////////////////////////////////////////////////////////////
inicio
pergunta
troca(4,2)

para i de 1 ate 5 faca
   escreva (vet[i])
fimpara

fimalgoritmo


