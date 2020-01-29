# EXAMPLE COMMENT YOU PLEB
TestList <- 0:10 # [0,1,2,3,4,5,6,7,8,9,10]
TestList^2       # exponenets
TestList %/% 3   # integer division
TestList %% 3    # modulo
log(TestList)    # functions

# Variable Assignment uses the arrow "<-"

snake_case <- "foo_bar"
CamelCase <- "FooBar"
dot.case <- "foo.bar"
.secret <- "Try ls() and ls(all.names = TRUE)"
sCdList <- c(snake_case, CamelCase, dot.case)
sCdCombine <- paste0(sCdList)

paste(c("one", "two", "three", "four", "five"), c("X","Y"), sep = "__", collapse = "++")

"reverse" -> reverseTest

substr(snake_case, 1, 4)

c(TRUE,2,"f") # c stands for coerce and concatonate
c(TRUE,2,1.001)

# PACKAGE MANAGEMENT 
installed.packages()
install.packages()
update.packages()
remove.packages()
library(ggplot2)
