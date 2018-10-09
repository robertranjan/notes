
# Navigation / History

## Play with History

### CLI search back and forth - ctrl+r and ctrl+s
stty -ixon

### re-run previous command
!!

### get the last argument from last command
!$

### get all the arguments from last command
!-1:1*

## Navigation

    CTRL+a  ; move cursor to start of line
    Ctrl-e  ; go to the end of line
    Alt-b   ; skip one word backward
    Alt-f   ; skip one word forward
    Ctrl-u  ; delete to the beginning of line
    Ctrl-k  ; delete to the end of line
    Alt-d   ; delete to the end of word
    Ctrl+w  ; delete upto previous space

    Ctrl + y – paste word or text that was cut using one of the deletion shortcuts (such as the one above) after the cursor
    Ctrl + xx – move between start of command line and current cursor position (and back again)
    Alt + b – move backward one word (or go to start of word the cursor is currently on)
    Alt + f – move forward one word (or go to end of word the cursor is currently on)
    Alt + d – delete to end of word starting at cursor (whole word if cursor is at the beginning of word)
    Alt + c – capitalize to end of word starting at cursor (whole word if cursor is at the beginning of word)
    Alt + u – make uppercase from cursor to end of word
    Alt + l – make lowercase from cursor to end of word
    Alt + t – swap current word with previous
    Ctrl + f – move forward one character
    Ctrl + b – move backward one character
    Ctrl + d – delete character under the cursor
    Ctrl + h – delete character before the cursor
    Ctrl + t – swap character under cursor with the previous one

Command Editing Shortcuts

    Ctrl + a – go to the start of the command line
    Ctrl + e – go to the end of the command line
    Ctrl + k – delete from cursor to the end of the command line
    Ctrl + u – delete from cursor to the start of the command line
    Ctrl + w – delete from cursor to start of word (i.e. delete backwards one word)
    Ctrl + y – paste word or text that was cut using one of the deletion shortcuts (such as the one above) after the cursor
    Ctrl + xx – move between start of command line and current cursor position (and back again)
    Alt + b – move backward one word (or go to start of word the cursor is currently on)
    Alt + f – move forward one word (or go to end of word the cursor is currently on)
    Alt + d – delete to end of word starting at cursor (whole word if cursor is at the beginning of word)
    Alt + c – capitalize to end of word starting at cursor (whole word if cursor is at the beginning of word)
    Alt + u – make uppercase from cursor to end of word
    Alt + l – make lowercase from cursor to end of word
    Alt + t – swap current word with previous
    Ctrl + f – move forward one character
    Ctrl + b – move backward one character
    Ctrl + d – delete character under the cursor
    Ctrl + h – delete character before the cursor
    Ctrl + t – swap character under cursor with the previous one

Command Recall Shortcuts

    Ctrl + r – search the history backwards
    Ctrl + g – escape from history searching mode
    Ctrl + p – previous command in history (i.e. walk back through the command history)
    Ctrl + n – next command in history (i.e. walk forward through the command history)
    Alt + . – use the last word of the previous command

Command Control Shortcuts

    Ctrl + l – clear the screen
    Ctrl + s – stops the output to the screen (for long running verbose command)
    Ctrl + q – allow output to the screen (if previously stopped using command above)
    Ctrl + c – terminate the command
    Ctrl + z – suspend/stop the command
    Bash Bang (!) Commands
    Bash also has some handy features that use the ! (bang) to allow you to do some funky stuff with bash commands.

    !! – run last command
    !blah – run the most recent command that starts with ‘blah’ (e.g. !ls)
    !blah:p – print out the command that !blah would run (also adds it as the latest command in the command history)
    !$ – the last word of the previous command (same as Alt + .)
    !$:p – print out the word that !$ would substitute
    !* – the previous command except for the last word (e.g. if you type ‘find some_file.txt /‘, then !* would give you ‘find some_file.txt‘)
    !*:p – print out what !* would substitute


### fix previous command
    fc ; open previous command in your $EDITOR. Once edited, just save and exit to run
    
Sources:
 1. https://www.skorks.com/2009/09/bash-shortcuts-for-maximum-productivity/
 2. https://askubuntu.com/questions/45521/how-to-navigate-long-commands-faster
