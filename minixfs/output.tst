
------------------------
Looking for source files
------------------------

Found: file.c inode.c main.c minixfs.c minixfs.h partition.c super.c

--------------------------------
Checking for long lines (no program should have any lines > 80 chars)
(run ~pnico/bin/longlines.pl on your files to check.)
--------------------------------

Line length ok.

Found: Makefile

------------------------------------
Building the application: "make all"
------------------------------------

make all
make: Nothing to be done for `all'.

---------------
checking for executables
---------------


------------------------
Running the application 
------------------------

   =======================================================================
  Test                                                          Status
       Cmd: Prog Arguments                                
   =======================================================================
  1 -- Usage test                                                       ok.
       Cmd: minls -h                                       
  2 -- unparitioned, blank                                              ok.
       Cmd: minls BlankDisk                                
  3 -- unpartitioned, files                                             ok.
       Cmd: minls TestImage                                
  4 -- unpartitioned, bad superblock                                    ok.
       Cmd: minls RandomDisk                               
  5 -- partitioned, part 0                                              ok.
       Cmd: minls -p 0 Partitioned                         
  6 -- partitioned, part 1                                              ok.
       Cmd: minls -p 1 Partitioned                         
  7 -- partitioned, part 2                                              ok.
       Cmd: minls -p 2 Partitioned                         
  8 -- partitioned, part 3                                              ok.
       Cmd: minls -p 3 Partitioned                         
  9 -- partitioned, bad part                                            ok.
       Cmd: minls -p 5 Partitioned                         
 10 -- partitioned, no part                                             ok.
       Cmd: minls Partitioned                              
 11 -- partitioned, not minix                                           ok.
       Cmd: minls -p 1 HardDisk                            
 12 -- subpart., good sub                                               ok.
       Cmd: minls -p 0 -s 0 HardDisk                       
 13 -- subpart., bad sub                                                ok.
       Cmd: minls -p 0 -s 1 HardDisk                       
 14 -- unpartitioned, w/filename                                        ok.
       Cmd: minls TestImage /Hello                         
 15 -- partitioned, w/filename, p0                                      ok.
       Cmd: minls -p 0 Partitioned /Message                
 16 -- partitioned, w/filename, p1                                      ok.
       Cmd: minls -p 1 Partitioned /Message                
 17 -- partitioned, w/filename, p2                                      ok.
       Cmd: minls -p 2 Partitioned /Message                
 18 -- partitioned, w/filename, p3                                      ok.
       Cmd: minls -p 3 Partitioned /Message                
 19 -- subpart., no filename s0                                         ok.
       Cmd: minls -p 0 -s 0 HardDisk                       
 20 -- subpart., no filename s2                                         ok.
       Cmd: minls -p 0 -s 2 HardDisk                       
 21 -- subpart., w/filename                                             ok.
       Cmd: minls -p 0 -s 2 HardDisk /home/pnico/Message   
 22 -- subpart., w/bad filename                                         ok.
       Cmd: minls -p 0 -s 0 HardDisk /home/pnico/Message   
 23 -- directories                                                      ok.
       Cmd: minls Files /Files                             
 24 -- directories                                                      ok.
       Cmd: minls Files /Files/0000_Zones                  
 25 -- directories                                                      ok.
       Cmd: minls Files /Files/0000_Zone                   
 26 -- directories                                                      ok.
       Cmd: minls Files /Files/0007_Zones                  
 27 -- directories                                                      ok.
       Cmd: minls Files /Files/0010_Zones                  
 28 -- directories                                                      ok.
       Cmd: minls Files /Files/1032_Zones                  
 29 -- directories                                                      ok.
       Cmd: minls Files /DeepPaths/a/b/c/d/e/i/j/k/Files   
 30 -- directories                                                      ok.
       Cmd: minls Files /DeepPaths/a/b/c/d/e/i/j/k/Files/Message 
 31 -- directories-deleted                                              ok.
       Cmd: minls Files /Deleted                           
 32 -- directories-ok file                                              ok.
       Cmd: minls Files /Deleted/File-10                   
 33 -- directories-deleted file                                         ok.
       Cmd: minls Files /Deleted/File-05                   
 34 -- 1k blocks. dir.                                                  ok.
       Cmd: minls SmallBlocks--1k                          
 35 -- 1k blocks. file.                                                 ok.
       Cmd: minls SmallBlocks--1k DirTwo/FileTwo           
 36 -- 16k zones. dir.                                              FAILED.
       Cmd: minls BigZones-16k                             
 37 -- 16k zones. file.                                             FAILED.
       Cmd: minls BigZones-16k /DirOne/FileTwo             
 38 -- 64k zones. dir                                               FAILED.
       Cmd: minls ReallyBigZones-64k                       
 39 -- 64k zones. file                                              FAILED.
       Cmd: minls ReallyBigZones-64k DirTwo/FileOne        
 40 -- 64k zones. longpath                                          FAILED.
       Cmd: minls ReallyBigZones-64k /./.././../DirTwo/FileOne 
 41 -- Permissions 777                                                  ok.
       Cmd: minls Files /Permissions/777                   
 42 -- Permissions 755                                                  ok.
       Cmd: minls Files /Permissions/755                   
 43 -- Permissions 753                                                  ok.
       Cmd: minls Files /Permissions/753                   
 44 -- Permissions 357                                                  ok.
       Cmd: minls Files /Permissions/357                   
 45 -- Permissions 000                                                  ok.
       Cmd: minls Files /Permissions/000                   
 46 -- unpartitioned, w/filename                                        ok.
       Cmd: minget TestImage /Hello                         
 47 -- partitioned, w/filename, p0                                      ok.
       Cmd: minget -p 0 Partitioned /Message                
 48 -- partitioned, w/filename, p1                                      ok.
       Cmd: minget -p 1 Partitioned /Message                
 49 -- partitioned, w/filename, p2                                      ok.
       Cmd: minget -p 2 Partitioned /Message                
 50 -- partitioned, w/filename, p3                                      ok.
       Cmd: minget -p 3 Partitioned /Message                
 51 -- subpart., no filename s0                                     FAILED.
       Cmd: minget -p 0 -s 0 HardDisk                       
 52 -- subpart., no filename s2                                     FAILED.
       Cmd: minget -p 0 -s 2 HardDisk                       
 53 -- subpart., w/filename                                             ok.
       Cmd: minget -p 0 -s 2 HardDisk /home/pnico/Message   
 54 -- subpart., w/bad filename                                         ok.
       Cmd: minget -p 0 -s 0 HardDisk /home/pnico/Message   
 55 -- unpartitioned, w/filename                                        ok.
       Cmd: minget TestImage /Hello /dev/stdout             
 56 -- partitioned, w/filename, p0                                      ok.
       Cmd: minget -p 0 Partitioned /Message /dev/stdout    
 57 -- partitioned, w/filename, p1                                      ok.
       Cmd: minget -p 1 Partitioned /Message /dev/stdout    
 58 -- partitioned, w/filename, p2                                      ok.
       Cmd: minget -p 2 Partitioned /Message /dev/stdout    
 59 -- partitioned, w/filename, p3                                      ok.
       Cmd: minget -p 3 Partitioned /Message /dev/stdout    
 60 -- subpart., no filename s0                                         ok.
       Cmd: minget -p 0 -s 0 HardDisk /dev/stdout           
 61 -- subpart., no filename s2                                         ok.
       Cmd: minget -p 0 -s 2 HardDisk /dev/stdout           
 62 -- subpart., w/filename                                             ok.
       Cmd: minget -p 0 -s 2 HardDisk /home/pnico/Message /dev/stdout 
 63 -- subpart., w/bad filename                                         ok.
       Cmd: minget -p 0 -s 0 HardDisk /home/pnico/Message /dev/stdout 
 64 -- directories                                                  FAILED.
       Cmd: minget Files /Files                             
 65 -- directories                                                      ok.
       Cmd: minget Files /DeepPaths/Distraction             
 66 -- directories                                                  FAILED.
       Cmd: minget Files /DeepPaths/a/b/c/d/e/i/j/k/Files   
 67 -- directories                                                      ok.
       Cmd: minget Files /DeepPaths/a/b/c/d/e/i/j/k/Files/Message 
 68 -- directories                                                  FAILED.
       Cmd: minget Files /Files /dev/stdout                 
 69 -- directories                                                      ok.
       Cmd: minget Files /DeepPaths/Distraction /dev/stdout 
 70 -- directories                                                  FAILED.
       Cmd: minget Files /DeepPaths/a/b/c/d/e/i/j/k/Files /dev/stdout 
 71 -- directories                                                      ok.
       Cmd: minget Files /DeepPaths/a/b/c/d/e/i/j/k/Files/Message /dev/stdout 
 72 -- directories-deleted                                          FAILED.
       Cmd: minget Files /Deleted                           
 73 -- directories-ok file                                              ok.
       Cmd: minget Files /Deleted/File-10                   
 74 -- directories-deleted file                                         ok.
       Cmd: minget Files /Deleted/File-05                   
 75 -- directories-deleted                                          FAILED.
       Cmd: minget Files /Deleted /dev/stdout               
 76 -- directories-ok file                                              ok.
       Cmd: minget Files /Deleted/File-10 /dev/stdout       
 77 -- directories-deleted file                                         ok.
       Cmd: minget Files /Deleted/File-05 /dev/stdout       
 78 -- 1k blocks. dir.                                                  ok.
       Cmd: minls SmallBlocks--1k                          
 79 -- 1k blocks. file.                                                 ok.
       Cmd: minls SmallBlocks--1k DirTwo/FileTwo           
 80 -- 16k zones. dir.                                              FAILED.
       Cmd: minls BigZones-16k                             
 81 -- 16k zones. file.                                             FAILED.
       Cmd: minls BigZones-16k /DirOne/FileTwo             
 82 -- 64k zones. dir                                               FAILED.
       Cmd: minls ReallyBigZones-64k                       
 83 -- 64k zones. file                                              FAILED.
       Cmd: minls ReallyBigZones-64k DirTwo/FileOne        
 84 -- 64k zones. longpath                                          FAILED.
       Cmd: minls ReallyBigZones-64k /./.././../DirTwo/FileOne 
 85 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0000_Zones                  
 86 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0000_Zone                   
 87 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0007_Zones                  
 88 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0010_Zones                  
 89 -- Files size tests                                             FAILED.
       Cmd: minget Files /Files/1032_Zones                  
 90 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0000_Zones /dev/stdout      
 91 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0000_Zone /dev/stdout       
 92 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0007_Zones /dev/stdout      
 93 -- Files size tests                                                 ok.
       Cmd: minget Files /Files/0010_Zones /dev/stdout      
 94 -- Files size tests                                             FAILED.
       Cmd: minget Files /Files/1032_Zones /dev/stdout      
 95 -- Reading files with holes                                         ok.
       Cmd: minget Files /Holes/nohole         /dev/stdout  
 96 -- Reading files with holes                                         ok.
       Cmd: minget Files /Holes/direct         /dev/stdout  
 97 -- Reading files with holes                                         ok.
       Cmd: minget Files /Holes/into-indirect  /dev/stdout  
 98 -- Reading files with holes                                     FAILED.
       Cmd: minget Files /Holes/whole-indirect /dev/stdout  
 99 -- Reading files with holes                                     FAILED.
       Cmd: minget Files /Holes/double         /dev/stdout  
100 -- Reading files with holes                                         ok.
       Cmd: minget Files /Holes/nohole                      
101 -- Reading files with holes                                         ok.
       Cmd: minget Files /Holes/direct                      
102 -- Reading files with holes                                         ok.
       Cmd: minget Files /Holes/into-indirect               
103 -- Reading files with holes                                     FAILED.
       Cmd: minget Files /Holes/whole-indirect              
104 -- Reading files with holes                                     FAILED.
       Cmd: minget Files /Holes/double                      
   =======================================================================
Failure. (80/104 passed)

Actual ouput from tests and detailed results are below.



-----------------
1) Usage test:
     minls -h 
-----------------
Test program output:
Open: No such file or directory


-----------------
2) unparitioned, blank:
     minls /home/pn-cs453/Given/Asgn4/Images/BlankDisk 
-----------------
Test program output:
/:
drwxrwxrwx      128 .
drwxrwxrwx      128 ..


-----------------
3) unpartitioned, files:
     minls /home/pn-cs453/Given/Asgn4/Images/TestImage 
-----------------
Test program output:
/:
drwxrwxrwx      384 .
drwxrwxrwx      384 ..
-rw-r--r--    73991 Other
drwxr-xr-x     3200 src
-rw-r--r--       11 Hello


-----------------
4) unpartitioned, bad superblock:
     minls /home/pn-cs453/Given/Asgn4/Images/RandomDisk 
-----------------
Test program output:
Open: No such file or directory


-----------------
5) partitioned, part 0:
     minls -p 0 /home/pn-cs453/Given/Asgn4/Images/Partitioned 
-----------------
Test program output:
/:
drwxrwxrwx      192 .
drwxrwxrwx      192 ..
-rw-r--r--       20 Message


-----------------
6) partitioned, part 1:
     minls -p 1 /home/pn-cs453/Given/Asgn4/Images/Partitioned 
-----------------
Test program output:
/:
drwxrwxrwx      192 .
drwxrwxrwx      192 ..
-rw-r--r--       20 Message


-----------------
7) partitioned, part 2:
     minls -p 2 /home/pn-cs453/Given/Asgn4/Images/Partitioned 
-----------------
Test program output:
/:
drwxrwxrwx      192 .
drwxrwxrwx      192 ..
-rw-r--r--       20 Message


-----------------
8) partitioned, part 3:
     minls -p 3 /home/pn-cs453/Given/Asgn4/Images/Partitioned 
-----------------
Test program output:
/:
drwxrwxrwx      192 .
drwxrwxrwx      192 ..
-rw-r--r--       20 Message


-----------------
9) partitioned, bad part:
     minls -p 5 /home/pn-cs453/Given/Asgn4/Images/Partitioned 
-----------------
Test program output:
Partitions #'s must be 0-3


-----------------
10) partitioned, no part:
     minls /home/pn-cs453/Given/Asgn4/Images/Partitioned 
-----------------
Test program output:
Bad magic number. (0)


-----------------
11) partitioned, not minix:
     minls -p 1 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
Child process (30463) exited due to SIGSEGV.


-----------------
12) subpart., good sub:
     minls -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
/:
drwxrwxrwx      640 .
drwxrwxrwx      640 ..
drwxr-xr-x      128 usr
drwxr-xr-x      128 tmp
drwxr-xr-x     2624 bin
drwxr-xr-x     1472 etc
drwxr-xr-x      768 sbin
drwxr-xr-x    14144 dev
drwxr-xr-x      192 lib
drwxr-xr-x      256 boot


-----------------
13) subpart., bad sub:
     minls -p 0 -s 1 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
Bad partition type:  0x0

-----------------
14) unpartitioned, w/filename:
     minls /home/pn-cs453/Given/Asgn4/Images/TestImage /Hello 
-----------------
Test program output:
-rw-r--r--       11/Hello


-----------------
15) partitioned, w/filename, p0:
     minls -p 0 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
-rw-r--r--       20/Message


-----------------
16) partitioned, w/filename, p1:
     minls -p 1 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
-rw-r--r--       20/Message


-----------------
17) partitioned, w/filename, p2:
     minls -p 2 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
-rw-r--r--       20/Message


-----------------
18) partitioned, w/filename, p3:
     minls -p 3 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
-rw-r--r--       20/Message


-----------------
19) subpart., no filename s0:
     minls -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
/:
drwxrwxrwx      640 .
drwxrwxrwx      640 ..
drwxr-xr-x      128 usr
drwxr-xr-x      128 tmp
drwxr-xr-x     2624 bin
drwxr-xr-x     1472 etc
drwxr-xr-x      768 sbin
drwxr-xr-x    14144 dev
drwxr-xr-x      192 lib
drwxr-xr-x      256 boot


-----------------
20) subpart., no filename s2:
     minls -p 0 -s 2 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
/:
drwxrwxrwx     1280 .
drwxrwxrwx     1280 ..
drwxr-xr-x      512 adm
drwxr-xr-x      512 ast
drwxr-xr-x    20800 bin
drwxr-xr-x      384 etc
drwxr-xr-x      640 gnu
drwxr-xr-x     3392 include
drwxr-xr-x     2112 lib
drwxr-xr-x      704 log
drwxr-xr-x      896 man
drwxr-xr-x      384 mdec
drwx------      128 preserve
drwxr-xr-x      192 run
drwxr-xr-x     1088 sbin
drwxr-xr-x      384 spool
drwxrwxrwx      128 tmp
drwxr-xr-x      896 src
drwxr-xr-x      192 home


-----------------
21) subpart., w/filename:
     minls -p 0 -s 2 /home/pn-cs453/Given/Asgn4/Images/HardDisk /home/pnico/Message 
-----------------
Test program output:
-rw-r--r--       72/home/pnico/Message


-----------------
22) subpart., w/bad filename:
     minls -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk /home/pnico/Message 
-----------------
Test program output:
/home/pnico/Message: File not found


-----------------
23) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Files 
-----------------
Test program output:
/Files:
drwxr-xr-x      448 .
drwxrwxrwx      448 ..
-rw-r--r--        0 0000_Zones
-rw-r--r--     4096 0000_Zone
-rw-r--r--    28672 0007_Zones
-rw-r--r--    40960 0010_Zones
-rw-r--r--  4227072 1032_Zones


-----------------
24) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Files/0000_Zones 
-----------------
Test program output:
-rw-r--r--        0/Files/0000_Zones


-----------------
25) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Files/0000_Zone 
-----------------
Test program output:
-rw-r--r--     4096/Files/0000_Zone


-----------------
26) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Files/0007_Zones 
-----------------
Test program output:
-rw-r--r--    28672/Files/0007_Zones


-----------------
27) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Files/0010_Zones 
-----------------
Test program output:
-rw-r--r--    40960/Files/0010_Zones


-----------------
28) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Files/1032_Zones 
-----------------
Test program output:
-rw-r--r--  4227072/Files/1032_Zones


-----------------
29) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/a/b/c/d/e/i/j/k/Files 
-----------------
Test program output:
/DeepPaths/a/b/c/d/e/i/j/k/Files:
drwxr-xr-x      192 .
drwxr-xr-x      192 ..
-rw-r--r--       47 Message


-----------------
30) directories:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/a/b/c/d/e/i/j/k/Files/Message 
-----------------
Test program output:
-rw-r--r--       47/DeepPaths/a/b/c/d/e/i/j/k/Files/Message


-----------------
31) directories-deleted:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Deleted 
-----------------
Test program output:
/Deleted:
drwxr-xr-x      768 .
drwxrwxrwx      448 ..
-rwxr-xr-x      181 File-02
-rwxr-xr-x      181 File-04
-rwxr-xr-x      181 File-06
-rwxr-xr-x      181 File-08
-rwxr-xr-x      181 File-10


-----------------
32) directories-ok file:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Deleted/File-10 
-----------------
Test program output:
-rwxr-xr-x      181/Deleted/File-10


-----------------
33) directories-deleted file:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Deleted/File-05 
-----------------
Test program output:
/Deleted/File-05: File not found


-----------------
34) 1k blocks. dir.:
     minls /home/pn-cs453/Given/Asgn4/Images/SmallBlocks--1k 
-----------------
Test program output:
/:
drwxrwxrwx      256 .
drwxrwxrwx      256 ..
drwxr-xr-x      256 DirOne
drwxr-xr-x      256 DirTwo


-----------------
35) 1k blocks. file.:
     minls /home/pn-cs453/Given/Asgn4/Images/SmallBlocks--1k DirTwo/FileTwo  
-----------------
Test program output:
-rwxr-xr-x    20596DirTwo/FileTwo


-----------------
36) 16k zones. dir.:
     minls /home/pn-cs453/Given/Asgn4/Images/BigZones-16k 
-----------------
Test program output:
Child process (30648) exited due to SIGSEGV.
Program exited with bad status: 65280


-----------------
37) 16k zones. file.:
     minls /home/pn-cs453/Given/Asgn4/Images/BigZones-16k /DirOne/FileTwo 
-----------------
Test program output:
/DirOne/FileTwo: File not found
Program exited with bad status: 256


-----------------
38) 64k zones. dir:
     minls /home/pn-cs453/Given/Asgn4/Images/ReallyBigZones-64k 
-----------------
Test program output:
----------        0/
Diffs: ( < Reference > Testfile ):
1,5c1
< /:
< drwxrwxrwx       256 .
< drwxrwxrwx       256 ..
< drwxr-xr-x       256 DirOne
< drwxr-xr-x       256 DirTwo
---
> ----------        0/


-----------------
39) 64k zones. file:
     minls /home/pn-cs453/Given/Asgn4/Images/ReallyBigZones-64k DirTwo/FileOne 
-----------------
Test program output:
DirTwo/FileOne: File not found
Program exited with bad status: 256


-----------------
40) 64k zones. longpath:
     minls /home/pn-cs453/Given/Asgn4/Images/ReallyBigZones-64k /./.././../DirTwo/FileOne 
-----------------
Test program output:
/./.././../DirTwo/FileOne: File not found
Program exited with bad status: 256


-----------------
41) Permissions 777:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Permissions/777 
-----------------
Test program output:
-rwxrwxrwx      181/Permissions/777


-----------------
42) Permissions 755:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Permissions/755 
-----------------
Test program output:
-rwxr-xr-x      181/Permissions/755


-----------------
43) Permissions 753:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Permissions/753 
-----------------
Test program output:
-rwxr-x-wx      181/Permissions/753


-----------------
44) Permissions 357:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Permissions/357 
-----------------
Test program output:
--wxr-xrwx      181/Permissions/357


-----------------
45) Permissions 000:
     minls /home/pn-cs453/Given/Asgn4/Images/Files /Permissions/000 
-----------------
Test program output:
----------      181/Permissions/000


-----------------
46) unpartitioned, w/filename:
     minget /home/pn-cs453/Given/Asgn4/Images/TestImage /Hello 
-----------------
Test program output:
Hi, there.


-----------------
47) partitioned, w/filename, p0:
     minget -p 0 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
This is partition 0


-----------------
48) partitioned, w/filename, p1:
     minget -p 1 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
This is partition 1


-----------------
49) partitioned, w/filename, p2:
     minget -p 2 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
This is partition 2


-----------------
50) partitioned, w/filename, p3:
     minget -p 3 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message 
-----------------
Test program output:
This is partition 3


-----------------
51) subpart., no filename s0:
     minget -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
^A^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^B^@^@^@usr^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^C^@^@^@tmp^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^D^@^@^@bin^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^\^@^@^@etc^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@2^@^@^@sbin^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=^@^@^@dev^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^U^A^@^@lib^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^W^A^@^@boot^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
52) subpart., no filename s2:
     minget -p 0 -s 2 /home/pn-cs453/Given/Asgn4/Images/HardDisk 
-----------------
Test program output:
^A^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^B^@^@^@adm^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^K^@^@^@ast^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^R^@^@^@bin^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^Z^A^@^@etc^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^_^A^@^@gnu^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@c^A^@^@include^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@M-z^A^@^@lib^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@M-^T^B^@^@log^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@M-^^^B^@^@man^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@#^D^@^@mdec^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@(^D^@^@preserve^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@)^D^@^@run^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@+^D^@^@sbin^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@;^D^@^@spool^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@A^D^@^@tmp^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@B^D^@^@src^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@M-^^^O^@^@home^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@pnico^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@M-.^O^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
53) subpart., w/filename:
     minget -p 0 -s 2 /home/pn-cs453/Given/Asgn4/Images/HardDisk /home/pnico/Message 
-----------------
Test program output:
Hello.

If you can read this, you're getting somewhere.

Happy hacking.


-----------------
54) subpart., w/bad filename:
     minget -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk /home/pnico/Message 
-----------------
Test program output:
/home/pnico/Message: File not found


-----------------
55) unpartitioned, w/filename:
     minget /home/pn-cs453/Given/Asgn4/Images/TestImage /Hello /dev/stdout 
-----------------
Test program output:
Hi, there.


-----------------
56) partitioned, w/filename, p0:
     minget -p 0 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message /dev/stdout 
-----------------
Test program output:
This is partition 0


-----------------
57) partitioned, w/filename, p1:
     minget -p 1 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message /dev/stdout 
-----------------
Test program output:
This is partition 1


-----------------
58) partitioned, w/filename, p2:
     minget -p 2 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message /dev/stdout 
-----------------
Test program output:
This is partition 2


-----------------
59) partitioned, w/filename, p3:
     minget -p 3 /home/pn-cs453/Given/Asgn4/Images/Partitioned /Message /dev/stdout 
-----------------
Test program output:
This is partition 3


-----------------
60) subpart., no filename s0:
     minget -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk /dev/stdout 
-----------------
Test program output:
/dev/stdout: File not found


-----------------
61) subpart., no filename s2:
     minget -p 0 -s 2 /home/pn-cs453/Given/Asgn4/Images/HardDisk /dev/stdout 
-----------------
Test program output:
/dev/stdout: File not found


-----------------
62) subpart., w/filename:
     minget -p 0 -s 2 /home/pn-cs453/Given/Asgn4/Images/HardDisk /home/pnico/Message /dev/stdout 
-----------------
Test program output:
Hello.

If you can read this, you're getting somewhere.

Happy hacking.


-----------------
63) subpart., w/bad filename:
     minget -p 0 -s 0 /home/pn-cs453/Given/Asgn4/Images/HardDisk /home/pnico/Message /dev/stdout 
-----------------
Test program output:
/home/pnico/Message: File not found


-----------------
64) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files 
-----------------
Test program output:
^B^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^C^@^@^@0000_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^D^@^@^@0000_Zone^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^E^@^@^@0007_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^F^@^@^@0010_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^G^@^@^@1032_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
65) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/Distraction 
-----------------
Test program output:
/DeepPaths/Distraction: File not found


-----------------
66) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/a/b/c/d/e/i/j/k/Files 
-----------------
Test program output:
"^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@!^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@#^@^@^@Message^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
67) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/a/b/c/d/e/i/j/k/Files/Message 
-----------------
Test program output:
This is at the bottom of a/b/c/d/e/i/j/k/Files


-----------------
68) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files /dev/stdout 
-----------------
Test program output:
^B^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^C^@^@^@0000_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^D^@^@^@0000_Zone^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^E^@^@^@0007_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^F^@^@^@0010_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^G^@^@^@1032_Zones^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
69) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/Distraction /dev/stdout 
-----------------
Test program output:
/DeepPaths/Distraction: File not found


-----------------
70) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/a/b/c/d/e/i/j/k/Files /dev/stdout 
-----------------
Test program output:
"^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@!^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@#^@^@^@Message^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
71) directories:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /DeepPaths/a/b/c/d/e/i/j/k/Files/Message /dev/stdout 
-----------------
Test program output:
This is at the bottom of a/b/c/d/e/i/j/k/Files


-----------------
72) directories-deleted:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Deleted 
-----------------
Test program output:
^H^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-01^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@	^@^@^@
^@^@^@File-02^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-03^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^K^@^@^@^L^@^@^@File-04^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-05^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^M^@^@^@^N^@^@^@File-06^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-07^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^O^@^@^@^P^@^@^@File-08^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-09^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^Q^@^@^@^R^@^@^@File-10^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
73) directories-ok file:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Deleted/File-10 
-----------------
Test program output:
#!/bin/sh
#
# cd 1.3 - equivalents for normally builtin commands.	Author: Kees J. Bot

case $0 in
*/*)	command="`expr "$0" : '.*/\(.*\)'`"
	;;
*)	command="$0"
esac

"$command" "$@"


-----------------
74) directories-deleted file:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Deleted/File-05 
-----------------
Test program output:
/Deleted/File-05: File not found


-----------------
75) directories-deleted:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Deleted /dev/stdout 
-----------------
Test program output:
^H^@^@^@.^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^A^@^@^@..^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-01^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@	^@^@^@
^@^@^@File-02^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-03^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^K^@^@^@^L^@^@^@File-04^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-05^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^M^@^@^@^N^@^@^@File-06^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-07^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^O^@^@^@^P^@^@^@File-08^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@File-09^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^Q^@^@^@^R^@^@^@File-10^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@ This test was expected to fail, but reports success.
 Perhaps a bad exit status?


-----------------
76) directories-ok file:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Deleted/File-10 /dev/stdout 
-----------------
Test program output:
#!/bin/sh
#
# cd 1.3 - equivalents for normally builtin commands.	Author: Kees J. Bot

case $0 in
*/*)	command="`expr "$0" : '.*/\(.*\)'`"
	;;
*)	command="$0"
esac

"$command" "$@"


-----------------
77) directories-deleted file:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Deleted/File-05 /dev/stdout 
-----------------
Test program output:
/Deleted/File-05: File not found


-----------------
78) 1k blocks. dir.:
     minls /home/pn-cs453/Given/Asgn4/Images/SmallBlocks--1k 
-----------------
Test program output:
/:
drwxrwxrwx      256 .
drwxrwxrwx      256 ..
drwxr-xr-x      256 DirOne
drwxr-xr-x      256 DirTwo


-----------------
79) 1k blocks. file.:
     minls /home/pn-cs453/Given/Asgn4/Images/SmallBlocks--1k DirTwo/FileTwo  
-----------------
Test program output:
-rwxr-xr-x    20596DirTwo/FileTwo


-----------------
80) 16k zones. dir.:
     minls /home/pn-cs453/Given/Asgn4/Images/BigZones-16k 
-----------------
Test program output:
Child process (30943) exited due to SIGSEGV.
Program exited with bad status: 65280


-----------------
81) 16k zones. file.:
     minls /home/pn-cs453/Given/Asgn4/Images/BigZones-16k /DirOne/FileTwo 
-----------------
Test program output:
/DirOne/FileTwo: File not found
Program exited with bad status: 256


-----------------
82) 64k zones. dir:
     minls /home/pn-cs453/Given/Asgn4/Images/ReallyBigZones-64k 
-----------------
Test program output:
----------        0/
Diffs: ( < Reference > Testfile ):
1,5c1
< /:
< drwxrwxrwx       256 .
< drwxrwxrwx       256 ..
< drwxr-xr-x       256 DirOne
< drwxr-xr-x       256 DirTwo
---
> ----------        0/


-----------------
83) 64k zones. file:
     minls /home/pn-cs453/Given/Asgn4/Images/ReallyBigZones-64k DirTwo/FileOne 
-----------------
Test program output:
DirTwo/FileOne: File not found
Program exited with bad status: 256


-----------------
84) 64k zones. longpath:
     minls /home/pn-cs453/Given/Asgn4/Images/ReallyBigZones-64k /./.././../DirTwo/FileOne 
-----------------
Test program output:
/./.././../DirTwo/FileOne: File not found
Program exited with bad status: 256


-----------------
85) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0000_Zones 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---


-----------------
86) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0000_Zone 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
M-^]JM-2-:M-^S?8M-6o^XM-7^RM-`^^M-^PM-yM-^R5M-^I^FDM-DyVqM-LM-0QOM-zM-^U24M-3M-(M-0	M-)RM-^GM-,u
^ZM-5M-un2M-KM-^Ea.M-\M-cM-3M-^XM-xM-Hf;M-ipPM-A^EM-[M-+M-ds^AN.M-^TM-qM-MM-OM-^VM-QVM-^IeM-RSM-tM-YM-^Z:}M-CM-jeM-QM-MM-Ix^AM-*M-^Z^Xr
M-^JM-_EM-3M-f8z^?&M-o^\}M-f;M-^N3M-C^SM-m2Xk^[|lM-^\pN4=M-y^RM-HM-PM-n-]M-^OM-:;^zM-^KM-ZM-^IM-f.HM-xqM-^DM-^S*4M-rM-gcM~E^]M-PM-5j^RM-*,M-nM-~|M-EM-J^@^PEM-^H^?DM-G^H:M-AM-^CM-`M-%M-mM-^YQkt^AM-::^CM-j;M-ElM-^FlM-^?M-HL?M-^Uo<
uM-^QM-^QNM-^HozM-^N5GM--^OM-8M-wa^ZQM-xM-rM-|M-WM-iM-n^@M-%+}5M-^SM-a^LM-@{M-^Z.^DM-[FyM-_ZM-{M-OM-,AM-^PM-:=^KM-rM-+M-^UM-dM-TM-%^UM-!M-^K{M-^F^LakGM-$M-BM-*7M-H^?^\K^EM-^Q^Y^VM-^ZM-^X9M-NJM->M-7Gp_lM-^IM-lM-yM-vM-1^N\6^?p^Nx^QM-` 1'M-^HM-pMJM-z~M-4sM-TM-^WM-^EOM-/hBM-^@M-^@RhEM-WM-^ZM-|M-t/M-0M-wM-#zM-jM-eFM-NoM-H+M-:M-^M-^QM-<M-AM-^A4M-mM-^\T0?^?@M-^Q^B^P	f*^Q
M-^B&^CM-2^RP6M-QM-nM-CM-<M-(,nM-)M-w{M-AH{:M-S:%^NpM-^GM-}M-^XM-iM-}^BM-"M-IM-6xM-pM-2M-uM-,M-nE\)^SsF^AGM-^L>YM-^BM-iM-#^O9M-EM-CM-;M-3M-fhM-sM-*M-*ciM-11M-^\M-5M-=[M-D$M-GuM-^UM-Y^\G{IM-_^XM-^EM-nM-^LM--W;\HM-:M-#M-^KM-_bWM/^CM-^PM-"M-~M-^NM-^IM-!M-Z^RM-tM-rM-^JZ^HM-_JM-NM-^@M-ajM-83M-^RM-^LM-^_M-xM-~MM-%^_M-h'M-jcM-k
M-^W.M-G?1M-^AKM-rM-_;M-<M-U&f+M-yM-/(M-A^QM-_kM-W&M-5^^(M-!M-#M-^JM-6!M-}ZVM-s^XM-M$M-^VM-f`8M-f^CM-uM-G@^XvM-b^KM-^X[tM-<^?;^L"M-PM-9M-I1zM-VM-MM-L2^PM-OM-n^XM-$^CM-X^G^D^GgM--4]M- M-AM-^TM-^AM-^MKM-^WM-^S^W|M-y^A^]M-hcM-^^M-_^X^V^@y+M-vM-BM-Ci;M-5M-^?M-~6M-"M-[^Up[M-#^BM-wM-?^MM-^WM-fM-^KM-^[M-/M-fM-A<,M-_M-^IM-b^ZFQM-~M-^OM^_&>#&,M->uyM-kM-dM-&^^M-Z^ChM-9^LM-HM-fM-^\M-^KM-^TM-,M-^LM-LHM-4M-.M-;t iQ^TM-C4<ibM-TM-LnM-TM-^\^_IM-^FQ^L^\^PktM-<^B@M-%M-zuM-[M-^AM-^V]1^^\7=M-`M-^ToM-^ZLM-CtM-J9G^MM-rM-^OM-tM-^DW[=)Q!y4M-_M-zM-nM-^AaBM-PM-yM-^Q1*CT^FM-)[M-BM->mM-j_8M-j^OM-^UM-c=M-^RM-eM-(M-tI^CM->EM-xM--M-"M-M^@M-,M-D}M-^TM-khM-(M-^IfM-1E^_M-]M-^M-^\AM-3M-EM-t^O\^W-1m0M-"OM-vwM-v^GxM-5+"^Do*IM-uTM-^TM-^B*
^\M-F$^@EM-_3+M-pM-cM-{M-QM-^VyM-8M-NM-^AD4M-[M-4M- M-^KM-JuM-#M-hJM-^BpM-^Wd^B^VM-2M-|^?HM-JM-*M-9oNM-|M-&M-RM-H^^
B^AM-^]^@XM-^]OM-@M-VL^]*$i0M-UM-`M-yM-p_"M-3^WM-PM-^SM-7$M-]M-s^K&C:iolimit: output character limit (2048) exceeded.


-----------------
87) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0007_Zones 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
^YM-hM-^F^G hM-8^KM-^QM-u)<M-AM-^Z%M-oz1^FM-bl>0M-l2M-R{M-^WM-6^X7^NM-A(2M-#^OM-U
#^^M-ZM-zoM-+M-nIa{^AM-S^NM-8M-)R?gM-f9(M-jM-VYSM-8^XIXM-RM-^RM-tM-^Vpiu@^RM-^TmM-^IM-P0[^D^GM-HM-VM-QM-^CCC8TM-^Cc6M-^GM-kM-^PM-OM-VM-;#w+M-^R^MiM-!yM-d!B^K^AnM-^VBM- wM-6p"^EJ>0^H!M-^D.M-*^C^SWM-^BM-^LM-^FM-iM-^A<M-a`^YM-^[]M-lM-]%HM-~M-kM-z^@F7HM-^PM-zM-GM-^?>M-0^P^OM-%DHmHmM-Hp5M-!M-^D;
wM-^\<YM-n^\lM-z^?M-7gM-I(^BM-2M-^Lb{%^B^WM-`M-^LM-^@5/^]dM-N6BZM-3yM-xsM-#^\M-'YM-^FM-xM-^F^]_^YM-PM-^?iXM-^K0M-/M-PM-9z^_M-T^VM-eM-hM-g74M-,M-^I^NvM-5^P^G^PM-^OM-%]M-K-M-^?>M-^XM-L%M-$pM-Mu\|M-^^m^VM-mM-zM-.mM-;^\M-^Y,AM->M-.M-CGrM-*dM-!3x1M-Y^RGM-^RM-A^CM^HM-]iaM-"M-^IIu^HM-_
eM-;F]=bM-^IM-'dM-}cM-^VM--M-eM-x^F^HM-SM-+M-^[RJ^[qGM-@M-9^BM-+.^RM-CM-KX-M-^JM-^LM-NM-s^LB}M-^AM-,M-zM-^EM-/I^PM-KM-?^MM-BM-zM-^^vXM-`9M-yLM-'^_M-dM-NM-TM-^^S,^EA{^TBM-aj5i8Hz!GhM-_M-EM-+M-/M-)M-CM-^OSM-]>M-Z2^UX^G^M-9^E^DM-^_?^WM-^]M-^EM--M-|KM-d\M-^Z^KM-gM-qM-~^CM-cM-lQM-^BM-^XoM-'^VM-Ybm^?M-^C9oM-&^K^MM-QxM->M-^SM-^FlM-2M-e^F^CY2-#lM-^M^]j^\M-!K.gIM-^EE^F ^UYM-]^_f`M-^AM-p^ZDM-:M-3^M-aM-{M-^@"^@<
fM-^^cM-^QiM->M-AGaDM-7M-QM-^FM-v^MM-rM-~}M-6M-^YM-4M-uM-=M-'z^RM-vOM-(%M-^FQM-^\FM-^BMM-dpM->mgM-`M-)M-2M-,#6M-eRM-+G_M-$M-^SM-^M-J)DM-"\M-KOZZqPM-4_M-^ZM-vM-^^^FcpM-0M-3M-^YM-P^VM-|M-xzbM-^OM-aM-^MM-&^YM-^|cM-~M-^PM-%M-AM-^O?M-*M-^]KwJ^]JM-bM-8M-^SM-3F^[uM-^QM-^ZM-hM-TDM-<M-xc-&M--NM-JhqM-zM-^\M-$M-<M-^Y\M-7M-.^^M-:nM-`PM-)jC*M-^PGM-^ExM-$fM-^[M-#xcL"M-'^P3+M-0M-^@M-KM-GM-PM-^M-^Oo`M-YD^TM-6M-3M-3eS4eQM-LM-^]pM-\M-^QR^Km^O^NM-nQM-^EM-^Qv^UM-f#M-^_$dMnaM-PM-GaM->M-^^!RM-:v>GM-iM-^TM-^C^S1M-H^[5M-lM-^W+
M-|*M-`^D^FM-ZM-3^]M-`}M-h	M-9M-^[M-bM-TbM-NnM-S"^RmM-QM-FM6PM-LM-$M-^_~M-3M-L^ZBM-y^]yBM-c
M-5G~M-g7M-^TM-(M-FM-Jxz#M-]o;M-^P\M-^\FNBM-oM-`^^M-oM-^UM-h^O^RM-7M-[^MM-^DnoGM-_M-~M--pM-^]M-fM-^R_+M-tM-!vM-oaM-IM- O]M-}(&^?^LM-hcM-NM-IjM-$M-Q*wrlCvM-\M-mGM-WM-BM-BM-^ZwM-^K^EM-K6gM-HM-+'M-%XM-^VM-,M-^RM-}c^Hi^DM-yM-OM-HM-*[M-^UBqfM-^I7#M-LM-1>M-fM-DM-IA^V^_*m^?aM-^KM-`M--^_^]M-^?^G.M-rM-vM-VM-M'M-CZM-vM-^L/^[M-^Dh^AM-^KM-&MM-J}7_M-^IKM-voM-^V'M-h8M-tM-vM--M--^EM-3M-Y>M-Kou>nM-?@Niolimit: output character limit (2048) exceeded.


-----------------
88) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0010_Zones 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
-4M-bM-))EM-cM-SKM-^@^HM-^\M-sM- yM-C#M-CbM-{M-^W{^BM-d${^M-N8yM-;M-CM-^?M-j1R^DM-ZM-^DJM-3JM-b,_rM-^\^Yp^]M-RNM-vM-^PM-bM-^T\FKM-_;3#GM-^XPM- M-}`M-^FM-rM-4^LM-FM-^NM-!M-^Z^[RM-aM-y^EM-U7M-3M-L^RIM-QM-:M-^Y>aM-hM-{M-sM-^R\^AM-|M-*^?M-QM-/M-XZM-nbTM-3aM-cYErM-IM-_M-BD^N^TdM-e;M-^RqM-!4M-ta^GM-^L]ZdM-3iM-^Yb5B>M-Ht^RM-!X`M-~M-kM-=MM&U)M-^@6uM-VtZM-<:M-^UU^NM-DDVM-^EM-V)^^@M-VM-K^Y0?M-_sHM-3w^?M-^M^QM-j^UnTb<M-AwM-^PM-yM-RM-FM-o^AM-$^WM-->:?M-,M-^PM-1M-GM-=M-%M-[M-&M-AM-{M-LM-3<M-6i^M-&	OM-^CM-"M-SM-xM-Y^\M-R:OM->M-3l0D.KM-BDM-LM-Gh^L*)^_M-lM-sM-:0"3^QUYM-"M-,G*M-TM-]e^DM-e?M-^GM-.M-T^XM-Z^GM-;M-iM-tM-oM-^Hu]^OM-fM-^K M-^\M-^CM-iM-^JM-k|M-^NAiM-_M-^RM-^NM-8^FM-^VM-dM-]l>HM-auM-c{TNM-iM-uM-s_^ZAM-zwM-^@^RM-mM-8;GM-FM-7M-^X6M-%M-^W}^Q^NvJ^C^^F^VLM-Iy>?M-MM-K^HM-~M-^RM-dsM-^GM-^OM-^V#M-D-M-1M-(^SM-^RM- C,^F^]M-+1^DM-9M-^_M-TM-^Ov/@M-GM-r{r",tM-^IM-\M-pM-MM-0M-;bM-=M-w^@Jzc^WM-q@M-zM-U^VM-~M-^GM-^[M-|^NM-^JN^LfV^OM-^MM-kvM-SR!M-GMzM-OM->M-gM-GM-t^\^BlwM-=[M-vM-OM-9M-2M-^_+M-=M-KM-uM-^PM-T^E)jNM-QM-^M-at1M-^\ZqM-FM-(M-(M-^WC^XM-I~M-yM-^PM-lM-^GM-I^AM-QXM-7M-.eM-&M->^A^^M-6:^@J^\M-OM-?M-qM-^MM-^Qu^KM-B*^NM-^VgM-xM-^YM-^?"M-^H^EM-^HM-XAM-L!ZM-jM-^MS>M-QM--Xs'9M-Jzz g^>M-g,gJt^GWp^BxM-!M-v0F(^YM-@\M-SBcM-ooM-&nlQ=M-+M-^S^M-NM-^RM-w\M-_?M- HM-#yM-tM-OM-R?M-'M-k3^SAM-[M-^MM-PrM-;M-+^Th^RM-T`M-^__wM-fM-^JM-l^^S^X;M-}q}M-%M-^QM-^[M-R(^HRM-iO^_D^MM-^E7M-\EbiM-^@^OM-NM-nM-FM-T2M-^K*"O^CM-^Cq^^]D^PVM-^C}M-cM-^ErM-!M-^_M-^BM-GM-^_M-^?M-mM-^SM-xETFNM-^['vM-1M-^GM-^^M-Z2.M-(M-rM-EM-_M- M-i^WRM-^MM-'M-L`M-^HM-hM-Nr6M-^MM-9^Z^F/n8um^^EL	M-yM-jM-b.M-@M-KM-s^RE)M-^Qf]M-rN^GB^KM->TM-\O^KM-{{M-<M-.UWUM-m^Q^\kM-^KM-0M-H!M--M-~M-UM-(M-^]WM-MP;/M-^F[M-^K^HM-q^K\RM-^Z^]M-^HM-lM-M^M-6[^WM-^V\M-SM-4-f	M-yM-)^TM-.M-fM-lM-hM-^Blh%uM-0M-^T^PM-;^@M- ^QM-hM-^GbM-jM--^U,M-^M-"pM-^wM-LM-h1+ ^?M-IDM-$@M-@=M-gmM--.M--M-YM-^NM-*&M-#9M-^VM-^P^AM-yM-t^DM-4M-~M-cvTM-`T^\M-kEM-='^RM-^?M-8^FM-JM-^JpM-^Y.=M-T&KM-z 7M-^M9-M-aM-^PM-,M-RM-aM-hM-^M-^HM-^Es^^Q/4.M-^SM-eM-^Ay^LXQ0M-{cM-^SM-^FRM^_^UM-\[cM-,M-{M-k^AM-^^M-jM-}3+M-xG<AM-^GM-[M-<M-@xM-|M-^N{M-)
M-L^BM-:Miolimit: output character limit (2048) exceeded.


-----------------
89) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/1032_Zones 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
LM-^B1N,^OM-gM-\M-^V^@M-^^?M-^K^EM-X M-a^[M-"]C^C|RM-UQM-)M-mM-7^WM-^AIoM-*>M-^VmM->^[M-@cM-X.@;M-umlgM-l^_M-^TM-=M-^[M-mM-!SM-=$:M-xM-*M-^?M-%M-67Ln9M-AM-^[^Y96j.yM-^TM-4M-H^SM-^KgM-^G+M-UdM-^^M-r^PM-d6=;`bM-^PM-{M-^ILcM-^O.M-iuM-1jM-^J"M-ITM-^IM-Q^U@M-JM-nM-3M-\M-^?GQ^R^OM-Oqu*M-hk"J#M-2M-^BM-JY^QM-;7WJM-^PM-;M-%M-iM-^OM-^T{M-.M-WzN[JM-{^GM-c2v6x^VrM-^M-#9RM-r:^CM-2M-_ZqVM-c9h{?M-&M-_M-^MM-<M-t7M-^\S^KM-vB^FM-^K^^M-YM-^GgM-^KM-|M-aM-<^MM-^F^DJM- qM-e~lAM-^AM-Q/^RM-wM-^jM-sM- X%^D^AM-0k^ZM-sM-&xTM-MVM-/&M-+'^V@_/q%^RM-MM-GM-C^N5LM-IM-5M-K^AM->M-sM-^U^TkM-ZM-@M-gM-^^M-?^BM-2,V^DVM-3M-w^QM-^Q^W^ZM-I"wlM-^_TM-`M--M-^TXM-^^ZM-^JM-tM-^OjM-^V^QM-^EcM-LM-B^UM-C\^RM-tM-!M-JM-2M-LM-^\M-^QKM-jM-3^?M-^JM-gr	^StI\^_<
M-\`M-JTM-n+$b^SM-^C'M-^@yM-^OM-gM-^HM-^F^UM-<M-x^MM-4M-^?gxXM--}$M-o38^PmgM-bM-^ZM-.M-&M-&M-/pM-^@M-^@M-^J^Ts^M-^AM-4P^MzRM-p>M-wM-^U^GyM-c^QM-XM-(^A	jvM-?M-/pM-~M-^@7)M-^C~M-Y^R\M-^UM-/M-#bM-wM-^QM-`M-^DM-(M-=M-^_"SM-~CM-|M-EM-^IM-7.M-jM--`M-^[M-^XM-^DM-(M-^FM-OM-BZ^PM-~^?M-^RM-tSQIM-2M-^T^_^[M-~TM-W$@|M-^GM-^^^lM-<M-^F^NM-[5M-^\M-RFM-NuM-;M-eM-2M-(M-&M-^?M-UM-^Y&wZ(M-^P^FM-uM-*eM-!M-$^UM-9M-^[N6]M->B^E@=^TM-{M-}M-LM-{M-7hM-DM-TM-^F^NM-r^QM-:M-YM-FpM-]WG|M-KM-^W#M-`TjM-cM-3EhM-^YM-BM-t}M-6M-^T6^HM-^O,M-^Uj|M-W^R5M-)M-:M-TsM-NM-^HM-e1^_M-VM-eM-/M-\M-rvM-YM-/M-?\(M-^Mi^@zM-^]M-n^[OnM-miM-WM-uM-^K^XM-pkM-^H|\^X:	M-6=L^QM-c
M-YM-^D>M-^ M-pvIM-d^]L^?>M-(M-XM-g#XvM-N{M-#^SM-nwM-^O9_M-@M-\M-!M-^\6TM-kM-qM-.M-#5^ZM-$lM-^?M-^H^N42M-)^T^H~=|	l^DM-iM-^KM-o\DM-?M-.M-v|M-Z~M-/pbM-B^HM->JM-*[M-g$M-^JH@M-j^LM-hM-(1^X_M-e M-m3D)M-]~M-^KVF`^OM-JM-&68M-zM-^GM-kyM-^QMM-^\M-dM-YM-{M-: 78EmM-|M-^JM-6@M-[M-JA#c/m,^HM-:^FM->M-I9^ZM-]@M-* M-.M-t	M-^CM-^_M-^U0&M-x	^KM-EzM-J3cM-j07M-a^D^Ffq^L@M-&M-)M-[M-XM-!^^LM-4M-^GM-^L&M-yM-!M-^TM-1M-^GM-@M-B^_^KZ]{
D{M-,M-dM-^ZM-YM-a^AhM-c]@M-/^D:YhM-^JgM-*M-XmM-0M-VJ^ZM-cM-&M-^GM-^\ M-wM-5^:M-{M-1M-hB^TOM-bt^DM-mKM-Ic3M-!SM-^LM-kK^PM-~XS*IM-'FM-y,M-wdM-ZzM-wM-^^eeQyM-PMM-jM-LM-vM-^\M-^JUM-pmLM-^MM-^HM-^KM-|aM-^]TM-SM-'$^H^LM-)$M-LH	cM-$^G+b3^F7M-klM-;M-(DZ^UWM-*fM-^TQK(M-^YM-^]M-3M-^^Ve^T^BM-vPPMiolimit: output character limit (2048) exceeded.
Diffs: ( < Reference > Testfile ):
 --- Output limited to 10 lines. (There would be too much.) ---
Binary files /home/pn-cs453/Given/Asgn4/Expected/89 and testminfs.30353 differ


-----------------
90) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0000_Zones /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---


-----------------
91) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0000_Zone /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
M-^]JM-2-:M-^S?8M-6o^XM-7^RM-`^^M-^PM-yM-^R5M-^I^FDM-DyVqM-LM-0QOM-zM-^U24M-3M-(M-0	M-)RM-^GM-,u
^ZM-5M-un2M-KM-^Ea.M-\M-cM-3M-^XM-xM-Hf;M-ipPM-A^EM-[M-+M-ds^AN.M-^TM-qM-MM-OM-^VM-QVM-^IeM-RSM-tM-YM-^Z:}M-CM-jeM-QM-MM-Ix^AM-*M-^Z^Xr
M-^JM-_EM-3M-f8z^?&M-o^\}M-f;M-^N3M-C^SM-m2Xk^[|lM-^\pN4=M-y^RM-HM-PM-n-]M-^OM-:;^zM-^KM-ZM-^IM-f.HM-xqM-^DM-^S*4M-rM-gcM~E^]M-PM-5j^RM-*,M-nM-~|M-EM-J^@^PEM-^H^?DM-G^H:M-AM-^CM-`M-%M-mM-^YQkt^AM-::^CM-j;M-ElM-^FlM-^?M-HL?M-^Uo<
uM-^QM-^QNM-^HozM-^N5GM--^OM-8M-wa^ZQM-xM-rM-|M-WM-iM-n^@M-%+}5M-^SM-a^LM-@{M-^Z.^DM-[FyM-_ZM-{M-OM-,AM-^PM-:=^KM-rM-+M-^UM-dM-TM-%^UM-!M-^K{M-^F^LakGM-$M-BM-*7M-H^?^\K^EM-^Q^Y^VM-^ZM-^X9M-NJM->M-7Gp_lM-^IM-lM-yM-vM-1^N\6^?p^Nx^QM-` 1'M-^HM-pMJM-z~M-4sM-TM-^WM-^EOM-/hBM-^@M-^@RhEM-WM-^ZM-|M-t/M-0M-wM-#zM-jM-eFM-NoM-H+M-:M-^M-^QM-<M-AM-^A4M-mM-^\T0?^?@M-^Q^B^P	f*^Q
M-^B&^CM-2^RP6M-QM-nM-CM-<M-(,nM-)M-w{M-AH{:M-S:%^NpM-^GM-}M-^XM-iM-}^BM-"M-IM-6xM-pM-2M-uM-,M-nE\)^SsF^AGM-^L>YM-^BM-iM-#^O9M-EM-CM-;M-3M-fhM-sM-*M-*ciM-11M-^\M-5M-=[M-D$M-GuM-^UM-Y^\G{IM-_^XM-^EM-nM-^LM--W;\HM-:M-#M-^KM-_bWM/^CM-^PM-"M-~M-^NM-^IM-!M-Z^RM-tM-rM-^JZ^HM-_JM-NM-^@M-ajM-83M-^RM-^LM-^_M-xM-~MM-%^_M-h'M-jcM-k
M-^W.M-G?1M-^AKM-rM-_;M-<M-U&f+M-yM-/(M-A^QM-_kM-W&M-5^^(M-!M-#M-^JM-6!M-}ZVM-s^XM-M$M-^VM-f`8M-f^CM-uM-G@^XvM-b^KM-^X[tM-<^?;^L"M-PM-9M-I1zM-VM-MM-L2^PM-OM-n^XM-$^CM-X^G^D^GgM--4]M- M-AM-^TM-^AM-^MKM-^WM-^S^W|M-y^A^]M-hcM-^^M-_^X^V^@y+M-vM-BM-Ci;M-5M-^?M-~6M-"M-[^Up[M-#^BM-wM-?^MM-^WM-fM-^KM-^[M-/M-fM-A<,M-_M-^IM-b^ZFQM-~M-^OM^_&>#&,M->uyM-kM-dM-&^^M-Z^ChM-9^LM-HM-fM-^\M-^KM-^TM-,M-^LM-LHM-4M-.M-;t iQ^TM-C4<ibM-TM-LnM-TM-^\^_IM-^FQ^L^\^PktM-<^B@M-%M-zuM-[M-^AM-^V]1^^\7=M-`M-^ToM-^ZLM-CtM-J9G^MM-rM-^OM-tM-^DW[=)Q!y4M-_M-zM-nM-^AaBM-PM-yM-^Q1*CT^FM-)[M-BM->mM-j_8M-j^OM-^UM-c=M-^RM-eM-(M-tI^CM->EM-xM--M-"M-M^@M-,M-D}M-^TM-khM-(M-^IfM-1E^_M-]M-^M-^\AM-3M-EM-t^O\^W-1m0M-"OM-vwM-v^GxM-5+"^Do*IM-uTM-^TM-^B*
^\M-F$^@EM-_3+M-pM-cM-{M-QM-^VyM-8M-NM-^AD4M-[M-4M- M-^KM-JuM-#M-hJM-^BpM-^Wd^B^VM-2M-|^?HM-JM-*M-9oNM-|M-&M-RM-H^^
B^AM-^]^@XM-^]OM-@M-VL^]*$i0M-UM-`M-yM-p_"M-3^WM-PM-^SM-7$M-]M-s^K&C:iolimit: output character limit (2048) exceeded.


-----------------
92) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0007_Zones /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
^YM-hM-^F^G hM-8^KM-^QM-u)<M-AM-^Z%M-oz1^FM-bl>0M-l2M-R{M-^WM-6^X7^NM-A(2M-#^OM-U
#^^M-ZM-zoM-+M-nIa{^AM-S^NM-8M-)R?gM-f9(M-jM-VYSM-8^XIXM-RM-^RM-tM-^Vpiu@^RM-^TmM-^IM-P0[^D^GM-HM-VM-QM-^CCC8TM-^Cc6M-^GM-kM-^PM-OM-VM-;#w+M-^R^MiM-!yM-d!B^K^AnM-^VBM- wM-6p"^EJ>0^H!M-^D.M-*^C^SWM-^BM-^LM-^FM-iM-^A<M-a`^YM-^[]M-lM-]%HM-~M-kM-z^@F7HM-^PM-zM-GM-^?>M-0^P^OM-%DHmHmM-Hp5M-!M-^D;
wM-^\<YM-n^\lM-z^?M-7gM-I(^BM-2M-^Lb{%^B^WM-`M-^LM-^@5/^]dM-N6BZM-3yM-xsM-#^\M-'YM-^FM-xM-^F^]_^YM-PM-^?iXM-^K0M-/M-PM-9z^_M-T^VM-eM-hM-g74M-,M-^I^NvM-5^P^G^PM-^OM-%]M-K-M-^?>M-^XM-L%M-$pM-Mu\|M-^^m^VM-mM-zM-.mM-;^\M-^Y,AM->M-.M-CGrM-*dM-!3x1M-Y^RGM-^RM-A^CM^HM-]iaM-"M-^IIu^HM-_
eM-;F]=bM-^IM-'dM-}cM-^VM--M-eM-x^F^HM-SM-+M-^[RJ^[qGM-@M-9^BM-+.^RM-CM-KX-M-^JM-^LM-NM-s^LB}M-^AM-,M-zM-^EM-/I^PM-KM-?^MM-BM-zM-^^vXM-`9M-yLM-'^_M-dM-NM-TM-^^S,^EA{^TBM-aj5i8Hz!GhM-_M-EM-+M-/M-)M-CM-^OSM-]>M-Z2^UX^G^M-9^E^DM-^_?^WM-^]M-^EM--M-|KM-d\M-^Z^KM-gM-qM-~^CM-cM-lQM-^BM-^XoM-'^VM-Ybm^?M-^C9oM-&^K^MM-QxM->M-^SM-^FlM-2M-e^F^CY2-#lM-^M^]j^\M-!K.gIM-^EE^F ^UYM-]^_f`M-^AM-p^ZDM-:M-3^M-aM-{M-^@"^@<
fM-^^cM-^QiM->M-AGaDM-7M-QM-^FM-v^MM-rM-~}M-6M-^YM-4M-uM-=M-'z^RM-vOM-(%M-^FQM-^\FM-^BMM-dpM->mgM-`M-)M-2M-,#6M-eRM-+G_M-$M-^SM-^M-J)DM-"\M-KOZZqPM-4_M-^ZM-vM-^^^FcpM-0M-3M-^YM-P^VM-|M-xzbM-^OM-aM-^MM-&^YM-^|cM-~M-^PM-%M-AM-^O?M-*M-^]KwJ^]JM-bM-8M-^SM-3F^[uM-^QM-^ZM-hM-TDM-<M-xc-&M--NM-JhqM-zM-^\M-$M-<M-^Y\M-7M-.^^M-:nM-`PM-)jC*M-^PGM-^ExM-$fM-^[M-#xcL"M-'^P3+M-0M-^@M-KM-GM-PM-^M-^Oo`M-YD^TM-6M-3M-3eS4eQM-LM-^]pM-\M-^QR^Km^O^NM-nQM-^EM-^Qv^UM-f#M-^_$dMnaM-PM-GaM->M-^^!RM-:v>GM-iM-^TM-^C^S1M-H^[5M-lM-^W+
M-|*M-`^D^FM-ZM-3^]M-`}M-h	M-9M-^[M-bM-TbM-NnM-S"^RmM-QM-FM6PM-LM-$M-^_~M-3M-L^ZBM-y^]yBM-c
M-5G~M-g7M-^TM-(M-FM-Jxz#M-]o;M-^P\M-^\FNBM-oM-`^^M-oM-^UM-h^O^RM-7M-[^MM-^DnoGM-_M-~M--pM-^]M-fM-^R_+M-tM-!vM-oaM-IM- O]M-}(&^?^LM-hcM-NM-IjM-$M-Q*wrlCvM-\M-mGM-WM-BM-BM-^ZwM-^K^EM-K6gM-HM-+'M-%XM-^VM-,M-^RM-}c^Hi^DM-yM-OM-HM-*[M-^UBqfM-^I7#M-LM-1>M-fM-DM-IA^V^_*m^?aM-^KM-`M--^_^]M-^?^G.M-rM-vM-VM-M'M-CZM-vM-^L/^[M-^Dh^AM-^KM-&MM-J}7_M-^IKM-voM-^V'M-h8M-tM-vM--M--^EM-3M-Y>M-Kou>nM-?@Niolimit: output character limit (2048) exceeded.


-----------------
93) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/0010_Zones /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
-4M-bM-))EM-cM-SKM-^@^HM-^\M-sM- yM-C#M-CbM-{M-^W{^BM-d${^M-N8yM-;M-CM-^?M-j1R^DM-ZM-^DJM-3JM-b,_rM-^\^Yp^]M-RNM-vM-^PM-bM-^T\FKM-_;3#GM-^XPM- M-}`M-^FM-rM-4^LM-FM-^NM-!M-^Z^[RM-aM-y^EM-U7M-3M-L^RIM-QM-:M-^Y>aM-hM-{M-sM-^R\^AM-|M-*^?M-QM-/M-XZM-nbTM-3aM-cYErM-IM-_M-BD^N^TdM-e;M-^RqM-!4M-ta^GM-^L]ZdM-3iM-^Yb5B>M-Ht^RM-!X`M-~M-kM-=MM&U)M-^@6uM-VtZM-<:M-^UU^NM-DDVM-^EM-V)^^@M-VM-K^Y0?M-_sHM-3w^?M-^M^QM-j^UnTb<M-AwM-^PM-yM-RM-FM-o^AM-$^WM-->:?M-,M-^PM-1M-GM-=M-%M-[M-&M-AM-{M-LM-3<M-6i^M-&	OM-^CM-"M-SM-xM-Y^\M-R:OM->M-3l0D.KM-BDM-LM-Gh^L*)^_M-lM-sM-:0"3^QUYM-"M-,G*M-TM-]e^DM-e?M-^GM-.M-T^XM-Z^GM-;M-iM-tM-oM-^Hu]^OM-fM-^K M-^\M-^CM-iM-^JM-k|M-^NAiM-_M-^RM-^NM-8^FM-^VM-dM-]l>HM-auM-c{TNM-iM-uM-s_^ZAM-zwM-^@^RM-mM-8;GM-FM-7M-^X6M-%M-^W}^Q^NvJ^C^^F^VLM-Iy>?M-MM-K^HM-~M-^RM-dsM-^GM-^OM-^V#M-D-M-1M-(^SM-^RM- C,^F^]M-+1^DM-9M-^_M-TM-^Ov/@M-GM-r{r",tM-^IM-\M-pM-MM-0M-;bM-=M-w^@Jzc^WM-q@M-zM-U^VM-~M-^GM-^[M-|^NM-^JN^LfV^OM-^MM-kvM-SR!M-GMzM-OM->M-gM-GM-t^\^BlwM-=[M-vM-OM-9M-2M-^_+M-=M-KM-uM-^PM-T^E)jNM-QM-^M-at1M-^\ZqM-FM-(M-(M-^WC^XM-I~M-yM-^PM-lM-^GM-I^AM-QXM-7M-.eM-&M->^A^^M-6:^@J^\M-OM-?M-qM-^MM-^Qu^KM-B*^NM-^VgM-xM-^YM-^?"M-^H^EM-^HM-XAM-L!ZM-jM-^MS>M-QM--Xs'9M-Jzz g^>M-g,gJt^GWp^BxM-!M-v0F(^YM-@\M-SBcM-ooM-&nlQ=M-+M-^S^M-NM-^RM-w\M-_?M- HM-#yM-tM-OM-R?M-'M-k3^SAM-[M-^MM-PrM-;M-+^Th^RM-T`M-^__wM-fM-^JM-l^^S^X;M-}q}M-%M-^QM-^[M-R(^HRM-iO^_D^MM-^E7M-\EbiM-^@^OM-NM-nM-FM-T2M-^K*"O^CM-^Cq^^]D^PVM-^C}M-cM-^ErM-!M-^_M-^BM-GM-^_M-^?M-mM-^SM-xETFNM-^['vM-1M-^GM-^^M-Z2.M-(M-rM-EM-_M- M-i^WRM-^MM-'M-L`M-^HM-hM-Nr6M-^MM-9^Z^F/n8um^^EL	M-yM-jM-b.M-@M-KM-s^RE)M-^Qf]M-rN^GB^KM->TM-\O^KM-{{M-<M-.UWUM-m^Q^\kM-^KM-0M-H!M--M-~M-UM-(M-^]WM-MP;/M-^F[M-^K^HM-q^K\RM-^Z^]M-^HM-lM-M^M-6[^WM-^V\M-SM-4-f	M-yM-)^TM-.M-fM-lM-hM-^Blh%uM-0M-^T^PM-;^@M- ^QM-hM-^GbM-jM--^U,M-^M-"pM-^wM-LM-h1+ ^?M-IDM-$@M-@=M-gmM--.M--M-YM-^NM-*&M-#9M-^VM-^P^AM-yM-t^DM-4M-~M-cvTM-`T^\M-kEM-='^RM-^?M-8^FM-JM-^JpM-^Y.=M-T&KM-z 7M-^M9-M-aM-^PM-,M-RM-aM-hM-^M-^HM-^Es^^Q/4.M-^SM-eM-^Ay^LXQ0M-{cM-^SM-^FRM^_^UM-\[cM-,M-{M-k^AM-^^M-jM-}3+M-xG<AM-^GM-[M-<M-@xM-|M-^N{M-)
M-L^BM-:Miolimit: output character limit (2048) exceeded.


-----------------
94) Files size tests:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Files/1032_Zones /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
LM-^B1N,^OM-gM-\M-^V^@M-^^?M-^K^EM-X M-a^[M-"]C^C|RM-UQM-)M-mM-7^WM-^AIoM-*>M-^VmM->^[M-@cM-X.@;M-umlgM-l^_M-^TM-=M-^[M-mM-!SM-=$:M-xM-*M-^?M-%M-67Ln9M-AM-^[^Y96j.yM-^TM-4M-H^SM-^KgM-^G+M-UdM-^^M-r^PM-d6=;`bM-^PM-{M-^ILcM-^O.M-iuM-1jM-^J"M-ITM-^IM-Q^U@M-JM-nM-3M-\M-^?GQ^R^OM-Oqu*M-hk"J#M-2M-^BM-JY^QM-;7WJM-^PM-;M-%M-iM-^OM-^T{M-.M-WzN[JM-{^GM-c2v6x^VrM-^M-#9RM-r:^CM-2M-_ZqVM-c9h{?M-&M-_M-^MM-<M-t7M-^\S^KM-vB^FM-^K^^M-YM-^GgM-^KM-|M-aM-<^MM-^F^DJM- qM-e~lAM-^AM-Q/^RM-wM-^jM-sM- X%^D^AM-0k^ZM-sM-&xTM-MVM-/&M-+'^V@_/q%^RM-MM-GM-C^N5LM-IM-5M-K^AM->M-sM-^U^TkM-ZM-@M-gM-^^M-?^BM-2,V^DVM-3M-w^QM-^Q^W^ZM-I"wlM-^_TM-`M--M-^TXM-^^ZM-^JM-tM-^OjM-^V^QM-^EcM-LM-B^UM-C\^RM-tM-!M-JM-2M-LM-^\M-^QKM-jM-3^?M-^JM-gr	^StI\^_<
M-\`M-JTM-n+$b^SM-^C'M-^@yM-^OM-gM-^HM-^F^UM-<M-x^MM-4M-^?gxXM--}$M-o38^PmgM-bM-^ZM-.M-&M-&M-/pM-^@M-^@M-^J^Ts^M-^AM-4P^MzRM-p>M-wM-^U^GyM-c^QM-XM-(^A	jvM-?M-/pM-~M-^@7)M-^C~M-Y^R\M-^UM-/M-#bM-wM-^QM-`M-^DM-(M-=M-^_"SM-~CM-|M-EM-^IM-7.M-jM--`M-^[M-^XM-^DM-(M-^FM-OM-BZ^PM-~^?M-^RM-tSQIM-2M-^T^_^[M-~TM-W$@|M-^GM-^^^lM-<M-^F^NM-[5M-^\M-RFM-NuM-;M-eM-2M-(M-&M-^?M-UM-^Y&wZ(M-^P^FM-uM-*eM-!M-$^UM-9M-^[N6]M->B^E@=^TM-{M-}M-LM-{M-7hM-DM-TM-^F^NM-r^QM-:M-YM-FpM-]WG|M-KM-^W#M-`TjM-cM-3EhM-^YM-BM-t}M-6M-^T6^HM-^O,M-^Uj|M-W^R5M-)M-:M-TsM-NM-^HM-e1^_M-VM-eM-/M-\M-rvM-YM-/M-?\(M-^Mi^@zM-^]M-n^[OnM-miM-WM-uM-^K^XM-pkM-^H|\^X:	M-6=L^QM-c
M-YM-^D>M-^ M-pvIM-d^]L^?>M-(M-XM-g#XvM-N{M-#^SM-nwM-^O9_M-@M-\M-!M-^\6TM-kM-qM-.M-#5^ZM-$lM-^?M-^H^N42M-)^T^H~=|	l^DM-iM-^KM-o\DM-?M-.M-v|M-Z~M-/pbM-B^HM->JM-*[M-g$M-^JH@M-j^LM-hM-(1^X_M-e M-m3D)M-]~M-^KVF`^OM-JM-&68M-zM-^GM-kyM-^QMM-^\M-dM-YM-{M-: 78EmM-|M-^JM-6@M-[M-JA#c/m,^HM-:^FM->M-I9^ZM-]@M-* M-.M-t	M-^CM-^_M-^U0&M-x	^KM-EzM-J3cM-j07M-a^D^Ffq^L@M-&M-)M-[M-XM-!^^LM-4M-^GM-^L&M-yM-!M-^TM-1M-^GM-@M-B^_^KZ]{
D{M-,M-dM-^ZM-YM-a^AhM-c]@M-/^D:YhM-^JgM-*M-XmM-0M-VJ^ZM-cM-&M-^GM-^\ M-wM-5^:M-{M-1M-hB^TOM-bt^DM-mKM-Ic3M-!SM-^LM-kK^PM-~XS*IM-'FM-y,M-wdM-ZzM-wM-^^eeQyM-PMM-jM-LM-vM-^\M-^JUM-pmLM-^MM-^HM-^KM-|aM-^]TM-SM-'$^H^LM-)$M-LH	cM-$^G+b3^F7M-klM-;M-(DZ^UWM-*fM-^TQK(M-^YM-^]M-3M-^^Ve^T^BM-vPPMiolimit: output character limit (2048) exceeded.
Diffs: ( < Reference > Testfile ):
 --- Output limited to 10 lines. (There would be too much.) ---
Binary files /home/pn-cs453/Given/Asgn4/Expected/94 and testminfs.30353 differ


-----------------
95) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/nohole         /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
Before the hole.
^@^@^@^@^@^@^@^@^@^@After the hole.


-----------------
96) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/direct         /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
Before the hole.
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^iolimit: output character limit (2048) exceeded.


-----------------
97) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/into-indirect  /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
Before the hole.
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^iolimit: output character limit (2048) exceeded.


-----------------
98) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/whole-indirect /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
lseek: Invalid argument
Program exited with bad status: 256


-----------------
99) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/double         /dev/stdout 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
lseek: Invalid argument
Program exited with bad status: 256


-----------------
100) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/nohole 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
Before the hole.
^@^@^@^@^@^@^@^@^@^@After the hole.


-----------------
101) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/direct 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
Before the hole.
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^iolimit: output character limit (2048) exceeded.


-----------------
102) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/into-indirect 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
Before the hole.
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^iolimit: output character limit (2048) exceeded.


-----------------
103) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/whole-indirect 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
lseek: Invalid argument
Program exited with bad status: 256


-----------------
104) Reading files with holes:
     minget /home/pn-cs453/Given/Asgn4/Images/Files /Holes/double 
-----------------
Test program output:
 --- Output limited to 10 lines. (There would be too much.) ---
lseek: Invalid argument
Program exited with bad status: 256
FAILED.


