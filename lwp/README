To compile the three test programs, be sure to link them with the 
appropriate libraries:

  threaded counting:

    gcc -o nums numbersmain.c -L. -lPLN -lsnakes

  hungrysnakes:

    gcc -o hs hungrymain.c -L. -lPLN -lsnakes -lncurses

  randomsnakes:

    gcc -o rs snakemain.c -L. -lPLN -lsnakes -lncurses

Each of the snake programs installs signal handlers such that
SIGINT (^C) will kill a snake, and SIGQUIT (^\) will terminate
threading.



