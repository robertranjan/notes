
Create key and csr:

**Password in cli:

    openssl req -new -passout pass:"Pomegranate" -keyout example1.key -subj "/CN=sample.myhost.com" -out newcsr.csr -sha512 -newkey rsa:2048

**password in env variable:

    openssl req -new -passout env:PASSWORD -keyout example1.key -subj "/CN=sample.myhost.com" -out newcsr.csr -sha512 -newkey rsa:2048

**password in file:

    openssl req -new -passout file:password-mycompany-com.txt -keyout mycompany.com.key -subj "/CN=.mycompany.com" -out mycompany.com.csr -sha512 -newkey rsa:2048

**with config file and a private key:

    openssl req  -config sample.openssl.cnf -out mysite.csr -key mysite.key -new -sha256

**verify key:**

    openssl rsa -in example1.key

**Config file:**

    [req]
    distinguished_name = req_distinguished_name
    req_extensions = v3_req

    [req_distinguished_name]
    commonName = Common Name
    commonName_default = myapp.mycompany.com
    commonName_max   = 64
    C=<COUNTRY>
    ST=<STATE>
    L=
    O=
    OU=
    CN=myapp.mycompany.com

    [ v3_req ]
    # Extensions to add to a certificate request
    basicConstraints = CA:FALSE
    keyUsage = nonRepudiation, digitalSignature, keyEncipherment
    subjectAltName = @alt_names

    [alt_names]
    DNS.1 = one.mycompany.com
    DNS.2 = two.mycompany.com

**Create key and cert:**

    openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

**Create a self signed certificate (notice the addition of -x509 option):**

    openssl req -config example-com.conf -new -x509 -sha256 -newkey rsa:2048 -nodes \
        -keyout example-com.key.pem -days 365 -out example-com.cert.pem
        
**Create a signing request (notice the lack of -x509 option):**

    openssl req -config example-com.conf -new -sha256 -newkey rsa:2048 -nodes \
        -keyout example-com.key.pem -days 365 -out example-com.req.pem

**Print a self signed certificate:**

    openssl x509 -in example-com.cert.pem -text -noout
    
**Print a signing request:**

openssl req -in example-com.req.pem -text -noout
