xx<-  read.table("xx.txt")
xx<- read.csv("xx.csv",header=FALSE)
￼

url()
readLines()
getURL() 
######################################################################
library(XML)

# Get the page's source
web_page <- readLines("http://zh.wikipedia.org/wiki/北京地铁车站列表")

# Pull out the appropriate line

author_lines <- web_page[grep("<I>", web_page)]

# Delete unwanted characters in the lines we pulled out
authors <- gsub("<I>", "", author_lines, fixed = TRUE)

# Present only the ten most frequent posters
author_counts <- sort(table(authors), decreasing = TRUE)
author_counts[1:10]
