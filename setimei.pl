#!/usr/bin/perl
#
# This script is written with PERL, because it provides the easiest way to acces USB -ports.
#
# Gives AT+SIMEI -command to set IMEI code in Simtel 7100.
#

use Device::SerialPort;

# Serial port. Use by-path, this way the required port will be found from the same place 
# every time. If you move USB -connector to different port, you need to find by-path again.

$PORT="/dev/serial/by-path/platform-3f980000.usb-usb-0:1.3:1.2-port0";

$ob = Device::SerialPort->new($PORT);

$nr=$ARGV[0];

if($nr=~ m/^\d{14}$/){

# try checksums and exit when correct is found
for ($i = 0; $i < 10; $i++) {

 $imei=$nr.$i;
 $ehd="./findchecksum.sh ".$imei;
 $ok=`$ehd`;

 if($ok==1){
  print $imei."\n";
  $ob->write("at+simei=$imei\r");
  sleep 1;
  print my $result = $ob->input;
  $ob->write("at+simei?\r");
  sleep 1;

  print "IMEI code is now:";
  print my $result = $ob->input;

 };
}


}else{
print "Finds IMEI checksum.

From 2004, the format of the IMEI is AA BBBBBB CCCCCC D.
TAC 	SERIAL 	CHECK DIGIT
AA BBBBBB 	CCCCCC 	D

In any of the above cases, the first two digits of the TAC are the Reporting Body Identifier, which identifies the GSMA-approved group that allocated the TAC. The RBI numbers are allocated by the Global Decimal Administrator. The first two digits are always decimal (i.e., less than 0xA0), allowing IMEI numbers to be distinguished from an MEID, which will always have 0xA0 or larger as its first two digits.

Example of IMEI number [35]-[780502]-[398494]-[2] structure:

For example
APPLE iphone 6 IMEI: TAC: 35 9305 FAC: 06 SNR: 200013 CD: 8 

35 is reporting body identifier.
9305 06 manufacturer and brand (phone type)
200013 serial number
2 check digit

Usage:

imei.pl [14 digits]

Sample:

./imei.pl 12345123451234

Make sure to build IMEI that means something. Avoid totally random IMEI.
You may have funny side-effects with bizarre IMEI.
To make sure you have sensible IMEI, use instead randimei.sh provided.

";
}
