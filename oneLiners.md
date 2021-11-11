# Xargs command

## Create a tar file with all the images in current folder and all child folders

    find . -type f name '*.png' -print0 | xargs -0 tar -czvf images.tar.gz 
    
## List _N items_ per line

    echo {1..20} | xargs -n 3
    
## Copy a file to multiple folders at once

    echo folder1 folder2 | xargs -n1 cp -v file-2-copy.ext 
    
    This will copy file file-2-copy.ext  to folder1 folder2
