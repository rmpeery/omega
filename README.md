# omega
Calculating genomic dN/dS ratios in sheep

loop_codeml.pl: uses a loop to iterate through a directory of alignments and run codeml on each gene file. The codeml configuration file is for calculating the overall omega value for a gene.
The issue of needing a stdin for stop codons was solved here: https://groups.google.com/g/pamlsoftware/c/HNx4O_YMHVA?pli=1

loop_FileNameOmegaValue.pl: uses a loop to iterate through a directory and write out the file name and the omega value for each file to generate a data matrix.


The paml package can be found here: http://abacus.gene.ucl.ac.uk/software/paml.html and the manuscript is here: https://doi.org/10.1093/molbev/msm088.
