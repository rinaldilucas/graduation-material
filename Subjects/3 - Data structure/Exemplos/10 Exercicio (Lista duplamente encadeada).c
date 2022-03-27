#include <stdio.h>
#include <stdlib.h>

typedef struct Aluno{
    int RA;
    char *nome;
    float P1;
    float P2;
    float APS;
    struct Aluno *prox;
    struct Aluno *ant;
} Aluno;

Aluno* incluirAlunoFinal (Aluno *l, Aluno *r, int RA, char *nome, float P1, float P2, float APS){
    Aluno *aux;
    Aluno *novo = (Aluno *) malloc (sizeof(Aluno));
    if (l == NULL) {
        novo = (Aluno*) malloc(sizeof(Aluno));
        novo->RA = RA;
        novo->nome = nome;
        novo->P1 = P1;
        novo->P2 = P2;
        novo->APS = APS;
        novo->prox = NULL;
        return novo;
    }
    aux = r;

    novo->ant = r;
    novo->RA = RA;
    novo->nome = nome;
    novo->P1 = P1;
    novo->P2 = P2;
    novo->APS = APS;
    novo->prox = NULL;
    r->prox = novo;
    return novo;
}

Aluno* incluirAluno (Aluno *l, int RA, char *nome, float P1, float P2, float APS, int pos){
    Aluno *aux, *novo, *ant;

    if (l == NULL) {
        novo = (Aluno*) malloc(sizeof(Aluno));
        novo->RA = RA;
        novo->nome = nome;
        novo->P1 = P1;
        novo->P2 = P2;
        novo->APS = APS;
        novo->prox = NULL;
        return novo;
    }
    aux = l;
    ant = NULL;

    while (aux != NULL && aux->RA != pos)    {
        ant = aux;
        aux = aux->prox;
    }
    if (aux == NULL)
        return l;

    if (ant == NULL) {
        novo = (Aluno*) malloc(sizeof(Aluno));
        novo->RA = RA;
        novo->nome = nome;
        novo->P1 = P1;
        novo->P2 = P2;
        novo->APS = APS;
        novo->prox = l;
        return novo;
    }
    novo = (Aluno *) malloc(sizeof(Aluno));
    ant->prox = novo;
    novo->RA = RA;
    novo->nome = nome;
    novo->P1 = P1;
    novo->P2 = P2;
    novo->APS = APS;
    novo->prox = aux;
    return l;
}

void imprime (Aluno *l)
{
    Aluno *aux;
    aux = l;
    while (aux != NULL)
    {
        printf ("%d %s %f %f %f\n", aux->RA, aux->nome, aux->P1, aux->P2, aux->APS);
        aux = aux->prox;
    }
}

main () {

    int RA;
    char nome[30];
    float P1, P2, APS;

    printf ("Digite o RA do aluno: ");
    scanf ("%d", &RA);
    printf ("Digite o nome: ");
    setbuf (stdin, NULL);
    scanf("%[^\n]s", nome);
    setbuf (stdin, NULL);
    printf ("Digite P1: ");
    scanf ("%f", &P1);
    printf ("Digite P2: ");
    scanf ("%f", &P2);
    printf ("Digite APS: ");
    scanf ("%f", &APS);

    Aluno *l, *r;
    l = NULL;
    r = NULL;



    l = incluirAluno (l, 122, "Joao", 9, 8, 7, 123);
    l = incluirAluno (l, 125, "Joao", 9, 8, 7, 122);
    //l = incluirAlunoFinal (l, r, RA, nome, P1, P2, APS);
    imprime(l);

}
