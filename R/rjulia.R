cstrnull<-function(orgstr)
{
  return (c(charToRaw(orgstr),as.raw(0)))
}

ccall<-function(fname,cmdstr)
{
  functionsym<-getNativeSymbolInfo(fname)
  invisible(.C(functionsym,cstrnull(cmdstr)))
}


.julia_init_if_necessary <- function() {
  if (!.isJuliaOk) {
    message("Julia not yet running. Calling julia_init() ...")
    julia_init()
    if (!.isJuliaOk)
      stop("Julia *still* not running. Giving up.")
    else
      message("julia_init complete successfully")
  }
}
# for version 1.0
jDo<-julia_void_eval<-julia_eval<-function(cmdstr)
{
  .julia_init_if_necessary()
  #first clear julia exception
  ccall("jl_eval_string",'ccall(:jl_exception_clear,Void,());')
  #second eval julia expression
  ccall("jl_eval_string",cmdstr)
  #then,try catch and show julia execption
  ccall("jl_eval_string",
        'if ccall(:jl_exception_occurred,Ptr{Void},())!=C_NULL
            rjuliaexception=ccall(:jl_exception_occurred,Any,());
            showerror(STDERR,rjuliaexception);
            println("");
            ccall(:jl_exception_clear,Void,());
       end')  
}

jInit<-julia_init <- function(juliahome="")
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
  .isJuliaOk<<-T 
  ## If on Windows, run a specific push to compensate for R not handling pkg.dir() correctly.
  ##jDo('@windows_only push!(LOAD_PATH,joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]),".julia",string("v",VERSION.major,".",VERSION.minor)))')
  ##jDo('@windows_only ENV["HOME"]=joinpath(string(ENV["HOMEDRIVE"],ENV["HOMEPATH"]))')
  ## Loading julia packages
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
