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

#define MIN_CHAR 1
#define BUF_SIZE 1024


// Function to randomly generates password
const char* randomPasswordGeneration(int N)
{
    char password [BUF_SIZE];
    
    for (int i = 0; i < N; i++)
        password [i] = 33 + rand () % 94;

    password [N] = '\0';
    char *temp = password;
    return  temp;
}
