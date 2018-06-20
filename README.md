# simtel_random_imei
Simtel 7100 modem IMEI can be changed. This script uses Osmocom TAC database to make real IMEIs.

Remember to check your local legislation; this might be illegal in your country. 

Usually changing IMEI is needed to circumvent network operator restrictions in many countries.

You should never use zeroes as IMEI; most operators do not let such device to work; therefore you need legit-looking IMEI.

Using arbitrary or non-existing IMEI can cause odd side effects from law enforcement contacting you or terminating your mobile subscription.

This script helps you make valid looking IMEI code. You have a slight chance to hit stolen or blacklisted IMEI, but hey, you have a minor chance to win in the national lottery!

Use at your own risk.
Use with caution!

This script is written with and for Raspberry Pi.

The modem devkit is available from ebay:
https://www.ebay.com/itm/SIM7100E-MINI-PCIE-To-USB-Adapter-sim-card-slot-U-FL-pigtail-SMA-Antenna/282929860318?ssPageName=STRK%3AMEBIDX%3AIT&_trksid=p2060353.m2749.l2649
