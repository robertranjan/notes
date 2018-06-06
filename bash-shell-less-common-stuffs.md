
### Bash varibale assignment with a default value in a single command

    BUILD_USER=${user:-some-default-user}  
   ; if variable `user` has some value, it will be assigned to variable `BUILD_USER`.   
   ;  If `user` is not defined value `some-default-user` will be assigned to `BUILD_USER`

    ${variable:-word} 
   indicates that if variable is set then the result will be that value. If variable is not set then word will be the result.
    ${variable:+word} 
   indicates that if variable is set then word will be the result, otherwise the result is the empty string.
