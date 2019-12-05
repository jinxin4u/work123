#
# 김신혁
# 제출일 : 191205
# Project #1 - 제주 CCTV 현황 분석
#

# '인구대비 CCTV 수(CCTV 보급량)' 와 '범죄율' 상관관계 분석

# including library
install.packages('xlsx')
install.packages('rJava')
install.packages('dplyr')
library('rJava')
library('xlsx')
library('dplyr')

# Importing data set
setwd('D:/work123/R_Project/reference')

Korea_Population <- read.xlsx(file = 'korea_population.xlsx', sheetIndex = 1, encoding = 'UTF-8')
Korea_Population

Korea_CCTV <- read.xlsx(file = 'korea_cctv.xlsx', sheetIndex = 1, encoding = 'UTF-8')
Korea_CCTV

Crim_Evidence <- read.csv(file = 'evidence.csv', header = T, encoding = 'UTF-8')
Crim_Evidence

Crim_Area <- read.csv(file = 'crim_area.csv', header = T, encoding = 'UTF-8')
Crim_Area


