# rjulia2
new rjulia version use RCall.jl to Call julia from R, the target is don't need any C code, so no more compile and install problem , this version is in alpha, please report any bug you met.


Right now, rjulia2 support julia 0.4+ (RCall.jl,DataFrames.jl and DataArrays.jl must installed) and R 3.2+.

test on R console and RStudio both on windows and linux.

In some system, Rstudio server may need a patch, https://github.com/JuliaStats/RCall.jl/pull/91 

Windows RGUI is not support.

see testcode.R and testdataframe.R, testMatrix.R in demo dir for basic usage. more demo will comming in next few days.
