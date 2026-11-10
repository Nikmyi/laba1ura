#include <stdio.h>
#include "array.h"

int main(void)
{
    int D[19];
    int sum;

    setupRussianConsole();

    inputArray(D, 19);

    printf("\nИсходный массив:\n");
    printArray(D, 19);

    sum = sumNegativeDivisibleBy4(D, 19);

    printf("\nСумма отрицательных элементов, кратных четырём: %d\n", sum);

    return 0;
}