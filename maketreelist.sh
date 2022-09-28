#########################################################################
# File Name: create.sh
# Created Time: Fri 08 May 2015 03:32:02 AM PDT
#########################################################################
#!/bin/bash
#  mkdir report csh err list log production
date
rm -f treelist.list
ls /star/data05/scratch/dchen/Ana/19p6GeV/maketrees/production/*.root > treelist.list
#ls /star/data01/pwg/dchen/Ana/19p6GeV/maketrees/production_Jul21_2022/*.root > treelist.list
date
