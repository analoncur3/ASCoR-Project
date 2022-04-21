---
title: "Combine mc and nx data"
output: html_document
---

```{r}
# set working directory
datadir <- "C:/Users/analo/OneDrive - University of Glasgow/University of Glasgow/Amsterdam Visit/Voter-ID-US-News-Media/Data collection/"
```

```{r}
library(tidyverse)
library(inops)
```

## Data

Tasks:
- Get rid of unwanted columns and rename existing ones
- Merge the data from mediacloud and nexisuni
- Create new column with sources leaning right and left

```{r setup, include=FALSE}
# read in data gathered through NewsPlease (mediacloud) and NY times data (nexis) and check column names
mediacloud <- read_csv(paste0(datadir, "corpus_mediacloud.csv"))
nexis <- read_csv(paste0(datadir, "nexisarticles.csv"))

# check column names
colnames(mediacloud)
colnames(nexis)
```

```{r}
# remove columns we don't need
mc <- select(mediacloud, c(date_publish,maintext, title, url, media_name,))
nx <- select(nexis, c(Date, Article, Headline, Source_File, Source,))


# renaming columns
names(nx)[names(nx) == "Headline"] <- "title"
names(nx)[names(nx) == "Article"] <- "maintext"
names(nx)[names(nx) == "Date"] <- "date"
names(nx)[names(nx) == "Source"] <- "media_name"
names(nx)[names(nx) == "Source_File"] <- "source"


names(mc)[names(mc) == "date_publish"] <- "date"
names(mc)[names(mc) == "url"] <- "source"

# nx <- nx[, c("date", "text", "title", "Source")]
colnames(nx)
colnames(mc)
```

```{r}
# combining 2 dataframes
corpus <- rbind(mc, nx)
corpus %>% count(source) 

```

```{r}
# counting how many articles dont have a date
nrow(corpus[corpus$date == "None",])
```

```{r}
# Subset data to keep the outlets we're interested in
corpus %>% count(media_name)
```

```{r}
# Getting rid of articles without date
corpus <- corpus %>% subset(date != "None")
```

# New column

```{r}
corpus <- corpus %>% 
  mutate(
    ideology = case_when(
      media_name %in~% "Fox News|Washington Times|NY Post|Breitbart|Daily Caller|Free Beacon" ~ "right",
      media_name %in~% "Washington Post|The New York Times|CNN|NBC News|USA Today|Huffington Post" ~ "left",
      T ~ NA_character_
    )
  )

corpus %>% count(ideology)

#check NAs
othermedia <- corpus %>% filter(is.na(ideology))

# filter out other media
corpus <- corpus %>% filter(!is.na(ideology))

corpus %>% count(media_name)
```


```{r}
write.csv(corpus,"finalcorpus.csv", row.names = FALSE)
```

