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


##Make a datasheet for dealing with bad NA values. 
#Let's make a fake dataset on health center admissions

Respitory<-data.frame(StudentID = 114086259:114086358, Temp = rpois(100,101), 
                      Age = rnbinom(100,size=20,mu=25),
                      Cough = sample(c("None","Mild","Severe"),100,replace=T), 
                      Covid = sample(c(rep(TRUE,15),rep(FALSE,85)),100))
  
#replace some of the cells with NA
Respitory[sample(1:100,5),2] <-NA
  
  
#replace some of the cells with "nan"
Respitory[sample(1:100,5),2] <-"nan"

#replace some of the cells with -999
Respitory[sample(1:100,5),2] <- -999

####One more column...This one we don't care about!
#replace some of the cells with NA
Respitory[sample(1:100,5),1] <-NA


#replace some of the cells with "nan"
Respitory[sample(1:100,5),1] <-"nan"

#replace some of the cells with -999
Respitory[sample(1:100,5),1] <- -999

write.csv(Respitory,file="Messy_CSVs/COVID_NAs.csv")


##Csvs for merging
#need an rbind example and a column ID example. 
#three CSV's total!

WincoBoiseCust<-data.frame(Date = seq(as.Date("2020/01/01"), by = "day", length.out = 366),
                   Location = rep("Boise",366),Customers = rnbinom(366,size=10,mu=300))

write.csv(WincoBoiseCust,file="Messy_CSVs/MergeData/WincoMerge1.csv")

WincoIdahoFallsCust<-data.frame(Date = seq(as.Date("2020/01/01"), by = "day", length.out = 366),
                           Location = rep("IdahoFalls",366),Customers = rnbinom(366,size=10,mu=100))

write.csv(WincoIdahoFallsCust,file="Messy_CSVs/MergeData/WincoMerge2.csv")


WincoFinancialAll<-data.frame(Date = rep(seq(as.Date("2020/01/01"), by = "day", length.out = 366),2),
                              Location = c(rep("Boise",366),rep("IdahoFalls",366)),
                              Income = round(c(rnorm(366,5000,750),rnorm(366,1200,400)),digits=2))

write.csv(WincoFinancialAll,file="Messy_CSVs/MergeData/WincoMerge3.csv")




#Messy date and time data

ToothBrushData<- data.frame( Date = paste0(11:20,"th of July 2020"),
                             StartBrush = c("7:50","7:45","8:15","9:25","7:15","8:00","9:05",
                                            "8:12","8:37","9:10"),
                             EndBrush = c("7:53","7:47","8:16","9:27","7:19","8:03","9:06",
                                            "8:15","8:40","9:14"),
                             GoodJob = sample(c(TRUE,TRUE,TRUE,FALSE),10,replace=T))


write.csv(ToothBrushData,file="Messy_CSVs/ToothBrushingData_Dates_Times.csv")


