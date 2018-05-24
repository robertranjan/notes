# Linux commands 

## WHICH command:
  `which` looks through current `path` and show the first entry.

  Try `which -a <binary_name>` to list out all entries.

  `whereis` can be an alternative to which in some cases.

  Article:
    1. https://www.lifewire.com/linux-which-command-4062680
    
### Usage: 
    which less
    which less pwd top ...
    which -a less 

## BASH command search sequence  
When you run a command in bash shell, bash look for Alias, built-in functions and binaries in the PATH. Here is the order:
  1. First looks for alias
  2. Next looks for shell built-ins or shell functions.
  3. Then looks for scripts/binaries.
  Article:
    https://www.cyberciti.biz/tips/an-example-how-shell-understand-which-program-to-run-part-ii.html

## FIND

  Usage: `find <where-to-look> <what-to-find> <what-to-do>`  

  Article: https://www.quora.com/How-does-the-find-command-work
