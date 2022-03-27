#include <stdio.h>

struct horario{
    int hora;
    int minuto;
    int segundo;
};

int main (){

    void receberHorarios(struct horario lista[]);
    void printHorarios (struct horario lista[]);
    struct horario listaHorarios[5];

    receberHorarios(listaHorarios);
    printHorarios (listaHorarios);


    system("pause");
    return 0;

}

void receberHorarios(struct horario lista[]){
    int i;

    for (i = 0; i < 5; i++){
        printf("Digite a hora: ");
        scanf ("%d", &lista[i].hora);
        printf("Digite o min: ");
        scanf ("%d", &lista[i].minuto);
        printf("Digite o seg: ");
        scanf ("%d", &lista[i].segundo);
    }
}

void printHorarios(struct horario lista[]){
    int i;

    for (i = 0; i < 5; i++){
        printf ("%d:%d:%d\n", lista[i].hora, lista[i].minuto, lista[i].segundo);
    }
}
