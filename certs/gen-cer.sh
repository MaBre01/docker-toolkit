#!/bin/bash

password=123456
domain=local

country=FR
state=Local
locality=Local
organization=Local
organizationalunit=LOC
email=local@local.local

echo "Generating key request for $domain"
openssl genrsa -des3 -passout pass:$password -out $domain.key 2048

echo "Removing passphrase from key"
openssl rsa -in $domain.key -passin pass:$password -out $domain.key

echo "Creating CSR"
openssl req -new -key $domain.key -out $domain.csr -passin pass:$passwordi \
	-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$domain/emailAddress=$email"