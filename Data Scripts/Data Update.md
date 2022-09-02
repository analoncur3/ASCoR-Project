## Data Update

I thought I could write up here what I've been up to since we last met as its been a while. 

1. I first looked into getting urls via Mediacloud and retrieving stories using NewsPlease. I initially found some issues with this: A) There were discrepancies between the storyCount output, which gives the expected number of stories per query, and the actual urls retrieved. I initially thought this was due to the data issues Mediacloud has been experiencing. B) I checked the timeframes of the news media sources through their website and found some of them had stories until 2020 or before which isn't ideal.
2. Shortly after this, we met and decided to try out getting stories through NexisUni. Unfortunately there aren't many news media sources there. The only relevant ones were *The New York Times*, *USA Today* and *MSNBC*, all left-leaning news media. I managed to retrieve text data from these articles using [LexisUniTools](https://github.com/JBGruber/LexisNexisTools) in R. It also became obvious that getting data from important right-wing media like Fox News and Breitbart would be difficult as neither has an API.
3. After this, I checked the [github repo](https://github.com/wlmwng/us-right-media) Damian sent me a while ago from Wai Lam, who gathered Mediacloud urls from relevant right-wing news media last year without using a specific query (including Fox News, Breitbart, Washington Examiner, among others) as I thought maybe an option would be filter their already downloaded data with our query. When I checked their Python scripts on github, I found that they managed to retrieve stories beyond the timelines stated in the Mediacloud website which came as a (positive) surprise.
4. I got in touch with them to see if they had experienced similar issues downloading this data, in terms of finding differences between expected vs retrieved stories and to ask whether they had indeed found stories beyond the timelines specified. In terms of the missing urls, they redirected me to this github [issue](https://github.com/mediacloud/backend/issues/664), explaining that duplicates are sometimes getting counted in the "x number of stories" metric but they are filtered out when actually retrieving them. In other words, the discrepancy could be because the workarounds/fixes haven't been evenly implemented yet to correctly calculate the number of stories (without duplicates) and not necessarily because of stories missing. This was a relief! They also confirmed they were able to get stories beyond the timelines stated in the Source Manager tab in the website as the documentation is not fully in-sync with what's in the database itself. 
5. I went back to checking Mediacloud to find more info about the missing data issues, to confirm the discrepancies I was finding werent because of actually missing data. According to their latest [blog](https://mediacloud.org/news/2022/3/4/media-cloud-tools-update-for-march-2022) update in March 7, the issues with missing data only affect data between September 25 - November 23, 2021 of some sources, and most stories after December 25, 2021. As they dont specify which sources or data are affected, I decided to give the Mediacloud API another go. In the case that our sources are affected, then cutting off the timeframe up until 09/2021 would be ok too.
6. Here I stopped to think about other news sources we could gather to have a bit more data. The initial choice of sources was inspired by [Zhang et al.'s (2022)](https://journals.sagepub.com/doi/pdf/10.1177/19401612211072793) recent study of partisan media frames. They use data from [Pelled and colleagues’ (2021)](https://ijoc.org/index.php/ijoc/article/view/13739/3434), collected from MediaCloud from three sets of news media: progressive (New York Times and Washington Post), moderate (CNN and Chicago Tribune), and conservative (Fox News and New York Post). However, to keep things consistent with the political elite study already conducted which split data by political party (Republican - right and Democratic - left), I thought perhaps it made more sense to similarly split the corpus between right-leaning and left-leaning news media, as it would make comparisons easier between these 2 groups, and include more sources in each of these, instead of the 2 news sources per category initially proposed. I expanded the list of news media to potentially analyse (I explain how in the README.md file).
7. I used the Mediacloud API to fetch the URLs and check how much data we could get, and importantly, the timeframe available. I found that we actually get the timeframe we're interested in for the important news media outlets. Most sources go from 2013 until March 2022, except for the *National Review* (which only goes up until 06/21), the *Chicago Tribune* (until 06/21) and *Vox* (which starts from 10/2014). *USA Today* also goes up until 09/21 but this source is also in NexisUni and we can get the complete timeframe from there. I find discrepancies between expected story count and retrieved urls across all the sources which means its not an issue with a specific outlet but across the board. I have gotten in touch with Mediacloud's support team to see if they can clarify whats causing this (still waiting for a response). The total number of urls retrieved is 4759. After removing articles without a date this comes down to **4730**. See script [here](https://github.com/analoncur3/Voter-ID-US-News-Media/blob/main/Data%20collection/Mediascore.ipynb).
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/163780538-bf7c6709-94a6-402a-819f-200f73ec8681.PNG" alt="Sublime's custom image"/, style="width:800px;">
</p>

8. Then I requested the html files for all these urls and used NewsPlease to extract the article data and meta data. We get **4035** articles, meaning 700 articles aren't retrieved. We also get 151 articles with NAs on the maintext column (mainly from the *National Review*). As we provide NewsPlease with the htmls from just the mediacloud urls, I created a new column 'media_name' and used the libraries tidyverse and inops in R to extract outlet names from the url column. I checked the number of articles retrieved per outlet (see table below). We get 0 stories from the *Washington Examiner* and only 14 from *The New York Times*, which explains the big drop, but thankfully we can also get this data from NexisUni. Interestingly for some reason I dont understand NBC News and CNN end up with more stories that original urls, I checked the urls and they are indeed from these sources so I dont know why they were tagged differently by the Mediacloud api. 10 articles have urls that dont belong to any of the news outlets, bringing the number of documents down to **3874**.
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/163794100-c5ed5741-2f68-48b9-b6c8-608e910b6643.PNG" alt="Sublime's custom image"/, style="width:300px;">
</p>

10. After this initial data gathering I revisited the original table of outlets of interest. We discard the *National Review*  and *Chicago Tribune* because of their limited timeframe and lack of sources retrieved. We discard the *Washington Examiner*, *Wall Street Journal* and *Vox* because of lack of sources found/retrieved. We discard *MSNBC* as it's a TV cable channel providing NBC News coverage. We end up with:
  - Right-wing news media: *Fox News, Washington Times, NY Post, Breitbart, Free Beacon* and *Daily Caller*. 
  - Left-wing news media: *The Washington Post, The New York Times, CNN, NBC News, USA Today* and *Huffington Post*.
11. Seeing only 14 *The New York Times* stories were collected via NewsPlease, we get the stories via NexisUni using LexisNexisTools (1097 stories found - excluding duplicates). We combine this data with the mediacloud data, which results in **4491** documents, 2768 from left wing media and 1723 from right wing media.
12. After again removing articles without a date of the NY Times (nexisuni) data, the final corpus ends up being **4485** documents.
13. I then tried plotting the articles by time and realised theres 24 articles published before 2013. I think this happened when the articles were retrieved via NewsPlease so I removed these from the corpus, total documents now **4467**, with a total of **6371235** words.

> **THOUGHTS ON DATA SO FAR: until I hear back from Mediacloud about the discrepancy between storycount and retrieved urls I feel a bit uneasy about the data. When emailing with Wai Lam, they said the support team was very helpful when they contacted them last year. If it turns out there's a serious problem with the current database, they might do periodic backups so maybe they could be able to pull the data we need from one of those. We also only got 80% of Washington Post stories through NewsPlease, but we have access to the Washington Post through the UvA, see [here](https://go.gale.com/ps/i.do?p=AONE&u=amst&id=GALE%7C2PST&v=2.1&it=aboutJournal). The stories can only be downloaded one by one though but I checked the html and I think we could potentially scrape it. I think that even with these potential data issues, we now have a corpus to play around with and we can always include more data later on and re-run the analysis**.

14. I received the following response from Mediacloud (06/05):

*"Unfortunately our system is experiencing ongoing technical challenges that include discrepancies in story count and story download. Our hypothesis is this has to do with the ways data is captured between our search system (Solr) that returns the counts, and the content system (Postgres) that houses the articles. This is one among several technical issues that we are currently working on.
Again, our apologies for the inconvenience caused by the technical challenges at present. We are working hard to resolve them as quickly as possible for the research community using our tools."*