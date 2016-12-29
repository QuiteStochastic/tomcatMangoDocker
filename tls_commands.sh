
##How to generate your own CA root cert and sign certs with it, based off of: https://jamielinux.com/docs/openssl-certificate-authority/create-the-intermediate-pair.html

##and this: https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs

##generate the private key of your root
openssl genrsa -aes256 -out ca_key.pem 4096
##I set the pw to "asdf".  
##remove the -aes256 for no pw


##generate the cert off the previously generated root private key
openssl req -key ca_key.pem -new -x509 -days 7300 -sha256 -extensions v3_ca -out ca_cert.pem


##skipping making the intermediate key pair because this is just exploratory stuff


##do some nonsense to make openssl happy
mkdir -p demoCA/newcerts
touch demoCA/index.txt
touch demoCA/serial
echo 1000 > demoCA/serial
##go into intex.txt.attr and set unique_subject = no, or else it will demand unique common names


##create a private key for tomcat
openssl genrsa -out tomcat_key.pem 2048
##create CSR, make sure you give it a Common Name but everything else can be left blank.  for wildcard host, put * as the common name
openssl req -key tomcat_key.pem -new -sha256 -out tomcat_csr.pem
##sign with root CA
openssl ca -cert ca_cert.pem -keyfile ca_key.pem -days 375 -notext -md sha256 -in tomcat_csr.pem -out tomcat_cert.pem

##package private key pem, cert pem, and CA pem to pkcs12
openssl pkcs12 -export -out tomcat.p12 -inkey tomcat_key.pem -in tomcat_cert.pem -certfile ca_cert.pem
##password is set as "qwertyu"


##do the same stuff as right above but for mongo
openssl genrsa -out mongo_key.pem 2048
openssl req -key mongo_key.pem -new -sha256 -out mongo_csr.pem
openssl ca -cert ca_cert.pem -keyfile ca_key.pem -days 375 -notext -md sha256 -in mongo_csr.pem -out mongo_cert.pem

##put private and public keys for mongo in same pem file
cat mongo_key.pem mongo_cert.pem > mongo.pem