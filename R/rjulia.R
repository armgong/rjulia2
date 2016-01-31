cstrnull<-function(orgstr)
{
  return (c(charToRaw(orgstr),as.raw(0)))
}

ccall<-function(fname,cmdstr)
{
  invisible(.C(fname,cstrnull(cmdstr)))
}

jexec<-function(cmdstr)
{
  ccall("jl_eval_string",cmdstr)
}

julia_init <- function(juliahome="")
{
  ## Check Julia exists on the system. If it doesn't, stop immediately.
  juliabindir <- if (nchar(juliahome) > 0) juliahome else {
    gsub("\"", "", system('julia -E JULIA_HOME', intern=TRUE))
  }
  ## Otherwise, initialise Julia using the provided home directory.
  ccall("jl_init",juliabindir)
  
  ## If on Windows, run a specific push to compensate for R not handling pkg.dir() correctly.
  jexec('@windows_only push!(LOAD_PATH,joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]),".julia",string("v",VERSION.major,".",VERSION.minor)))')
  jexec('@windows_only ENV["HOME"]=joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]))')
}

###  MM: (ess-set-style 'DEFAULT)  ==> only indent by 2
## Local Variables:
## eval: (ess-set-style 'DEFAULT 'quiet)
## delete-old-versions: never
## End:
