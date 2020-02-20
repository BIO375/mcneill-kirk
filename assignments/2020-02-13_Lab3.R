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

lovett <- read_csv("datasets/quinn/chpt2/lovett.csv")
Parsed with column specification:
  cols(
    STREAM = col_character(),
    ELEVATN = col_double(),
    SO4 = col_double(),
    SO4MOD = col_double(),
    CL = col_double()
  )
view(lovett)
summary(lovett)
lovett %>%
    descr()

summary_ploidy <- polyploid %>%
  summarise(mean_ploidy = mean(ploidy),
            median_ploidy = median(ploidy),
            IQR_ploidy = IQR(ploidy),
            sd_ploidy = sd(ploidy),
            var_ploidy = var(ploidy))


# Plot boxplots of SO4 and Modified SO4 using the code below.  
# You do not need to write any new code for this part!

# The code below modifies the dataset so it only contains SO4 and Modified SO4
# using select{dplyr}, and is oriented in long form using gather{tidyr}
lovett_tidy <- lovett %>%
  select(contains("SO4"))%>%
  gather(key = "type", value = "measurement", SO4, SO4MOD)

# The code below plots the two variables as boxplots, zooming in on the
# 40-75 range where most of the values are found (coord_cartesian).  The red 
# dots indicate the means (stat_summary).
ggplot(data = lovett_tidy)+
  geom_boxplot(aes(x = type, y = measurement))+
  coord_cartesian(ylim = c(40, 75))+
  stat_summary(aes(x = type, y = measurement), fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3)
summary_SO4 <- lovett %>%
    summarise(var_SO4 = var(SO4))
summary_SO4MOD <- lovett %>%
    summarise(var_SO4MOD = var(SO4MOD))
SE_SO4 <- lovett %>%
    summarise(SE_SO4 = (sd(SO4) / sqrt(n())))
SE_SO4MOD <- lovett %>%
  summarise(SE_SO4MOD = (sd(SO4MOD) / sqrt(n())))
ggplot(lovett) +
  geom_histogram(aes(SO4), binwidth = 2)
ggplot(lovett) +
  geom_histogram(aes(SO4MOD), binwidth = 2)
summary(sanchez)

summ_BEETLE96 <- sanchez %>%
  group_by(COLTYPE) %>%
  summarise(mean_BEETLE96 = mean(BEETLE96),
            median_BEETLE96 = median(BEETLE96),
            IQR_BEETLE96 = IQR(BEETLE96),
            sd_BEETLE96 = sd(BEETLE96),
            var_BEETLE96 = var(BEETLE96), 
            se_BEETLE96 = sd(BEETLE96) / sqrt(n()))
sanchez <-mutate(sanchez, log1beetle = log(BEETLE96 + 1))    
ggplot(sanchez) +
  geom_histogram(aes(BEETLE96), binwidth = 2)+
  facet_wrap(~COLTYPE)
ggplot(sanchez) +
  geom_histogram(aes(log1beetle), binwidth = 2)+
  facet_wrap(~COLTYPE)
ggplot(sanchez)+
  geom_boxplot(aes(x = COLTYPE, y = BEETLE96), varwidth = TRUE)
ggplot(sanchez)+
  geom_boxplot(aes(x = COLTYPE, y = log1beetle), varwidth = TRUE)
