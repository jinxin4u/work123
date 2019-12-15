# API TEST
# 한국문화관광연구원 관광실태조사 OPEN API KEY
# UfHGUnhETHUIu05gtWlnOr9kYTS6qYGIpVLdEey%2BUStCp%2BlFUbkViF0ifHJpdh1%2B7tqp9WpejcyDg2cae%2FQz4A%3D%3D

# 1. api 키 발급
# 2. 호출
# 3. xml parsing
# 4. data.frame화
# 5. 저장

install.packages("XML")
install.packages("RCurl")
library(XML)
library(RCurl)

api_url = "http://openapi.tour.go.kr/openapi/service/TourismAccdtService"
operation = "/getTourismTotqyList"
YY = "?YY=2016"
pageNo = "&pageNo="
numOfRows = "&numOfRows="
key = "&serviceKey=UfHGUnhETHUIu05gtWlnOr9kYTS6qYGIpVLdEey%2BUStCp%2BlFUbkViF0ifHJpdh1%2B7tqp9WpejcyDg2cae%2FQz4A%3D%3D"


requestUrl = paste0(api_url,operation,key)

page = getForm( paste0(requestUrl,"1") ) # 1번페이지 불러오기
doc = xmlToDataFrame(page)
str(doc)
