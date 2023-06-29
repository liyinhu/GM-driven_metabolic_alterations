##Under qiime2-2020 environment
qiime metadata tabulate \
        --m-input-file ./GM_feces_summary2/conditionals.qza \
        --o-visualization ./Feces_conditionals_viz.qzv

qiime emperor biplot \
        --i-biplot ./GM_feces_summary2/conditional_biplot.qza \
        --m-sample-metadata-file ./metabolites_metadata_Feces.txt \
	--m-feature-metadata-file ./genus_metadata.txt \
	--p-number-of-features 6 \
	--p-ignore-missing-samples \
        --o-visualization ./Feces_emperor.qzv

qiime mmvec heatmap \
  --i-ranks ./GM_feces_summary2/conditionals.qza \
  --m-microbe-metadata-file ./genus_metadata.txt \
  --m-microbe-metadata-column Phylum \
  --m-metabolite-metadata-file ./metabolites_metadata_Feces.txt\
  --m-metabolite-metadata-column Class\
  --o-visualization ./Feces_ranks_heatmap.qzv

qiime mmvec summarize-single \
        --i-model-stats ./GM_feces_summary2/model_stats.qza \
	--o-visualization ./Feces_model_summary.qzv

        --o-visualization ./Serum_emperor.qzv


##Q2 calculation
qiime mmvec paired-omics \
        --i-microbes ./genus.qza \
        --i-metabolites ./Feces_MS.qza \
        --p-latent-dim 0 \
        --p-summary-interval 1 \
        --output-dir null_summary_feces

qiime mmvec summarize-paired \
        --i-model-stats ./GM_feces_summary2/model_stats.qza \
        --i-baseline-stats ./null_summary_feces/model_stats.qza \
        --o-visualization Feces_paired-summary.qzv
