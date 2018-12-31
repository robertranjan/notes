**Create a tar file with all the images in current folder and all child folders**

  find . -type f name '*.png' -print0 | xargs -0 tar -czvf images.tar.gz 
