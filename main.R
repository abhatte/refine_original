library(dplyr)

setwd("/Users/ashwinibhatte/Downloads")
refine_original = read.csv("refine_original.csv", header = TRUE)

refine_original %>%
  mutate(company = tolower(company)) %>%
  mutate(company = sub("^[p|f].+s$", "philips", x = company))

