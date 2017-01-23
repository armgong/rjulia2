library(rjulia2)

julia_init()


jDo('df = DataFrame(A = 1:4, B = ["M", "F", "F", "M"])')
j2r("df","rdf")
typeof(rdf)
is.data.frame(rdf)
rdf

## because julia data frame don't allow column name like R,so need change iris column name
names(iris) <- c("sl","sw","pl","wl","speics")
r2j("iris","jiris")
j2r("jiris","riris")
riris[1:10,]
riris[140:150,]

jDo('pdv = @pdata(["Group A", "Group A", "Group A","Group B", "Group B", "Group B"])')

j2r("pdv","rpdv")
rpdv

j2r('levels(pdv)',"rpdvl")
rpdvl

jDo('df = DataFrame(A = [1, 1, 1, 2, 2, 2],B = ["X", "X", "X", "Y", "Y", "Y"])')
j2r("df","rdf")
rdf

jDo('pool!(df, [:A, :B])')
j2r('df',"rdf")

