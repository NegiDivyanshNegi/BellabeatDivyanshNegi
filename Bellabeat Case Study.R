##installing packages

install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")

library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)

##importing data

getwd()

Activity <- read.csv("dailyActivity_merged.csv")
head(Activity)
colnames(Activity)
str(Activity)


Calories <- read.csv("dailyCalories_merged.csv")
head(Calories)
colnames(Calories)
str(Calories)

Intensities <- read.csv("dailyIntensities_merged.csv")
head(Intensities)
colnames(Intensities)
str(Intensities)

Heartrate <- read.csv("heartrate_seconds_merged.csv")
head(Heartrate)
colnames(Heartrate)
str(Heartrate)

Sleep <- read.csv("sleepDay_merged.csv")
head(Sleep)
colnames(Sleep)
str(Sleep)

Weight <- read.csv("weightLogInfo_merged.csv")
head(Weight)
colnames(Weight)
str(Weight)

## Cleaning Process

install.packages("janitor")
library(janitor)

clean_names(Activity)
clean_names(Calories)
clean_names(Weight)
clean_names(Heartrate)
clean_names(Intensities)
clean_names(Sleep)

## Analysing data

## Total number of participants in each data sets:
Activity %>%
  summarise(Activity_participants = n_distinct(Activity$Id))

n_distinct(Calories$Id)
n_distinct(Intensities$Id)
n_distinct(Heartrate$Id)
n_distinct(Sleep$Id)
n_distinct(Weight$Id)

## Activity
Activity %>%  
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes, Calories) %>%
  summary()

# Explore number of active minutes per category
Intensities %>%
  select(VeryActiveMinutes, FairlyActiveMinutes, LightlyActiveMinutes, SedentaryMinutes) %>%
  summary()

# Calories
Calories %>%
  select(Calories) %>%
  summary()

# Sleep
Sleep %>%
  select(TotalSleepRecords, TotalMinutesAsleep, TotalTimeInBed) %>%
  summary()

# Weight
Weight %>%
  select(WeightKg, Fat) %>%
  summary()

## Visualization

# Relationship between Steps and Sedentary time
ggplot(data=Activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point() + geom_smooth() + labs(title="Total Steps vs. Sedentary Minutes")

# Relationship between Minutes Asleep and Time in Bed
ggplot(data=Sleep, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_line() +geom_smooth() + labs(title ="Total Minutes Asleep vs. Total Time In Bed")

# Relationship between Steps and Calories
ggplot(data=Activity, aes(x=TotalSteps, y=Calories)) + geom_point() + geom_smooth() + labs(title="Total Steps vs. Calories")