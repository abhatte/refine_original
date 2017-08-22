refine_original = read.csv("refine_original.csv", header = TRUE)
#clean up brand names
library(dplyr)
library(tidyr)
refine_original %>%
  mutate(company = tolower(company)) %>%  #Clean up brand names to lowercase
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
  #dummy variables for company and product categories
  mutate(company_philips = ifelse(company == "philips", 1,0)) %>%
  mutate(company_akzo = ifelse(company == "akzo", 1,0)) %>%
  mutate(company_van_houten = ifelse(company == "van houten", 1,0)) %>%
  mutate(company_unilever = ifelse(company == "unilever", 1,0)) %>%
  mutate(product_smartphone = ifelse(product_cat == "smartphone", 1,0)) %>%
  mutate(product_tv = ifelse(product_cat == "TV", 1,0)) %>%
  mutate(product_laptop = ifelse(product_cat == "Laptop", 1,0)) %>%
  mutate(product_Tablet = ifelse(product_cat == "Tablet", 1,0)) %>%
  write.csv(file = "refine_clean.csv")

