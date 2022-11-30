// ICKIE NUMERALS - a convoluted way of converting numbers to roman numerals
// Copyright (C) 2022  Simon Wendel
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
