#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<readline/readline.h>
#include<readline/history.h>

// include .h

#include "include/help.h"
#include "include/commands.h"
#include "include/error.h"
#include "include/dir.h"
#include "include/execargs.h"

#define MAXCOM 1000
#define MAXLIST 100
  
#define clear() printf("\033[H\033[J")
  
void init_shell()
{
    clear();
    printf("\n\n\n\n******************"
        "************************");
    printf("\n\n\n\t****LCS SHELL****");
    printf("\n\n\n\n*******************"
        "***********************");
    char* username = getenv("USER");
    printf("\n\n\nUSER: @%s", username);
    printf("\n");
    sleep(2);
    clear();
}
  
int takeInput(char* str)
{
    char* buf;
  
    buf = readline("\n: ");
    if (strlen(buf) != 0) {
        add_history(buf);
        strcpy(str, buf);
        return 0;
    } else {
        return 1;
    }
}
  
void dir(){
    printDir();
}
  
void args(char** parsed)
{
    execArgs(parsed);
}
  
void error(char** parsed, char** parsedpipe){
    execArgsPiped(parsed, parsedpipe);
}

void help(){
    openHelp();
}

int commands(char** parsed)
{
    ownCmdHandler(parsed);
}
  
int parsePipe(char* str, char** strpiped)
{
    int i;
    for (i = 0; i < 2; i++) {
        strpiped[i] = strsep(&str, "|");
        if (strpiped[i] == NULL)
            break;
    }
  
    if (strpiped[1] == NULL)
        return 0;
    else {
        return 1;
    }
}
  
void parseSpace(char* str, char** parsed)
{
    int i;
  
    for (i = 0; i < MAXLIST; i++) {
        parsed[i] = strsep(&str, " ");
  
        if (parsed[i] == NULL)
            break;
        if (strlen(parsed[i]) == 0)
            i--;
    }
}
  
int processString(char* str, char** parsed, char** parsedpipe)
{
  
    char* strpiped[2];
    int piped = 0;
  
    piped = parsePipe(str, strpiped);
  
    if (piped) {
        parseSpace(strpiped[0], parsed);
        parseSpace(strpiped[1], parsedpipe);
  
    } else {
  
        parseSpace(str, parsed);
    }
  
    if (ownCmdHandler(parsed))
        return 0;
    else
        return 1 + piped;
}
  
int main()
{
    char inputString[MAXCOM], *parsedArgs[MAXLIST];
    char* parsedArgsPiped[MAXLIST];
    int execFlag = 0;
    init_shell();
  
    while (1) {
        printDir();
        if (takeInput(inputString))
            continue;

        execFlag = processString(inputString,
        parsedArgs, parsedArgsPiped);

        if (execFlag == 1)
            execArgs(parsedArgs);
  
        if (execFlag == 2)
            execArgsPiped(parsedArgs, parsedArgsPiped);
    }
    return 0;
}

