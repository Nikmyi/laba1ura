    #include <stdio.h>
#include "array.h"

int main(void)
{
    int M[25];
    int n = 25;

    setupRussianConsole();

    inputArray(M, n);

    printf("\nИсходный массив:\n");
    printArray(M, n);

    removeDuplicates(M, &n);

    printf("\nМассив после удаления повторений:\n");
    printArray(M, n);

    printf("\nКоличество элементов после обработки: %d\n", n);

    return 0;
}