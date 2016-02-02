# rjulia2
new rjulia version use RCall.jl to Call julia from R, the target is don't need any C code, so no more compile and install problem , this version is in very alpha .


Right now, rjulia2 only support julia 0.4 and R console, RGUI and Rstudio not supported. 

~~r
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

