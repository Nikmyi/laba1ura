#ifndef ARRAY_H
#define ARRAY_H

#define MAX_SIZE 25

void setupRussianConsole(void);

void inputArray(int a[], int n);
void printArray(const int a[], int n);

void removeDuplicates(int a[], int *n);
int sumNegativeDivisibleBy4(const int a[], int n);

#endif