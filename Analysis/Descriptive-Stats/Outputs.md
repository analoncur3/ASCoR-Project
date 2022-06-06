# Results from analyses in Python and R

## Articles per Congress, time and media ideology

Below is a plot displaying number of media stories per Congressional session. This descriptive data looks very similar to the Congressional speeches data. We can see more left-wing articles and speeches about voter ID in the first few Congresses, with more and more right-wing articles/speeches during more recent congressional sessions. This already indicates some connection between news media and political elite cues on voter ID.

<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/163991662-3922664b-d5d7-4d16-8382-1f5f7f245317.PNG" alt="Sublime's custom image"/, style="width:300px;">
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/163992071-50345db5-9850-4381-a0bd-2d64d794806c.png" alt="Sublime's custom image"/, style="width:300px;">
</p>
I also plotted articles by time to find potential spikes in coverage. We can see a few spikes in the outputs below. The first of these happens around June 2013, which is when the Shelby Count vs Holder Supreme Court case decision was made (which removed the federal preclearance need to pass voter ID laws, making these requirements easier to enact at the state level). The next spikes happen around the 2014, 2016, 2018 and 2020 US elections. The biggest spike happens in Jan 2021. There is a drastic increase in right-wing media coverage, perhaps responding to the introduction of the For the People Act bill Democrats at the start of the 117th Congress, further alligning media coverage to the political dimension.
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/164411991-dfa7c0fa-09b5-4da4-9c00-5a926331962c.png" alt="Sublime's custom image"/, style="width:600px;">
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/164226306-ded712f4-92bf-417b-bafe-74b6ece9584f.PNG" alt="Sublime's custom image"/, style="width:600px;">
</p>


## Title analysis
#### Top features
To get a sense of the coverage content I analysed the titles using the quanteda package in R. I did some standard pre-processing to remove noise, I removed punctuation, symbols, stop words, compounded U S to U_S, north_carolina, removed the terms 'advertisement' and 'u' (which was left from emojis) and changed instances of 'id' to 'identification'. See below the top words: 
<p align="center">
  <img src=https://user-images.githubusercontent.com/89010445/167095865-b4a20fe7-21f1-48c2-af3e-6b0d6023c322.PNG alt="Sublime's custom image"/, style="width:400px;">
</p>

We can see further allignment between media and politics by the prevalence of both terms 'democrats' and 'republicans'/'gop', theres also an indication that the key voter ID frames identified in the literature are present in news coverage (voter suppression and voter fraud) with the prevalence of the terms 'rights' and 'fraud'. We can see Trump appears as one of the top features, which might indicate his role in spreading false voter fraud narratives in his presidential campaigns, specially his last one. The presence of the terms 'court' and 'bill' might indicate coverage is also focusing on the legal aspects of voter ID.

#### Wordcloud by ideology
I then used the quanteda textplot_wordcloud function to compare top features by media ideology.
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/167094957-f2b1e923-5344-4ba3-9acd-944e357ba562.PNG" alt="Sublime's custom image"/, style="width:400px;">
</p>
The top words of each group further indicate the presence of some of the frames used by politicians I identified in congressional speeches on voter ID. 

- **Left leaning media**: the prevalence of the terms *rights, restrictions, impact, discrimination, turnout, race, black, latino, suppression, restrict* highlight left-leaning media frame voter ID as a disenfranchising policy. I find interesting that 'trump' is associated to left-wing media discourse, showing his claims might have been paraphrased or quoted to undermine their validity, which raises questions around whether this might have instead helped amplify false voter fraud narratives. 
- **Right leaning media**: Top words of right-leaning media such as *h.r, bill* and *democrats* might highlight their coverage of the new accessibility bill proposed by Democrats last year. Other words such as *integrity, security, rigged* indicate they might be framing voter ID similarly to Republican political elites. Other terms related to voting by mail and the coronavirus pandemic might indicate the presence of narratives around voter fraud pushed by Trump during his final campaign.

I found this preliminary title analysis in R also useful to understand the corpus a bit better. I explored some of these top words using the KWIC function, for example 'opinion', to see whether they are relevant to the corpus or result from the opinion headline in news media being captured as text. I find that this is sometimes the case, when it appears capitalised its often a headline. The term 'new' also has a similar pattern, where sometimes its used as a heading, also shown in a capitalised format.

#### Bigrams and IDF scores
I then did some preprocessing through Python, using regex to remove these capitalised instances of Opinion and News. I also found and joined common bigrams, and calculated idf scores to find and remove common words that appear across most documents.

<p align="center">
  <img src=https://user-images.githubusercontent.com/89010445/167624066-8486b689-a6cb-4aae-a883-da61631321ca.PNG alt="Sublime's custom image"/, style="height:200px;">
  <img src=https://user-images.githubusercontent.com/89010445/167623832-6c9b3f33-dafb-4e89-a325-1f985f69f9a8.PNG alt="Sublime's custom image"/, style="height:200px;">
</p>


#### Similarity Analysis (in Iramuteq)
I then exported the corpus of title content split by ideology with removed stopwords and common words, and imported it into Iramuteq. The corpus is also lemmatised.
I set the parameters to at least 4 co-occurrences, and the layout algorith fruchterman reingold. See below the output for right-leaning media headlines.
<p align="center">
  <img src=https://user-images.githubusercontent.com/89010445/167624866-31c56c1e-910d-4da2-b040-67600ed1e982.png alt="Sublime's custom image"/, style="width:700px;">
</p>

I did the same with titles from left leaning media:
<p align="center">
  <img src=https://user-images.githubusercontent.com/89010445/167624696-2373ce4c-db6a-4d4e-8e08-bf66fb99712b.png alt="Sublime's custom image"/, style="width:700px;">
</p>

These outputs further highlight the similarity between political speeches on voter ID and partisan news coverage. 

- **Right leaning media**: We see right wing media's discourse is structured around the main terms *democrat, ID* and *law*. *Democrat* is connected to the term *bill*, which in turn is connected to *hypocrisy* and *Pelosi* (the current speaker of the House). We also find *democrat* is linked to *corrupt, lie, power-grab, agenda, steal, crisis, partisan, takeover*, which points at the Republican framing of the HR1 bill proposed by Democrats as a power grab or partisan strategy based on lies around voter suppression. *Democrat* is also linked to *bad*, while *Trump* to *victory*. The co-occurring terms *ballot* and *harvest* also point towards the framing of the HR1 bill as enabling ballot harvesting and therefore the Republican framing of voter ID as preventing fraud/ strengthening the systems integrity. The connection between *democrat, cheat - hard - easy* and *ID* to *fraud* further shows the presence of this voter fraud frame (an example title: Republicans Are Making It Easier To Vote And Harder To Cheat. Hannity Corrupt media is lying to protect Biden's mental errors). *Suppression* also appears connected to *democrat* (an example title:  election voter suppression fraud with mail-in ballots threatens confidence in results), as I said before, I also noticed at times suppression appears between quotation marks which is also a way of distorting Democrats voter suppression frame and I think it would be nice to account for this.
- **Left leaning media**: compared to right leaning media's discourse, left leaning media's discourse is structured around the terms *Trump*, *right*, and *law*. We see the term right is also connected to three word cloud groups around the terms *Republican, democrat* and *court*. *ID*, *North Carolina* and *Texas* also appear connected to *law*. Confirming the framing of voter ID as suppressing votes from minorities we find the connections between *right* and *attack, justice, protect, latinos, black, native and asian americans.* *Law* also appears connected to *impact, strict, threat, hurt, discrimination, racist, suppress, racial* and *turnout*. *Trump* is connected to *fraud*, in turn connected to *myth, allegation, accuse, tactic*. *Trump* also appears connected to *claim* and *false*, confirming left leaning media paraphrase or cite Trumps false claims to debunk them. The connections between *republican* and *partisan, unconstitutional* and *controversial*, and *GOP* to assault point at Democrats framing of voter ID as a tactic/strategy.

> **Next steps: These outputs also show that it probably would be helpful to compound more terms, specially key names (Jim Crow, John Lewis, Nance Pelosi, Kris Kobach, etc)



## Keywords (TF-IDF and keyness)

### Shifterator
To check differences in language by media type, I used the package shifterator, which provides functionality for constructing word shift graphs, vertical bart charts that quantify which words contribute to a pairwise difference between two texts and how they contribute. 
<p align="center">
  <img src= https://user-images.githubusercontent.com/89010445/171623262-8ac06fe6-9052-4325-9dfd-55e07c9ff950.png alt="Sublime's custom image"/, style="width:300px;">
</p>

We further find that left leaning media discuss voter ID in relation to voting rights, court, and law.
I'm finding an interesting legal framing of voter ID by democrats/left leaning media that I hadnt thought about before. Right leaning media tend to discuss voter ID without relating it to the legal dimension, without mentioning its a 'law' or supreme court cases.
