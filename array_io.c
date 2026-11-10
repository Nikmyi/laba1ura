#include <stdio.h>
#include <locale.h>
#include <windows.h>
#include "array.h"

void setupRussianConsole(void)
{
    SetConsoleOutputCP(CP_UTF8);
    SetConsoleCP(CP_UTF8);
    setlocale(LC_ALL, ".UTF8");
}

void inputArray(int a[], int n)
{
    int i;

    printf("Введите %d элементов массива:\n", n);

    for (i = 0; i < n; i++)
    {
        printf("Элемент [%d]: ", i + 1);
        scanf("%d", &a[i]);
    }
}

void printArray(const int a[], int n)
{
    int i;

    for (i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }

    printf("\n");
}