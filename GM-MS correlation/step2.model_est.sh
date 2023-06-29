#Under qiime2-2020 environment

qiime tools import \
        --input-path ./Feces.MS.biom \
	--input-format BIOMV100Format \
        --output-path ./Feces_MS.qza \
        --type FeatureTable[Frequency]

qiime tools import \
        --input-path ./genus.RA.biom \
	--input-format BIOMV100Format \
        --output-path ./genus.qza \
        --type FeatureTable[Frequency]

qiime mmvec paired-omics \
        --i-microbes ./genus.qza \
        --i-metabolites ./Feces_MS.qza \
	--p-num-testing-examples 9 \
	--p-min-feature-count 6 \
	--p-epochs 500 \
	--p-batch-size 10 \
	--p-learning-rate 0.001 \
        --p-summary-interval 1 \
	--p-no-arm-the-gpu \
        --output-dir GM_feces_summary2

