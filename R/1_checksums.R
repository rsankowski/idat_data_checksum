library(tools)
library(tidyverse)

df <- data.frame()

df <- map(list.files("data"), function(x){
  a <- data.frame(File=list.files(file.path("data",x)),
                  Diagnosis= rep(x,2),
                  md5_checksum=unname(md5sum(file.path("data",x,list.files(file.path("data",x))))))
  
  df <- bind_rows(df, a)           
}) %>% 
  bind_rows()

write_csv(df, file.path("data","idat_files_checksums.csv"))
