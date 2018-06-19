#!/bin/bash

# Takes one row from tacdb.csv and builds real -looking IMEI code.
# File can be found from http://tacdb.osmocom.org
# choose CSV -file.

# It takes 8 first numbers from Osmocom TAC database, and adds 7 random numbers at the end.
# 15 characters is then passed on to setimei.pl that makes checksum.
# Check more from setimei.pl

FILE="./tacdb.csv"
ROWS=$(cat $FILE|wc -l)			# how many rows there are in database?
echo ============================================================
echo
echo "$ROWS models available"
echo
IMEI=$(($RANDOM % $ROWS))		# random number from 1 - ROWS
RIVI=$(sed -n ${IMEI}p < $FILE)		# take random line from file
IMEI=$(echo $RIVI|cut -f 1 -d ",")	# take tacs info, 8 first characters to match manufacturer info
BRAND=$(echo $RIVI|cut -f 2 -d ",")	# manufacturer
MODEL=$(echo $RIVI|cut -f 3 -d ",")	# model
URL=$(echo $RIVI|cut -f 7 -d ",")	# URL providing more info about phone
RAND=$(($RANDOM % 9999999))		# tee seitsemän satunnaislukua
RESULT=$(echo 0000000$RAND | tail -c 7)	# building the rest of the IMEI code..
IMEI=$IMEI$RESULT			# IMEI code without checksum

echo  Setting random IMEI -code to modem, specified in setimei.pl
echo
echo  The network now thinks your modem is:
echo  $BRAND $MODEL
echo
echo  More information about the modem/phone is available from:
echo  $URL
echo
echo  IMEI:
./setimei.pl $IMEI
echo
echo ============================================================
