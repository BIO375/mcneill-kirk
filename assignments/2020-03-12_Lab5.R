### Lab 5. confidence intervals, t-tests and friends

# Clean up the working environment
rm(list = ls())
# Verify working directory, should be ~/Documents/Analyses/lastname_first
getwd()

if(!require(Rmisc)){install.packages("Rmisc")}
if(!require(DescTools)){install.packages("DescTools")}
if(!require(boot)){install.packages("boot")}
if(!require(rcompanion)){install.packages("rcompanion")}
if(!require(summarytools)){install.packages("summarytools")}
if(!require(tidyverse)){install.packages("tidyverse")}

# Check for updates
tidyverse_update()

y<- Obliquity$Obliquity

sample_mean <-mean(y)
sample_sd <- sd(y)
sample_n <- as.numeric(length(y))
df <- sample_n -1

null_mean <- 23.4722
t_sample <- (sample_mean - null_mean)/(sample_sd/sqrt(sample_n))

t.test(Obliquity$Obliquity, 
       alternative = "two.sided", mu = 23.4722, conf.level = 0.95)

summ_heartattack <- HeartAttack_short %>%
  group_by(group) %>% 
  summarise(mean_cholest = mean(cholest),
            sd_cholest = sd(cholest),
            n_heartattack = n())

ratio <-(max(summ_heartattack$sd_cholest))/(min(summ_heartattack$sd_cholest))



### 8/10, code breaks because files not read in ####
# Did not read in either data file.  So what you are missing in each case
# is a line of code that looks like this:
# HeartAttack_short <- read_csv("datasets/demos/HeartAttack_short.csv")
# Without that line your code does not work