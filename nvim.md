VIM

Buffer to tab:

    :tab ball       ; open all buffers in tabs
    :tabo           ; close all other tabs
    :tabonly        ; close all other tabs

Tab Navigation:
```
  :tabs         list all tabs including their displayed windows
  :tabm 0       move current tab to first
  :tabm         move current tab to last
  :tabm {i}     move current tab to position i+1

  :tabn         go to next tab
  :tabp         go to previous tab
  :tabfirst     go to first tab
  :tablast      go to last tab
```

In normal mode:

    gt            go to next tab
    gT            go to previous tab
    {i}gt         go to tab in position i
