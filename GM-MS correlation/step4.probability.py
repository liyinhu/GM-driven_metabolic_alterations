import pandas as pd
from skbio.stats.composition import clr_inv as softmax
ranks = pd.read_table('.//GM_feces_summary2/*/data/conditionals.tsv', index_col=0)
probs = ranks.apply(softmax)
probs.to_csv('./Feces_conditional_probs.txt', sep='\t')

