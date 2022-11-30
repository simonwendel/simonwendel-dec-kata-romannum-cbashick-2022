#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
    if(argc != 2) {
        return 1;
    }

    char *number = argv[1];
    size_t length = strlen(number);
    for (size_t i = 0; i < length; i++) {
        if(i > 0) {
            printf(" ");
        }

        switch (number[i]) {
            case '0':
                printf("OH");
                break;
            case '1':
                printf("ONE");
                break;
            case '2':
                printf("TWO");
                break;
            case '3':
                printf("THREE");
                break;
            case '4':
                printf("FOUR");
                break;
            case '5':
                printf("FIVE");
                break;
            case '6':
                printf("SIX");
                break;
            case '7':
                printf("SEVEN");
                break;
            case '8':
                printf("EIGHT");
                break;
            case '9':
                printf("NINER");
                break;
            default:
                return 2;
        }
    }

    printf("\n");
    return 0;
}
