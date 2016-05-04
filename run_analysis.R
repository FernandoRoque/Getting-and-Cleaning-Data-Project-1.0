#######################################################################################################
# 
#              0. Getting data from the Web ans loading it into R 
#
#######################################################################################################

library(dplyr)
library(RCurl)

setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Getting and Cleaning Data/Proyecto3/")

#Download the file and put it in the project folder
if(!file.exists("./project")){dir.create("./project")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url=url, destfile = "./project/Dataset.zip", method = "libcurl")

#Unzip the file
unzip(zipfile = "./project/Dataset.zip", exdir = "./project")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_labels) <- c("Act","Activities")

features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
names(features) <- c("nVar","Var_Name")

############## Train ##############

setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Getting and Cleaning Data/Proyecto3/project/UCI HAR Dataset/train")

sub_train <- read.table("subject_train.txt", colClasses = "character", stringsAsFactors=TRUE)
x_train   <- read.table("x_train.txt")
y_train   <- read.table("y_train.txt")

setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Getting and Cleaning Data/Proyecto3/project/UCI HAR Dataset/train/Inertial Signals")

total_acc_x_train  <- read.table("total_acc_x_train.txt")
body_gyro_x_train  <- read.table("body_gyro_x_train.txt")
body_acc_x_train   <- read.table("body_acc_x_train.txt")

total_acc_y_train  <- read.table("total_acc_y_train.txt")
body_gyro_y_train  <- read.table("body_gyro_y_train.txt")
body_acc_y_train   <- read.table("body_acc_y_train.txt")

total_acc_z_train  <- read.table("total_acc_z_train.txt")
body_gyro_z_train  <- read.table("body_gyro_z_train.txt")
body_acc_z_train   <- read.table("body_acc_z_train.txt")

############## Test ##############

setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Getting and Cleaning Data/Proyecto3/project/UCI HAR Dataset/test")

sub_test <- read.table("subject_test.txt")
x_test   <- read.table("x_test.txt")
y_test   <- read.table("y_test.txt")

setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Getting and Cleaning Data/Proyecto3/project/UCI HAR Dataset/test/Inertial Signals")

total_acc_x_test  <- read.table("total_acc_x_test.txt")
body_gyro_x_test  <- read.table("body_gyro_x_test.txt")
body_acc_x_test   <- read.table("body_acc_x_test.txt")

total_acc_y_test  <- read.table("total_acc_y_test.txt")
body_gyro_y_test  <- read.table("body_gyro_y_test.txt")
body_acc_y_test   <- read.table("body_acc_y_test.txt")

total_acc_z_test  <- read.table("total_acc_z_test.txt")
body_gyro_z_test  <- read.table("body_gyro_z_test.txt")
body_acc_z_test   <- read.table("body_acc_z_test.txt")

#######################################################################################################
#                                                                                                     #
#             1.            Merges the training and the test sets to create one data set.             #
#                                                                                                     #
#             Append all tables with rbind(command)                                                   #
#                                                                                                     #
#                                                                                                     #
#######################################################################################################

sub <- rbind(sub_test,sub_train)
x   <- rbind(x_test,x_train)
y   <- rbind(y_test,y_train)

names(y)   <- "Act"
names(sub) <- "Subject"

total_acc_x  <- rbind(total_acc_x_test,total_acc_x_train)
body_gyro_x  <- rbind(body_gyro_x_test,body_gyro_x_train)
body_acc_x   <- rbind(body_acc_x_test,body_acc_x_train)

total_acc_y  <- rbind(total_acc_y_test,total_acc_y_train)
body_gyro_y  <- rbind(body_gyro_y_test,body_gyro_y_train)
body_acc_y   <- rbind(body_acc_y_test,body_acc_y_train)

total_acc_z  <- rbind(total_acc_z_test,total_acc_z_train)
body_gyro_z  <- rbind(body_gyro_z_test,body_gyro_z_train)
body_acc_z   <- rbind(body_acc_z_test,body_acc_z_train)

#######################################################################################################
#                                                                                                     #
#   2.      Extracts only the measurements on the mean and standard deviation for each measurement    #
#                                                                                                     #
#             Extract only mean and standard deviation measurements based on the feature variable name#
#     using regular expresions.                                                                       #
#                                                                                                     #
#                                                                                                     #
#######################################################################################################

mname <- grep("mean",features$Var_Name)
mnamef <- grep("meanFreq",features$Var_Name)

only_mean <- setdiff(mname, mnamef)
only_std  <- grep("std",features$Var_Name)

nvar <- c(only_mean,only_std)
vars <- features$Var_Name[c(only_mean,only_std)]

x_meas <- x[,nvar]
names(x_meas) <- gsub("\\()","",gsub("-","",vars))


#######################################################################################################
#                                                                                                     #
#             3.            Uses descriptive activity names to name the activities in the data set    #
#                                                                                                     #
#######################################################################################################

x_meas_1  <- data.frame(matrix(as.numeric(unlist(x_meas[1:66])), ncol = 66, nrow = 10299))
names(x_meas_1)<- names(x_meas)


x_y_meas <- cbind(y, x_meas_1)
x_y_meas_n <- merge(activity_labels,x_y_meas,by="Act")[,-2]


#######################################################################################################
#                                                                                                     #
#             4.            Uses descriptive activity names to name the activities in the data set    #
#                                                                                                     #
#             This step is implicit at the end of the step 2.                                         #
#                                                                                                     #
#                                                                                                     #
#######################################################################################################

setwd("C:/Users/Fernando/Documents/Material/Coursera/DataScience/Getting and Cleaning Data/Proyecto3/")
write.table(x_y_meas_n, file="tidy_data.txt", row.name=FALSE)


#######################################################################################################
#                                                                                                     #
#             5.            From the data set in step 4, creates a second, independent tidy data set  #
#             with the average of each variable for each activity and each subject.                   #
#                                                                                                     #
#                                                                                                     #
#                                                                                                     #
#                                                                                                     #
#######################################################################################################

x_y_meas_n_sub <- cbind(sub,x_y_meas_n)
grouped <- group_by(x_y_meas_n_sub, Subject, Activities)

mean_meas <- x_y_meas_n_sub %>% 
              group_by(Subject, Activities) %>% 
                summarise_each(funs(mean))

#######################################################################################################




