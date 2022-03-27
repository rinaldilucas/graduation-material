algoritmo "Exec1"

procedimento ordenarvetor
var
num: vetor [1..100] de inteiro
i,j,n,aux: inteiro

inicio

escreva ("Digite o tamanho do vetor: ")
leia (n)

para i de 1 ate n faca
   escreva ("Digite um numero: ")
   leia (num[i])
fimpara

para i de 1 ate n faca
   para j de 1 ate n faca
      se (num[i]<num[j]) entao
         aux <- num[i]
         num[i] <- num[j]
         num[j] <- aux
      fimse
   fimpara
fimpara

escreva ("Ordem crescente:")

para i de 1 ate n faca
   escreva (num[i])
fimpara
fimprocedimento

inicio

ordenarvetor

fimalgoritmo
