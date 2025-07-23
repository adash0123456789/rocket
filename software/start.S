.section .text
.global _start
_start:
  // boot up, call main, halt when finished
  jal zero, main
1: j 1b