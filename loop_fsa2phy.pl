#!/usr/bin/perl -w
# R Peery 30 Sept 2020
# converting fasta to phylip with script
# obtained from Yu-Wei's Bioinformatics playground 
# http://yuweibioinfo.blogspot.com/2009/01/fasta-to-phylip-converter.html
# fsa2phy.pl


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
