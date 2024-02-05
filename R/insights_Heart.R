library(ggplot2)
set.seed(123)
#Histogramas
hist(
  Heart_data_trusted$Biking,
  xlab = 'Ciclismo',
  ylab = 'Frequencia',
  main = 'Histograma de ciclismo'
)

hist(
  Heart_data_trusted$Smoking,
  xlab = 'Fumo',
  ylab = 'Frequencia',
  main = 'Histograma de fumantes'
)

hist(
  Heart_data_trusted$Heart_Disease,
  xlab = 'Doença cardíaca',
  ylab = 'Frequencia',
  main = 'Histograma de doença cardíaca'
)

#Relação de ciclismo e doença cardíaca
bike_disease <- lm(Heart_data_trusted$Heart_Disease~Heart_data_trusted$Biking)
summary(bike_disease)
bike <- ggplot(mapping = aes(Heart_data_trusted$Heart_Disease,Heart_data_trusted$Biking)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
bike

#Relação de tabagismo e doença cardíaca
smoke_disease <-lm(Heart_data_trusted$Heart_Disease~Heart_data_trusted$Smoking)
summary(smoke_disease)
smoke <- ggplot(mapping = aes(Heart_data_trusted$Heart_Disease,Heart_data_trusted$Smoking)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
smoke

#Separando por quantidade os fumantes
smoking_mean <- mean(Heart_data_trusted$Smoking)
smoking_min <- min(Heart_data_trusted$Smoking)
smoking_max <- max(Heart_data_trusted$Smoking)

data_complete <- lm(Heart_data_trusted$Heart_Disease~Heart_data_trusted$Biking+Heart_data_trusted$Smoking)
summary(data_complete)

smoking_mean <- round(smoking_mean,digits = 0)
low_smoke <- Heart_data_trusted[Heart_data_trusted$Smoking < smoking_mean,]
mean_smoke <- Heart_data_trusted[Heart_data_trusted$Smoking == smoking_mean,]
high_smoke <- Heart_data_trusted[Heart_data_trusted$Smoking > smoking_mean,]

#tipo de fumante x doença
low_desease <- ggplot(mapping = aes(low_smoke$Heart_Disease,low_smoke$Smoking)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
low_desease
low_lm <- lm(low_smoke$Heart_Disease~low_smoke$Smoking)

high_desease <- ggplot(mapping = aes(high_smoke$Heart_Disease,high_smoke$Smoking)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
high_desease
high_lm <- lm(high_smoke$Heart_Disease~high_smoke$Smoking)


mean_desease <- ggplot(mapping = aes(mean_smoke$Heart_Disease,mean_smoke$Smoking)) +
  geom_point() +
  geom_smooth(se = FALSE, method = "lm")
mean_desease
mean_lm <- lm(mean_smoke$Heart_Disease~mean_smoke$Smoking)

summary(low_lm)
summary(high_lm)
summary(mean_lm)


