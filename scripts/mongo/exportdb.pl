#!/usr/bin/perl

use strict;
use warnings;

if ($#ARGV + 1 < 2 ) {
	print "You must provide the database name in the first paramenter.\n";
	exit;
}

my $dbName = shift @ARGV;
my $collections = $ARGV[1];


foreach my $collection(@ARGV) {
    print("Exporting $collection...\n");
    my $command = "mongoexport --db $dbName -c $collection --out ./$dbName.$collection.json";
    system($command);
}
print("Finished\n");
