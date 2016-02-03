# rjulia2
new rjulia version use RCall.jl to Call julia from R, the target is don't need any C code, so no more compile and install problem , this version is in very alpha .


Right now, rjulia2 only support julia 0.4 (RCall.jl must installed) and R console, Rstudio server need a patch https://github.com/JuliaStats/RCall.jl/pull/91, Windows RGUI is not support yet.

see demo\testcode.R and demo\testdataframe.R for basic usage. more demo will comming in next few days.
