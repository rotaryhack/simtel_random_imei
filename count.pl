#!/usr/bin/perl
use strict;
#
# Finds Luhn checksum for the number provided
#
my $number = shift(@ARGV) || die("Usage: $0 <number>\n");
$number=~s,[^0-9],,g;
my($sum,$odd);
foreach my $n (split(//,$number)) {
        $odd=!$odd;
        if($odd) {
                $sum+=$n;
        } else {
                my $x=2*$n;
                $sum+=$x>9?$x-9:$x;
        }
}
my $ok = 0+(($sum%10)==0);
exit(($sum%10)!=0);
