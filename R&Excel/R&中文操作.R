R中的中文操作；

字符个数<-nchar("这是几个字")
字符个数


## 提取求导函数的函数值


f<-expression(x^2+x^3)
求导<-D(f,"x")
求导
第一<-substr(求导[1:2],start=1,stop=10)
第一
第二<-substr(求导[2:3],start=1,stop=10)
第二
as.numeric(substr(第一[2],start=1,stop=2))

as.numeric(substr(第二[2],start=1,stop=2))

