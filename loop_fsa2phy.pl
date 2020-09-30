#!/usr/bin/perl -w
# R Peery 30 Sept 2020
use strict;

opendir(DIR, ".");
my @files = grep(/\.fasta$/,readdir(DIR));
closedir(DIR);

my $file = ();

foreach $file (@files) {
	my $cmd = "perl fsa2phy.pl $file";
	system($cmd);
	}
print "done\n";
