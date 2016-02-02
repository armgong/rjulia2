library(rjulia2)

julia_init()

## pass R double vector to Julia
rx <- 1.01:5.01
r2j("rx","jx")
## get passed vector from Julia
j2r("jx","rx1")
cat("float vector:",rx1,"\n")

## pass R int vector to Julia
rx <- 1:5
r2j("rx","jx")
## get passed vector from Julia
j2r("jx","rx1")
cat("int vector:",rx1,"\n")

## pass R int vector to Julia
rx <- c(TRUE,FALSE,TRUE)
r2j("rx","jx")
## get passed vector from Julia
j2r("jx","rx1")
cat("bool vector:",rx1,"\n")



## pass string vector to julia,need to verify
rx <- c("tttt","xxxx")
r2j("rx","jx")
## get passed vector from Julia
j2r("jx","rx1")
cat("string :",rx1,"\n")
