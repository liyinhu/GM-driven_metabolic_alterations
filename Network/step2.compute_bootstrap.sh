python /Software/SparCC3/MakeBootstraps.py genus_WT.txt -n 100 -t permutation_wt_#.txt -p ./Resamplings/

for i in {0..99}; do python /Software/SparCC3/SparCC.py ./Resamplings/permutation_wt_$i.txt -i 10 --cor_file=/Bootstraps/sparCC_cor_wt_$i.txt; done

python /Software/SparCC3/MakeBootstraps.py genus_AD.txt -n 100 -t permutation_ad_#.txt -p ./Resamplings/

for i in {0..99}; do python /Software/SparCC3/SparCC.py ./Resamplings/permutation_ad_$i.txt -i 10 --cor_file=/Bootstraps/sparCC_cor_ad_$i.txt; done
