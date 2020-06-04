// SPDX-License-Identifier: MIT
// Copyright (c) 2020 Chua Hou

#include <unistd.h>

#define BUF_SIZE 8192
#define STDOUT 1

int main(void)
{
	char ys[BUF_SIZE];
	ys[0] = 'y';
	ys[1] = '\n';
	for (int i = 2; i < BUF_SIZE; i += 2) {
		ys[i] = ys[0];
		ys[i+1] = ys[1];
	}
	while (1)
		write(STDOUT, "y\n", BUF_SIZE);
	return 1; // not reached
}
