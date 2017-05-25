
setwd("/Users/ashwinibhatte/Downloads")
refine_original = read.csv("refine_original.csv", header = TRUE)
#clean up brand names
library(dplyr)
library(tidyr)
refine_original %>%
  mutate(company = tolower(company)) %>%
  mutate(company = sub("^[p|f].+s$", "philips", x = company)) %>%
  mutate(company = sub("^a.+[o|0]$", "akzo", x = company)) %>%
  mutate(company = sub("^v.+n$", "van houten", x = company)) %>%
  mutate(company = sub("^u.+r$", "unilever", x = company)) %>%
  #Separate product code and number
  separate(Product.code...number, c("product_code", "product_number")) %>%
  #add product categories
  mutate(product_cat = sub("p", "Smartphone", x = product_code)) %>%
  mutate(product_cat = sub("v", "TV", x = product_cat)) %>%
  mutate(product_cat = sub("x", "Laptop", x = product_cat)) %>%
  mutate(product_cat = sub("q", "Tablet", x = product_cat)) %>%
  #add full address for geocoding
  unite(full_address, address:country, sep = ",", remove = FALSE) %>%
  mutate(company_philips = grep("philips", x = company))
  
transAshwini <- function(x, val)
  if (x == val) {
    1
  }
  else {
    0
  }
    


