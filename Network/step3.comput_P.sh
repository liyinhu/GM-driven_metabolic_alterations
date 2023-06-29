python /Software/SparCC3/PseudoPvals.py WT_sparcc.txt ./Bootstraps/sparCC_cor_wt_#.txt 100 -o WT_sparcc_p_two_sided.txt -t 'two_sided'  >> sparcc_wt.log

python /Software/SparCC3/PseudoPvals.py AD_sparcc.txt ./Bootstraps/sparCC_cor_ad_#.txt 100 -o AD_sparcc_p_two_sided.txt -t 'two_sided'  >> sparcc_ad.log
