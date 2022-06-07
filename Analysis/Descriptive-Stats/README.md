
## Pre-processing steps
1. change "suppression" to no_suppression
2. remove irrelevant words (ads, embedded videos, Opinion)
3. remove words with low idf scores - words appearing in most documents so not adding much
4. remove common stopwords
5. change words: id -> identification, usa -> united states, donald trump -> trump
6. compound bigrams and names


## Descriptive stats
The following folder contains scripts used to explore the data. The tasks performed are:

Document/Article Level:
- Plotting number of articles by time and Congressional session
- Plotting lexical dispersion of key terms

Headline Analysis:
- Top features
- Similarity Analysis

Word level:
- Find top bigrams
- Find top words
- Find top entities/people (POS tagging)
- Pre-processing

