# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# SFA (Stochastic Frontier Analysis Models) Use npsf (sf) With (In) R Software
install.packages("readxl")
install.packages("httr")
install.packages("npsf")
install.packages("utf8")
library("httr")
library("readxl")
library("npsf")
library("utf8")
# Import Data Excel Into R From Github Olah Data Semarang (timbulwidodostp)
github_link <- "https://github.com/timbulwidodostp/npsf/raw/main/npsf/npsf.xlsx"
temp_file <- tempfile(fileext = ".xlsx")
req <- GET(github_link, 
# authenticate using GITHUB_PAT
authenticate(Sys.getenv("GITHUB_PAT"), ""),
# write result to disk
write_disk(path = temp_file))
npsf <- readxl::read_excel(temp_file)
# Estimation SFA (Stochastic Frontier Analysis Models) Use npsf (sf) With (In) R Software
Stochastic_Frontier_Analysis_one <- sf(log(Y) ~ log(L) + log(K), data = npsf, subset = year == 1965, distribution = "h")
TE_One <- Stochastic_Frontier_Analysis_one$efficiencies$BC
Stochastic_Frontier_Analysis_two <- sf(log(Y) ~ log(L) + log(K), data = npsf, subset = year == 1965, distribution = "e")
TE_Two <- Stochastic_Frontier_Analysis_two$efficiencies$BC
Technical_Efficiency_TE <- data.frame(TE_One, TE_Two)
Technical_Efficiency_TE
# SFA (Stochastic Frontier Analysis Models) Use npsf (sf) With (In) R Software
# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Finished