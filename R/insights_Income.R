library(ggplot2)
set.seed(123)
Income_data_trusted$Income_Range <- cut(
  Income_data_trusted$Income,
  breaks = c(-Inf, 2, 4, 6, 8, Inf),
  labels = c("0-3", "3-4", "4-6", "6-7", "7+"),
  include.lowest = TRUE
)

#Gerando gráfico
income.graph <- ggplot(Income_data_trusted, aes(Income, Happiness)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  theme_bw() +
  labs(
    title = "Felicidade em função dos ganhos financeiros",
    x = "Ganhos (x$10.000)",
    y = "Pontuação de felicidade (0 a 10)"
  ) +
  facet_wrap(~Income_Range, scales = "free")
income.graph

#Variancia
variance_by_range <- tapply(Income_data_trusted$Happiness, 
                            Income_data_trusted$Income_Range, var)
#Média
mean_by_range <- tapply(Income_data_trusted$Happiness, 
                        Income_data_trusted$Income_Range, mean)
# Calcular o mínimo para cada intervalo de renda
min_by_range <- tapply(Income_data_trusted$Happiness, 
                       Income_data_trusted$Income_Range, min)

# Calcular o máximo para cada intervalo de renda
max_by_range <- tapply(Income_data_trusted$Happiness, 
                       Income_data_trusted$Income_Range, max)

# Calcular a diferença entre o máximo e o mínimo para cada intervalo de renda
difference_by_range <- max_by_range - min_by_range
difference_by_range

#Correlação
cor(Income_data_trusted$Income, Income_data_trusted$Happiness)

#Regressão linear
model <- lm(Happiness ~ Income, data = Income_data_trusted)
model
plot(model)

#Previsao dos dados
previsao <- predict.lm(model)
Income_data_trusted$Predict <- previsao

Income_data_trusted$Predict
cor(Income_data_trusted$Income,Income_data_trusted$Predict)

