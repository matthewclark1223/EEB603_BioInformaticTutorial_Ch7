#install packages if necessary
#install.packages(c("learnr","knitr","tidyverse","lubridate","readr"))

#load necessary packages
library(learnr)
library(knitr)
library(tidyverse)
library(lubridate)
library(readr)

#create a folder for all this stuff
dir.create("Ch7_DataTidying")
#check out the url to make sure it's working
url("https://github.com/matthewclark1223/EEB603_BioInformaticTutorial_Ch7/archive/master.zip")


#save the url
Url_all="https://github.com/matthewclark1223/EEB603_BioInformaticTutorial_Ch7/archive/master.zip"
#download the file
download.file(Url_all, destfile = "Ch7_DataTidying/everything2.zip")

#unzip the file
unzip(zipfile = "Ch7_DataTidying/everything2.zip", exdir = "CH7_DataTidying")
# Check to see what files in the folder. 
list.files("CH7_DataTidying/EEB603_BioInformaticTutorial_Ch7-master/EEB_603_CH_7_Tutorial")
#render the document
rmarkdown::render("CH7_DataTidying/EEB603_BioInformaticTutorial_Ch7-master/EEB_603_CH_7_Tutorial/EEB_603_CH_7_Tutorial.Rmd")
#run the tutorial
rmarkdown::run("CH7_DataTidying/EEB603_BioInformaticTutorial_Ch7-master/EEB_603_CH_7_Tutorial/EEB_603_CH_7_Tutorial.Rmd")
