//
//  mainc.c
//  RandomPass
//
//  Created by Ferdous Mahmud Akash on 10/15/21.
//
#include "mainc.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define BUF_SIZE 1024

// Function to randomly generates password
const char* randomPasswordGeneration(int N)
{
    char password [BUF_SIZE];
    
    for (int i = 0; i < N; i++)
        password [i] = 33 + rand () % 94;
    
    
//  indicate the termination of a character string
    password [N] = '\0';
    char *temp = password;
    return  temp;
}
