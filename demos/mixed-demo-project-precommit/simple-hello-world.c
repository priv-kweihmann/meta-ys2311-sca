// SPDX-License-Identifier: BSD-2-Clause
// Copyright (c) 2019, Konrad Weihmann

#include <stdio.h>
#include <string.h>

static char a[10] = "";

static char* foo(char *input) {
	strcpy(a, input);
	return a;
}

int main()
{
	printf("Hello World\n");
	char *a[10] = {};
	char *b[10] = {};
	char c[250] = "";
	memcpy(&a, &a, sizeof(a) + 10);
	if (c[-1] == 0) return 1;
	return 0;

	if (c[-1] == 0) return 1;
	foo(c);
	printf("%s", a);
}