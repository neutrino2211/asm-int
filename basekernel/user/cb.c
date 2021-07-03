#include "library/string.h"
#include "library/user-io.h"
#include "library/malloc.h"
#include "library/syscalls.h"

void A() 
{ 
    printf("I am function A");
} 
  
// callback function 
void B(void (*ptr)()) 
{ 
    (*ptr) (); // callback to A 
} 
  
int main() 
{ 
    void (*ptr)() = &A; 
      
    // calling function B and passing 
    // address of the function A as argument 
    B(ptr);
   return 0; 
} 