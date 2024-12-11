# Gerekli paketleri yükle
install.packages("tidyverse")  # Veri manipülasyonu ve görselleştirme için
install.packages("caret")      # Modelleme için
install.packages("DALEX")      # Model açıklamaları için
install.packages("lime")       # Model açıklamaları için

# Paketleri yükle
library(tidyverse)
library(caret)
library(DALEX)
library(lime)

# Veri setini içe aktar
# Veri setinin yolunu belirtin
data <- read.csv("adult.csv")

# İlk birkaç satırı kontrol et
head(data)

# veri ön işleme 
# Eksik verileri kontrol et
sum(is.na(data))

# Kategorik değişkenleri faktör olarak ayarla
data$workclass <- as.factor(data$workclass)
data$education <- as.factor(data$education)
data$marital.status <- as.factor(data$marital.status)
data$occupation <- as.factor(data$occupation)
data$relationship <- as.factor(data$relationship)
data$race <- as.factor(data$race)
data$sex <- as.factor(data$sex)
data$native.country <- as.factor(data$native.country)
data$income <- as.factor(data$income)  # Hedef değişkeni de faktör yapıyoruz

# Veriyi eğitim ve test setlerine ayır
set.seed(123)
trainIndex <- createDataPartition(data$income, p = 0.7, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

#model eğitimi
# Random Forest modeli eğit
model_rf <- train(income ~ ., data = trainData, method = "rf", 
                  trControl = trainControl(method = "cv", number = 10))

# Modelin özetini al
summary(model_rf)

# Test verisi üzerinde tahminler yap
pred_rf <- predict(model_rf, newdata = testData)

# Confusion matrix ve performans metrikleri
confusionMatrix(pred_rf, testData$income)

# DALEX ile modelin açıklanması
explainer_rf <- explain(model_rf, data = trainData[,-which(names(trainData) == "income")], 
                        y = trainData$income)

# Önemli değişkenleri görselleştir
plot(variable_importance(explainer_rf))

# LIME ile modelin açıklanması
explainer_lime <- lime(trainData[,-which(names(trainData) == "income")], model_rf)

# Test verisindeki 5 gözlem için açıklamalar
explanation <- explain(explainer_lime, testData[1:5, -which(names(testData) == "income")])

# Açıklamaları görselleştir
plot(explanation)

# Cinsiyet ve ırk gibi özellikler üzerinden açıklamalar
explainer_gender <- explain(model_rf, data = trainData[,-which(names(trainData) == "income")], 
                            y = trainData$income, label = "gender")
plot(variable_importance(explainer_gender))
