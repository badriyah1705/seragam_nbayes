# Klasifikasi dan Prediksi Keterlambatan Pembayaran Uang Seragam di SMKN 3 Kediri
# Menggunakan Naive Bayes

# Installing Packages
install.packages("readxl")
install.packages("e1071")
install.packages("caret")

# Loading package
library(readxl)
library(e1071)
library(caret)

#load dataset
data<-read_excel("/home/badriyah/A_Statistika_Bayesian/uas/dataset_seragam_smk3kediri.xlsx")
View(data)

# printing the head of the data
print("Daftar Pembayaran Uang Seragam")
head(data)
tail(data)

str(data)

summary(data)


# Splitting data into train
# and test data
sampel=sample(1:nrow(data),0.9*nrow(data),replace=TRUE)
training=data.frame(data)[sampel,]
testing=data.frame(data)[-sampel,]

# Fitting Naive Bayes Model 
# to training dataset
klasifikasiNB=naiveBayes(KET_Bayar~.,data=training)
klasifikasiNB

# Predicting on test data'
prediksi=predict(klasifikasiNB,testing)
prediksi

# Model Evaluation
cm=confusionMatrix(table(prediksi,testing$KET_Bayar))
cm
