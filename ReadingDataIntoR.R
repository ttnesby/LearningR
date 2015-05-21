# Reading CSV from URL ----

csvURL <- "http://www.jaredlander.com/data/Tomato%20First.csv"

# different alternatives, table, csv2, delim2,... - depending on file format

tomatos <- read.csv(
  file = csvURL,
  header = TRUE,
  sep = ",",
  stringsAsFactors = FALSE
    )

head(tomatos) # Show a few row

# Reading Excel ----

# Not easy, better to dump data to CSV...
# Possible with gdata, XLConnect, xlsReadWrite, BUT requires Java, Perl or 32 bit R...
# RODBC has odbcConnectExcel2007, but requires Data Source Connection (DSN)

# Reading from Databases ----

# use of RODBC

# Binary Files ----

# Use RData file, across Windows, Mac, Linux, ... Code and data

homeDir <- "~/Rtmp"
if (!dir.exists(homeDir)) {
  dir.create(homeDir)
}
save(tomatos, file = paste(homeDir, "tomatos.rdata", sep = "/"))

rm(tomatos)
head(tomatos)

load(paste(homeDir, "tomatos.rdata", sep = "/"))
head(tomatos)

# Can save multiple variables

# Data included in R ----

# R and some packages come with data included

require(ggplot2)
data(diamonds)
head(diamonds)

data()                                          # list available data in R - default set
data(package = .packages(all.available = TRUE)) # list available across packages

# Reading data from HTML tables ----

# require(XML)
# use of readHTMLTable

# Scraping Web data ----

# use of pattern matching and regular expr - involved process

