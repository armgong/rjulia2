.juliaLib <- function()
    gsub("\"", "",
         system('julia -E "abspath(Libdl.dlpath(\\\"libjulia\\\"))"',
                intern = TRUE))

.onLoad <- function(libname, pkgname)
{
   .ldjulia <<- .juliaLib()
    dll<-dyn.load(.ldjulia,F,T)
}

.onUnload <- function(libpath)
{
    if(!exists(".ldjulia")) .ldjulia <- .juliaLib()
    dyn.unload(.ldjulia)
}
