# Results from analyses in Python and R

## Articles per Congress, time and media ideology

Below is a plot displaying number of media stories per Congressional session. This descriptive data looks very similar to the Congressional speeches data. We can see more left-wing articles and speeches about voter ID in the first few Congresses, with more and more articles/speeches from right-wing media during more recent congressional sessions. This already indicates some connection between news media and political elite cues on voter ID.

I also plotted articles by time to find potential spikes in coverage. We can see a few spikes in the outputs below. The first of these happens around June 2013, which is when the Shelby Count vs Holder Supreme Court case decision was made. The next spikes happen around the 2014, 2016, 2018 and 2020 US elections. The biggest spike happens in Jan 2021. There is a drastic increase in right-wing media coverage, perhaps responding to the introduction of the For the People Act bill Democrats at the start of the 117th Congress, further alligning media coverage to the political dimension.

<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/163991662-3922664b-d5d7-4d16-8382-1f5f7f245317.PNG" alt="Sublime's custom image"/, style="width:300px;">
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/163992071-50345db5-9850-4381-a0bd-2d64d794806c.png" alt="Sublime's custom image"/, style="width:300px;">
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/164411991-dfa7c0fa-09b5-4da4-9c00-5a926331962c.png" alt="Sublime's custom image"/, style="width:600px;">
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/164226306-ded712f4-92bf-417b-bafe-74b6ece9584f.PNG" alt="Sublime's custom image"/, style="width:600px;">
</p>

## Title analysis
To get a sense of the coverage content I analysed the titles using the quanteda package in R. See below the top words
<p align="center">
  <img src=https://user-images.githubusercontent.com/89010445/164459967-1bfb84ab-3491-4250-8861-fe2f235d2f08.PNG alt="Sublime's custom image"/, style="width:400px;">
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/89010445/164460168-81caa215-1916-4a1d-8590-56612b872349.PNG" alt="Sublime's custom image"/, style="width:400px;">
</p>

The top words of each group already indicate the presence of some of the frames used by politicians. For example, the prevalence of the terms *rights, restrictions, black, latino, suppression, restrict, supreme court* highlight left-leaning media frame voter ID as a disenfranchising policy. Top words of right-leaning media such as *bill* and *democrats* might highlight their coverage of the new accessibility bill proposed by Democrats last year. Other words such as *integrity, security, rigged* indicate they might be framing voter ID similarly to Republican political elites. Other terms related to voting by mail and the coronavirus pandemic might indicate the presence of narratives around voter fraud pushed by Trump during his final campaign.


