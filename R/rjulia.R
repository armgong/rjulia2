cstrnull<-function(orgstr)
{
  return (c(charToRaw(orgstr),as.raw(0)))
}

ccall<-function(fname,cmdstr)
{
  #the ugly hack .C, need PACKAGE name libjulia, or error
  invisible(.C(fname,cstrnull(cmdstr),PACKAGE="libjulia"))
}
# for version 1.0
jDo<-julia_void_eval<-julia_eval<-function(cmdstr)
{
  ccall("jl_eval_string",cmdstr)
}

julia_init <- function(juliahome="")
{
  ##force change HOME env variable in R, R change HOME to c:\user\username\Documents 
  ##but on window 7+ this should be c:\user\username, and it not change it, julia could not
  ##find its package and compiled package, so let us change it  
  if (Sys.info()[['sysname']]=="Windows")
  {
   Sys.setenv(HOME=paste0(Sys.getenv("HOMEDRIVE"),Sys.getenv("HOMEPATH")))
  }

  juliabindir <- if (nchar(juliahome) > 0) juliahome else {
    gsub("\"", "", system('julia -E JULIA_HOME', intern=TRUE))
  }
  ccall("jl_init",juliabindir)
  
  ## If on Windows, run a specific push to compensate for R not handling pkg.dir() correctly.
  jDo('@windows_only push!(LOAD_PATH,joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]),".julia",string("v",VERSION.major,".",VERSION.minor)))')
  jDo('@windows_only ENV["HOME"]=joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]))')
  ## Loading julia packages
  jDo("using DataArrays")
  jDo("using DataFrames")
  jDo("using RCall")
}

r2j<-function(rx,jx)
{
  z<-paste0(jx,"=@rget ",rx)
  jDo(z)
}

j2r<-function(jx,rx)
{
 z<-paste0("globalEnv[:",rx,"]=",jx)
 jDo(z) 
}
