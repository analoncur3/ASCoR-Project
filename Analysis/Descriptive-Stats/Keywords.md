

## Keywords (TF-IDF and keyness)
### Shifterator
After adding some preprocessing steps following the preliminary analysis, I checked differences in language by media type, I used the package shifterator, which provides functionality for constructing word shift graphs, vertical bart charts that quantify which words contribute to a pairwise difference between two texts and how they contribute. The graph below displays a 'shannon entropy word shift'; We can use the Shannon entropy to identify more “surprising” words and how they vary between two texts. The less often a word appears in a text, the more surprising that it is. The Shannon entropy can be interpreted as the average surprisal of a text. We can compare two texts by taking the difference between their entropies. We can rank these contributions and plot them as a Shannon entropy word shift. If the contribution is positive, then the word has a higher score in the second text. If the contribution is negative, then its score is higher in the first text.
<p align="center">
  <img src= https://user-images.githubusercontent.com/89010445/172584906-778b597e-5c49-4857-bf39-d91c40f0e5ec.png alt="Sublime's custom image"/, style="width:300px;">
</p>

We further find that left leaning media discuss voter ID in relation to voting rights, significantly mention trump more often, and refer to the court, and law. I'm finding an interesting legal framing of voter ID by democrats/left leaning media that I hadn't noticed before. Right leaning media tend to discuss voter ID without relating it to the legal dimension, without mentioning its a 'law' or the controversial supreme court cases associated to it, and I wonder if this might strengthen their framing of voter ID as common sense. We can also notice a present partisanship in media coverage over voter ID, with left leaning media refering to trump and the republican party, and right leaning media to Biden and democrats. We also find the term bill associated to right leaning media coverage, highlighting how similar to political elite debates, voter ID is associated to voter accessibility bills proposed by Democrats.

### TF-IDF Scores over time

