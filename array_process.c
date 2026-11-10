#include "array.h"

void removeDuplicates(int a[], int *n)
{
    int i, j, k;

    for (i = 0; i < *n; i++)
    {
        j = i + 1;

        while (j < *n)
        {
            if (a[i] == a[j])
            {
                for (k = j; k < *n - 1; k++)
                {
                    a[k] = a[k + 1];
                }

                (*n)--;
            }
            else
            {
                j++;
            }
        }
    }
}

int sumNegativeDivisibleBy4(const int a[], int n)
{
    int i;
    int sum = 0;

    for (i = 0; i < n; i++)
    {
        if (a[i] < 0 && a[i] % 4 == 0)
        {
            sum += a[i];
        }
    }

    return sum;
}