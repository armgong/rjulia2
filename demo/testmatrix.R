library(rjulia2)
julia_init()

#f <- function(n) {
#    stopifnot(n >= 1)
    for (i in 1:1) {
        ## pass R double vector to Julia
        x <- matrix(1.01:6.01,3,2)
        r2j("x","jx")
        j2r("jx","rx")
        cat("i=",i,"; Matrix, passed to Julia and back to R:\n", sep="")
        print(rx)
        ## cat("run time is:",i,"\n")
        cat(" is equal to original R? ", paste(all.equal(x,rx), collapse="\n   "), "\n")
    }

    ## create 2d array in julia,get from R
    julia_void_eval("x = rand(2,2)")
    j2r("x","rx")
    cat("Matrix from Julia's  rand(2,2):\n")
    print(rx)
#}

#f(1)

#f(10)
#xdd <- f(10000)
