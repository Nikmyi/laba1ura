#include <stdio.h>

/* Вспомогательная функция: НОД двух чисел (алгоритм Евклида) */
int gcd2(int a, int b)
{
    while (b != 0) {
        int t = b;
        b = a % b;
        a = t;
    }
    return a;
}

/* НОД трёх чисел */
int gcd3(int a, int b, int c)
{
    return gcd2(gcd2(a, b), c);
}

int main(void)
{
    int a, b, c;
    int d;

    printf("Введите три натуральных числа A B C: ");
    if (scanf("%d %d %d", &a, &b, &c) != 3) {
        printf("Ошибка ввода\n");
        return 1;
    }

    if (a <= 0 || b <= 0 || c <= 0) {
        printf("Числа должны быть натуральными (> 0)\n");
        return 1;
    }

    d = gcd3(a, b, c);

    if (d == 1)
        printf("Наименьший общий делитель = 1 (других общих делителей нет)\n");
    else
        printf("Наибольший общий делитель чисел %d, %d, %d = %d\n",
               a, b, c, d);

    return 0;
}