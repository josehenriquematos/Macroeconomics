library(sidrar)
library(tidyverse)
#Input dos dados de taxa de desemprego:
cod_sidra <- "/t/6381/n1/all/v/4099/p/last%2024/d/v4099%201"
dados_sidra <- sidrar::get_sidra(api = cod_sidra)
colnames(dados_sidra)[10] = "Trimestre_Movel_Data"
colnames(dados_sidra)[5] = "Taxa_Desemprego"
thinned <- floor(seq(from=1,to=dim(dados_sidra)[1],length=24))
ggplot(data = dados_sidra) +
  geom_line(mapping = aes(x=Trimestre_Movel_Data, y=Taxa_Desemprego, group = 1)) +
  ggtitle("Taxa de Desemprego em Trimestre Móvel")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  geom_point(data=dados_sidra[thinned,], aes(x=Trimestre_Movel_Data, y=Taxa_Desemprego, group = 1))