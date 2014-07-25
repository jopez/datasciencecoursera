# load packages (install using command: install.packages("R.utils"))
require("R.utils")

# getting initial information
initial.dir <- getwd()

# create working dir
if (!file.exists("data")) {
	dir.create("data")
}

# change to working dir
setwd("data")

# download zip file
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="dataset.zip")
dateDownloaded <- date()

# unzip file (be careful, this operation may take long to complete, and the resulting directory's size is ~260MB)
unzip("dataset.zip")

# read data frames - test
xtest.df <- read.table("UCI HAR Dataset/test/X_test.txt", header=F)
ytest.df <- read.table("UCI HAR Dataset/test/y_test.txt", header=F)
subjecttest.df <- read.table("UCI HAR Dataset/test/subject_test.txt", header=F)

# read data frames - train
xtrain.df <- read.table("UCI HAR Dataset/train/X_train.txt", header=F)
ytrain.df <- read.table("UCI HAR Dataset/train/y_train.txt", header=F)
subjecttrain.df <- read.table("UCI HAR Dataset/train/subject_train.txt", header=F)

# combine test data
test.df <- cbind(xtest.df,subjecttest.df,ytest.df)

# combine train data
train.df <- cbind(xtrain.df,subjecttrain.df,ytrain.df)

# combine test and train DFs
main.df <- rbind(train.df,test.df)

# read features
features.df <- read.table("UCI HAR Dataset/features.txt", header=F)

# clean feature names: first pass
fnames <- features.df$V2
fnames <- gsub("^[t]","TimeOf",fnames)
fnames <- gsub("^[f]","FrequencyOf",fnames)
fnames <- gsub("Acc","FromAccelerometer",fnames)
fnames <- gsub("Gyro","FromGyroscope",fnames)
fnames <- gsub("Mag","Magnitude",fnames)
fnames <- gsub("[(][)]","",fnames)
fnames <- gsub("BodyBody","Body",fnames)

# add subject and activity to feature names
fnames <- c(fnames,"Subject","Activity")

# set column names of main.df using our cleanned feature names
colnames(main.df) <- fnames

# extract only the measurements on the mean and standard deviation for each measurement in the main dataframe 
main.df <- main.df[,grep("activity|subject|(-mean)$|-mean-|(-std)$|-std-",tolower(fnames))]

# clean feature names: second pass
colnames(main.df) <- sub("-([XYZ]$)","In\\1Axis",colnames(main.df))
colnames(main.df) <- sub("-mean","Mean",colnames(main.df))
colnames(main.df) <- sub("-std","STD",colnames(main.df))

# read activity labels
alabels.df <- read.table("UCI HAR Dataset/activity_labels.txt", header=F)

# use descriptive activity names to name the activities in the data set, using names in alabels.df
main.df$Activity<-sapply(main.df$Activity, function(x) alabels.df[x,2])

# create a final, independent tidy data set with the average of each variable for each activity and each subject 
tidy.df <-aggregate(.~Activity+Subject,main.df,FUN=mean)

# write tidy data to a CSV file
write.table(tidy.df, file="tidy.csv", row.names=F, col.names=T, sep=",", quote=F)

# write tidy data to a TXT file
write.table(tidy.df, file="tidy.txt", row.names=F, col.names=T, sep="\t", quote=F)

# delete ZIP file
file.remove("dataset.zip")

# delete unzipped folder
unlink("UCI HAR Dataset", recursive=T)

# change back to the original directory
setwd(initial.dir)
