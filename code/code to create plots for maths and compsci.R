library(readr)
library(tidyverse)
library(ggplot2)

math_bach_nsf <- read_csv("LocalDocuments/Stats of women degrees in US/maths_bach_nsf.csv")
compsci_bach_nsf <- read_csv("LocalDocuments/Stats of women degrees in US/compsci_bach_nsf.csv")

recent_math_bach_nsf <- read_csv("LocalDocuments/Stats of women degrees in US/recent_math_nsf.csv")
recent_compsci_bach_nsf <- read_csv("LocalDocuments/Stats of women degrees in US/recent_compsci_bach_nsf.csv")


math_stats <- math_bach_nsf %>%
  filter(!is.na(Year)) %>%
  mutate(prop_female = Female/Total,
         max_prop = max(prop_female, na.rm = TRUE))

recent_math_stats <- recent_math_bach_nsf %>%
  filter(!is.na(Year)) %>%
  mutate(prop_female = Female/Total,
         max_prop = max(prop_female, na.rm = TRUE))

ggplot()+
  geom_line(data = math_stats, aes(x = Year, y = prop_female), colour = "pink", size = 1)+
  geom_line(data = recent_math_stats, aes(x = Year, y = prop_female), colour = "red", size = 1)+
  ylab("Prop female mathematics degrees")

math_stats %>%
  filter(prop_female ==  max(prop_female, na.rm = TRUE))

compsci_stats <- compsci_bach_nsf %>%
  filter(!is.na(Year)) %>%
  mutate(prop_female = Female/Total,
         max_prop = max(prop_female, na.rm = TRUE))

recent_compsci_stats <- recent_compsci_bach_nsf %>%
  filter(!is.na(Year)) %>%
  mutate(prop_female = Female/Total,
         max_prop = max(prop_female, na.rm = TRUE))

ggplot()+
  geom_line(data = compsci_stats, aes(x = Year, y = prop_female), colour = "pink", size = 1)+
  geom_line(data = recent_compsci_stats, aes(x = Year, y = prop_female), colour = "red", size = 1)+
  ylab("Prop female comp sci degrees")

compsci_stats %>%
  filter(prop_female ==  max(prop_female, na.rm = TRUE))
