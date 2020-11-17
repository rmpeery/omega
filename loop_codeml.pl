#!/opt/local/bin/perl -w
# script by RPeery 30 Sept 2020

use strict;

# modify script call with yes \n to loop
# without usser input for stop codons from
# https://groups.google.com/g/pamlsoftware/c/HNx4O_YMHVA?pli=1

# To use: yes \n | perl loop_codeml.pl 10kb.tre 

opendir(DIR, ".");
my @files = grep(/\.phy$/,readdir(DIR));
closedir(DIR);

my $file = ();
my $tre = shift;
# hard coded right now add as stdin later
#my $pathDir = "nucl_aln_phy/";
#my $pathTre = "treeFiles/";
#my $pathOut = "codemlOut/";

# settings for one value per gene based on suggestion here:
# https://www.researchgate.net/topic/PAML

# had to mkdir codemlOut before script would run
# idea for writing config files came from Mariya Shcheglovitova
# https://github.com/mshcheg/PAMLpipeline/blob/master/paml.pipe.sh
foreach $file (@files) {
	open OUT, ">$file.codeml.ctl";
	print OUT ("seqfile = path/$file
	treefile = path/$tre
	outfile = path/$file.cml.out.txt
	noisy = 9
	verbose = 1
	runmode = 0
	seqtype = 1
	CodonFreq = 2
	clock = 1
	* aaDist = 0
	* aaRatefile = wag.dat
	model = 0
	NSsites = 0
	icode = 0
	Mgene = 0
	fix_kappa = 0
	kappa = 1
	fix_omega = 0
	omega = 1
	fix_alpha = 1
	alpha = 0
	Malpha = 0
	ncatG = 10
	getSE = 0
	RateAncestor = 0
	Small_Diff = .5e-6
	cleandata = 1
	fix_blength = 0\n");
	my $cmd = "path/codeml $file.codeml.ctl";
	system($cmd);
	close OUT;
	}
print "done\n";

#seqfile = path/infile.phy
#treefile = path/treefile.tre
#outfile = path/outfile.cml.out.txt
#noisy = 9 * what to print to screen 9 = a lot
#verbose = 1 * detailed output
#runmode = 0 * user defined tree
#seqtype = 1 * codons
#CodonFreq = 2 * F3X4
#clock = 1 * clock, rooted tree
#aaDist = 0
#aaRatefile = wag.dat
#model = 0 * one omega ratio for all branches
#NSsites = 0 * one omega ratio
#icode = 0 * universal code
#Mgene = 0 * rates
#fix_kappa = 0 * estimated
#kappa = 1 * initial kappa
#fix_omega = 0 * estimated
#omega = 1 * initial omega
#fix_alpha = 1
#alpha = 0
#Malpha = 0
#ncatG = 10 * of site categories for M7 and M8
#getSE = 0 * don't want SE est
#RateAncestor = 0
#Small_Diff = .5e-6
#cleandata = 1 * remove sites with ambiguity data
#fix_blength = 0 * ignore
