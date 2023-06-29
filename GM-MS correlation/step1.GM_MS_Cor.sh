#activate your mmvec environment
biom convert -i ./genus.relate_abundance.txt -o ./genus.RA.biom --table-type="Taxon table" --to-json
biom convert -i ./metabolites_Feces.txt -o ./Feces.MS.biom --table-type="Metabolite table" --to-json
mmvec paired-omics \
        --microbe-file ./genus.RA.biom \
        --metabolite-file ./Feces.MS.biom \
	--min-feature-count 2 \
	--num-testing-examples 2 \
	--batch-size 9 \
        --summary-dir GM_MS_summary
