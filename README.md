# rjulia2
new rjulia version use RCall.jl to Call julia from R, the target is don't need any C code, so no more compile and install problem.

this version is in alpha now (2017-01-24).  only test following codes:

demo/testcode.R

demo/testdataframe.R

demo/testmatrix.R

demo/testmdarray.R

demo/testtype.R

More function (NA and tuple ) will be implemented in next few days . so don't report any issue right now, because this is just an unfinished work.


Also, rjulia2 only support julia 0.5+ (RCall.jl must installed) and R 3.2+, and only test under R CMD on linux. When finish linux console version , run on windows and rstudio will implement.



