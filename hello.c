#include <stdlib.h>
#include <stdio.h>

#define EXIT_FAILURE 1
#define EXIT_SUCCESS 0

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "not enough args!\n");
    exit(EXIT_FAILURE);
  }

  printf("hello, %s\n", argv[1]);
  return EXIT_SUCCESS;
}
