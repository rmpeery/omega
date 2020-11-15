#!/opt/local/bin/perl -w
# script by RPeery 30 Sept 2020

use strict;

#Use: yes \n | perl LoopTest.pl 10kb.tre 

opendir(DIR, ".");
my @files = grep(/\.phy$/,readdir(DIR));
closedir(DIR);

my $file = ();
my $tre = shift;
# hard coded right now add as stdin later
#my $pathDir = "nucl_aln_phy/";
#my $pathTre = "treeFiles/";
#my $pathOut = "codemlOut/";

# to loop without usser input about stop codons per CDS used suggestion from
# https://groups.google.com/g/pamlsoftware/c/HNx4O_YMHVA?pli=1

# settings for one value per gene based on suggestion here:
# https://www.researchgate.net/topic/PAML
foreach $file (@files) {
	open OUT, ">$file.codeml.ctl";
	print OUT ("seqfile = nucl_aln_phy/$file\ntreefile = treeFiles/$tre\noutfile = codemlOut/$file.cml.out.txt\nnoisy = 9\nverbose = 1\nrunmode = 0\nseqtype = 1\nCodonFreq = 2\nclock = 0\naaDist = 0\naaRatefile = wag.dat\nmodel = 0\nNSsites = 0\nicode = 0\nMgene = 0\nfix_kappa = 0\nkappa = 1\nfix_omega = 0\nomega = 1\nfix_alpha = 1\nalpha = 0\nMalpha = 0\nncatG = 10\ngetSE = 0\nRateAncestor = 0\nSmall_Diff = .5e-6\ncleandata = 1\nfix_blength = 0\nmethod = 0\n");
	my $cmd = "./codeml $file.codeml.ctl";
	system($cmd);
	close OUT;
	}
print "done\n";

