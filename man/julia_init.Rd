\name{julia_init}
\title{Start Julia from R, properly initializing the  R--Julia Interface}
\alias{julia_init}
\description{
  Start Julia from \R, properly initializing the  \R--Julia interface.
}
\usage{
julia_init(juliahome = "")

}
\arguments{
  \item{juliahome}{the home directory of the julia installation; should
    rarely be needed.}
}
%% \details{
%% %%  ~~ If necessary, more details than the description above ~~
%% }
\value{
  \code{julia_init()} returns \code{\link{NULL}} if successful, an error
  otherwise

}
\seealso{
  \code{\link{r2j}}, \code{\link{j2r}}, \code{\link{julia_eval}}.
}
\examples{
try( julia_init() ) # should work if julia is properly installed
}
\keyword{interface}
