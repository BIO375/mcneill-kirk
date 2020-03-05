### Lab 3. Data manipulation and graphing

# Clean up the working environment
rm(list = ls())

# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

### Install and load packages ####
# The following commands will install these packages if they are not already installed, 
# and then load them!

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}
library(readr)

library(readr)
chap13e5SagebrushCrickets <- read_csv("datasets/abd/chapter13/chap13e5SagebrushCrickets.csv")
View(chap13e5SagebrushCrickets)

  
ggplot(cricket) +
  geom_histogram(aes(timeToMating), binwidth = 2)+
  facet_wrap(~feedingStatus)

cricket <- cricket %>%
  mutate(log1cricket = log(timeToMating + 1))

ggplot(cricket) +
  geom_histogram(aes(log1cricket), binwidth = .2)+
  facet_wrap(~feedingStatus)

# Code breaks because you assign different names to the data in line 22 and line 26, 30, 33


