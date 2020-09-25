#Make a long form CSV
#I think we should use slightly ridiculous examples because they are funny and memorable
#Here I'll do cheetah speed, spot number, and some personality characteristics 

#it's easier to create a df in wide form. I'll do that then convert
Cheetas<-data.frame(ID=1:100, MaxSpeed = rpois(100,65), NumberSpots = rnbinom(100,size=2,mu=250),
                    Birthday = as.character(sample(seq(as.Date("2014/09/04"), by = "day", length.out = 1000),100)),
                    CelebratesBirthday = sample(c(TRUE,FALSE),100,replace=T))

#make it loong
Cheetas <- tidyr::gather(Cheetas, Measurement, Value, MaxSpeed:CelebratesBirthday, factor_key=TRUE)

#create the csv
write.csv(Cheetas,file="Messy_CSVs/Cheetas_long.csv")

#check it
x<-read.csv("Messy_CSVs/Cheetas_long.csv")
