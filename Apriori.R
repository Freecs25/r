 
if (!require("arules")) install.packages("arules", dependencies=TRUE) 
if (!require("arulesViz")) install.packages("arulesViz", dependencies=TRUE) 
library(arules) 
library(arulesViz) 
 
data("Groceries")  

summary(Groceries)  
inspect(Groceries[1:5])   
 
rules <- apriori(Groceries,  
                 parameter = list(supp = 0.01, conf = 0.2, minlen = 2)) 

summary(rules) 

inspect(sort(rules, by="lift")[1:5]) 

plot(rules, method = "scatterplot", measure = c("support", "confidence"), shading = "lift") 
plot(rules, method = "graph", control = list(type = "items")) 
 
rules_high_conf <- apriori(Groceries,  
                           parameter = list(supp = 0.02, conf = 0.5, minlen = 2)) 
inspect(sort(rules_high_conf, by="lift")[1:5]) 