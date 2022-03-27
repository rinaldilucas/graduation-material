#include<stdio.h>
#include<stdlib.h>

struct arv {
  int info;
  struct arv* esq;
  struct arv* dir;
};
typedef struct arv Arv;

Arv* arv_criavazia (void)
{
  return NULL;
}

Arv* arv_cria(int c, Arv* sae, Arv* sad)
{
  Arv* p=(Arv*)malloc(sizeof(Arv));
  p->info = c;
  p->esq = sae;
  p->dir = sad;
  return p;
}

Arv* arv_libera (Arv* a){
  if (!arv_vazia(a)){
    arv_libera(a->esq);    /* libera sae */
    arv_libera(a->dir);    /* libera sad */
    free(a); /* libera raiz */
  }
  return NULL;
}

int arv_vazia (Arv* a)
{
  return a==NULL;
}

int arv_pertence (Arv* a, int c){
   if (arv_vazia(a))
     return 0;     /* árvore vazia: não encontrou */
   else
     return a->info==c ||
     arv_pertence(a->esq,c) ||
     arv_pertence(a->dir,c);
}

void arv_imprime (Arv* a)
{
  if (!arv_vazia(a)){
    printf("%d ", a->info); /* mostra raiz */
    arv_imprime(a->esq); /* mostra sae */
    arv_imprime(a->dir); /* mostra sad */
   }
}

int contNos (Arv *a) {
    int cont = 0;
    if (a == NULL) {
        return 0;
    } else {
        cont += contNos(a->esq);
        cont += contNos(a->dir);
        return ++cont;
    }
}

int maiorNos (Arv *a) {
    if ((a->dir) && (a->dir->info > a->info))
        return maiorNos (a->dir);
    else
        return a->info;
}


main(){
   Arv *a = arv_cria(5, arv_cria(111,arv_criavazia(),arv_criavazia()), arv_cria(6,arv_cria(7, arv_criavazia(), arv_criavazia()),arv_cria(8, arv_criavazia(), arv_criavazia())));
   arv_imprime(a);
   if(arv_pertence(a,6)==1)
      printf("\nEncontrou!!\n");

   printf ("%d", contNos(a));
   printf ("%d", maiorNos(a));
}
