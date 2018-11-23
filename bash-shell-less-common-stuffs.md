
### Bash variable assignment with a default value in a single command

    BUILD_USER=${user:-some-default-user}  
   if variable **user** is set, it will be assigned to BUILD_USER otherwise **some-default-user** will be assigned.  
   If **user** is not set **some-default-user** will be assigned

    ${variable:-word} 
   indicates that if `variable` is set then the result will be that value. If variable is not set then `word` will be the result. 
   
    ${variable:+word} 
   indicates that if variable is set then `word` will be the result, otherwise the result is the **empty string**.


**CLI tips:**

Replace a word of previous command and run:

    > ls one two three
    > ^one^four     ; this is equalent to replacing one from previous command to four and run it.
                    ; **Press Alt+^ to expand the command before execution.**
                    ; This will find and replace first instance of *one* only.
Replace all occurences of a last command with a new string:

    > ls -ld Desktop work Downloads Desktop
    > !!:gs/Desktop/git     ; this will replace all Desktop with git
                            ; Expand the command without executing it by pressing Alt+^

Open previous 2 commands in EDITOR:

    > fc -2 -1      ; this is open last 2 commands(previour 2 to previous 1) in your EDITOR, once you edit and write quit, that will be executed.
