#include <assert.h> /* to use assert() */
#include <stdio.h>
#include "str.h"
/*
Assignment2: str.c
20180569 Jeon Sangeon
*/

/* Your task is: 
   1. Rewrite the body of "Part 1" functions - remove the current
      body that simply calls the corresponding C standard library
      function.
   2. Write appropriate comment per each function
*/

/* Part 1 */
/*------------------------------------------------------------------------*/
size_t StrGetLength(const char* pcSrc)
/*returns length of string that pcSrc points to*/
{
  const char *pcEnd;
  assert(pcSrc); /* NULL address, 0, and FALSE are identical. */
  pcEnd = pcSrc;
	
  while (*pcEnd) /* null character and FALSE are identical. */
    pcEnd++;

  return (size_t)(pcEnd - pcSrc);
}

/*------------------------------------------------------------------------*/
char *StrCopy(char *pcDest, const char* pcSrc)
/*copy the string pcSrc points to to the string pcDest points to
and returns pcDest*/
{
  char *pcOut;
  const char *pcIn;
  assert(pcSrc && pcDest);
  pcIn=pcSrc,pcOut=pcDest;

  while(*pcIn){	
	*pcOut=*pcIn;
    	pcOut++,pcIn++;
  }
  *pcOut='\0';
  return pcDest;
}
/*------------------------------------------------------------------------*/
int StrCompare(const char* pcS1, const char* pcS2)
/*compare the string pcS1 points to and the string pcS2 points to
and return corresponding integer*/
{
  const char *pcEnd1;
  const char *pcEnd2;
  assert(pcS1 && pcS2);
  pcEnd1=pcS1, pcEnd2=pcS2;

  while(*pcEnd1 || *pcEnd2){
    	if(*pcEnd1!=*pcEnd2) return *pcEnd1-*pcEnd2;
    	pcEnd1++,pcEnd2++;
  }
  return 0;
}
/*------------------------------------------------------------------------*/
char *StrSearch(const char* pcHaystack, const char *pcNeedle)
/*search the substring pcNeedle points to in the string pcHaystack points to
and return the pointer which points to the startpoint pcNeedle string
start in the pcHaystack*/
{
  const char* pcHayEnd;
  const char* pcNeeEnd;
  const char* pcCountStart;
  assert(pcHaystack && pcNeedle);
  pcCountStart=pcHaystack;
  pcHayEnd=pcHaystack;
  pcNeeEnd=pcNeedle;
  if(!*pcNeedle) return (char*)pcHaystack;

  while(*pcHayEnd){
	if(*pcHayEnd==*pcNeeEnd){
		pcCountStart=pcHayEnd;
		do{
	  		pcHayEnd++,pcNeeEnd++;
			if(!*pcNeeEnd){
				return (char*)pcCountStart;
			}
      		}while(*pcHayEnd==*pcNeeEnd);
		pcHayEnd=pcCountStart;
	  	pcNeeEnd=pcNeedle;
    	}
	pcHayEnd++;
  }
  return NULL;
}
/*------------------------------------------------------------------------*/
char *StrConcat(char *pcDest, const char* pcSrc)
/*contenuate the string pcSrc points to to the that pcDest points to
and return pcDest*/ 
{
  const char* pcSrcEnd;
  char* pcDestEnd;
  assert(pcDest && pcSrc);
  pcSrcEnd=pcSrc;
  pcDestEnd=pcDest;
  while(*pcDestEnd){
	pcDestEnd++;
  }

  while(*pcSrcEnd){	
	*pcDestEnd=*pcSrcEnd;
	pcDestEnd++,pcSrcEnd++;
  }
  *pcDestEnd='\0';
  return pcDest;
}
