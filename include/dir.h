// C Program to design a shell in Linux
#ifndef DIR_H_INCLUDED
#define DIR_H_INCLUDED

#pragma once

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<readline/readline.h>
#include<readline/history.h>

void printDir()
{
    char cwd[1024];
    getcwd(cwd, sizeof(cwd));
    printf("\nDir: %s", cwd);
}

#endif // DIR_H_INCLUDED
