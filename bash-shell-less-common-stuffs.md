
## Bash varibale assignment with a default value in a single command
BUILD_USER=${user:-some-default-user} 
  ; if variable `user` has some value, it will be assigned to variable `BUILD_USER`. If `user` is not defined value `some-default-user` will be assigned to $BUILD_USER
