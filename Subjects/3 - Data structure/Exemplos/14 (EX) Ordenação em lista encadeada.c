#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct aluno {
    char nome[81];
    int RA;
    float p1;
    float p2;
    float p3;
    struct aluno *prox;
} Aluno;

Aluno* inserir(Aluno *l, char *nome, int RA, float p1, float p2, float p3) {
    Aluno *aux, *novo, *ant;
    novo = (Aluno *) malloc(sizeof(Aluno));

    aux = l;
    ant = NULL;

    strcpy (novo->nome, nome);
    novo->RA = RA;
    novo->p1 = p1;
    novo->p2 = p2;
    novo->p3 = p3;

    if(aux == NULL) {
        novo->prox = NULL;
        return novo;
    } else {
        while(aux != NULL && aux->RA < (p1+p2+p3)/3) {
            ant = aux;
            aux = aux->prox;
        }
        novo->prox = aux;

        if(ant == NULL) {
            l = novo;
        } else {
            ant->prox = novo;
        }
    }
    return l;
}

void mostraAluno(Aluno *l) {
    Aluno *aux = l;
    while(aux != NULL) {
        printf("| RA: %d | NOME: %s | P1: %.2f | P2: %.2f | P3: %.2f |\n", aux->RA, aux->nome, aux->p1, aux->p2, aux->p3);
        aux = aux->prox;
    }
}

Aluno* retira(Aluno* l, int RA) {
    Aluno *aux = l, *ant = NULL;
    while (aux != NULL && aux->RA != RA) {
        ant = aux;
        aux = aux->prox;
    }
    if (aux == NULL)
        return l;
    if (ant == NULL) {
        l = aux->prox;
        free (aux);
        return l;
    } else {
        ant->prox = aux->prox;
        free(ant);
        return l;
    }
}

int main(void) {

    int RA;
    float p1, p2, p3;
    char nome[81];
    Aluno *l = NULL;
    char opcao = 's';

    while( opcao == 's' || opcao == 'S' ) {
        printf ("Digite o RA do aluno: ");
        scanf ("%d", &RA);
        printf ("Digite o nome do aluno: ");
        setbuf (stdin, NULL);
        scanf("%[^\n]s", nome);
        setbuf (stdin, NULL);
        printf ("Digite a nota 1 do aluno: ");
        scanf ("%f", &p1);
        printf ("Digite a nota 2 do aluno: ");
        scanf ("%f", &p2);
        printf ("Digite a nota 3 do aluno: ");
        scanf ("%f", &p3);

        l = inserir(l, nome, RA, p1, p2, p3);

        printf("\nDeseja inserir outro aluno? (S/N)\n");
        setbuf (stdin, NULL);
        scanf("%c", &opcao);
        setbuf (stdin, NULL);
        printf ("\n");
    }
    mostraAluno(l);

    printf ("\nLista ja com o RA deletado: \n");
    l = retira (l, 333);
    mostraAluno(l);
    return 0;


}
