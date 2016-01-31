cstrnull<-function(orgstr)
{
  return (c(charToRaw(orgstr),as.raw(0)))
}

ccall<-function(fname,cmdstr)
{
  #the ugly hack .C, need PACKAGE name libjulia, or error
  invisible(.C(fname,cstrnull(cmdstr),PACKAGE="libjulia"))
}

jexec<-function(cmdstr)
{
  ccall("jl_eval_string",cmdstr)
}

julia_init <- function(juliahome="")
{
  juliabindir <- if (nchar(juliahome) > 0) juliahome else {
    gsub("\"", "", system('julia -E JULIA_HOME', intern=TRUE))
  }
  ccall("jl_init",juliabindir)
  
  ## If on Windows, run a specific push to compensate for R not handling pkg.dir() correctly.
  jexec('@windows_only push!(LOAD_PATH,joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]),".julia",string("v",VERSION.major,".",VERSION.minor)))')
  jexec('@windows_only ENV["HOME"]=joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]))')
}
