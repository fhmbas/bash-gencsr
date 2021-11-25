#!/bin/bash
#25/Nov/2021 generate CSR & KEY

NAMEDIR=csrkey
if [ -d "$NAMEDIR" ]; then
	cd csrkey
	echo `pwd`
	else
	bash -c "mkdir csrkey"	
fi
read -p "Nama domain: " DOMNEM
read -p "Kode Negara [Kode Indonesia ID]: " NGR
read -p "Provinsi: " PROV
read -p "Kota/Kab: " CITY
read -p "Organisasi: " CORP
DOMFIX=`tr '.' '_' <<< $DOMNEM`
DOMCSR="$DOMFIX.csr"
DOMKEY="$DOMFIX.key"
openssl req -new -newkey rsa:2048 -nodes -out $DOMCSR -keyout $DOMKEY -subj "/C=$NGR/ST=$PROV/L=$CITY/O=$CORP/CN=$DOMNEM"
#echo "$DOMNEM, $NGR, $PROV, $CITY, $CORP"
