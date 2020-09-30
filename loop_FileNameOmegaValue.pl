#!/opt/local/bin/perl -w
# scripted on 30 Sept 2020 by R Peery

use strict;

opendir(DIR, ".");
my @files = grep(/\.txt$/,readdir(DIR));
closedir(DIR);

my $file = ();

foreach $file (@files) {
	my $cmd = "ls $file >> omegaSummary | grep 'omega (dN/dS) =  ' $file >> omegaSummary";
	system($cmd);
	}
print "done\n";

#rna-XM_027980314.1_algn.fasta.phy.cml.out.txt
#ls rna-XM_027980314.1_algn.fasta.phy.cml.out.txt >> omegaSummary.txt | grep 'omega (dN/dS) =  ' rna-XM_027980314.1_algn.fasta.phy.cml.out.txt >> omegaSummary.txt
