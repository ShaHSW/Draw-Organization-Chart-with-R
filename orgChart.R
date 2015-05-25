setwd("~/GitHub/OrgChart")
library(igraph)

# read csv file
dataSrc <- read.csv("orgChartData.csv", header = T)
# create a lookup table
lookup <- dataSrc[,c("EmpName", "EmpTitle")]

# Use merge to lookup manager's titles
temp <- merge(dataSrc, lookup, Src, by.x = "EmpManager", by.y = "EmpName", all.x = T )
# Tweak the column names 
names(temp)[match(c("EmpTitle.x","EmpTitle.y"), names(temp))] <- c("EmpTitle", "MgrTitle")

# Create a subset and make sure EmpTitle and MgrTitle are first two columns
dataInput <- temp[c("EmpTitle", "MgrTitle","EmpName", "EmpManager", "EmpDept", "FloorNum")]
View(dataInput)

# Organization Chart Function
drawOrgChart <- function(dataInput){
  data_gf <- graph.data.frame(dataInput, directed = T)
  plot(data_gf,
       main = 'Organization Chart',
       vertex.label = V(data_gf)$Title,
       vertex.label.font = 15,
       vertex.size = 15,
       vertex.size2 = 30,
       edge.arrow.size=0.2, 
       edge.curved = F
  )
  dev.copy(png,file='OrgChart.png'))
  dev.off()
}

# Draw Org Chart
drawOrgChart(dataInput)

# Draw Org Chart By Department

# Function for draw Org Chart By department
split_OrgChart <- function(df){
  # Split dataset with split function
  df_split <- split(df,df$EmpDept)
  # Get the length of splitted dataset
  len <- length(unique(df$EmpDept))
  for(i in 1:len){
    df_gf <- graph.data.frame(df_split[[i]],directed=T)
    plot(df_gf, 
      main = c('Orgranizational Chart',paste('Department:.',df_split[[i]][1,5])),
      edge.arrow.size=0.5, 
      edge.curved = F)
  dev.copy(png,file=paste('Department: ', df_split[[i]][1,5],'.png'))
  dev.off()
  }
}

split_OrgChart(dataInput)
