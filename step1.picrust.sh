#activate your picurst2 environment
#conda activate picrust2

picrust2_pipeline.py -s ./feature_sequence.fasta -i ./feature-table.biom -o ./picrust --processes 50 --stratified --per_sequence_contrib
add_descriptions.py -i ./picrust/EC_metagenome_out/pred_metagenome_unstrat.tsv.gz -m EC -o ./picrust/EC_metagenome_out/pred_metagenome_unstrat_descrip.tsv.gz
add_descriptions.py -i ./picrust/KO_metagenome_out/pred_metagenome_unstrat.tsv.gz -m KO -o ./picrust/KO_metagenome_out/pred_metagenome_unstrat_descrip.tsv.gz
add_descriptions.py -i ./picrust/pathways_out/path_abun_unstrat.tsv.gz -m METACYC -o ./picrust/pathways_out/path_abun_unstrat_descrip.tsv.gz
pathway_pipeline.py -i ./picrust/EC_metagenome_out/pred_metagenome_unstrat.tsv.gz  -o ./picrust/pathways_out -p 50
