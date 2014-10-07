#以下是一些常用的向量选取技巧
#包括 数列的生成；条件向量的选取；
#涉及的常用函数：cat(),seq(),row[()|()]
#ctrl + enter 快速执行；ctrl + shift + enter 直接执行整个文档
#ctrl + shift + N 新建文档,ctrl + O(pen)打开文档；
#ctrl + 2 光标定位到控制台
#ctrl + 1 光标定位到编辑器
#ctrl  + shift + C 变成comment
#command D 删除行；command delete 删除左边
# alt  + - ：赋值符号插入 <- 
# command alt B运行光标以前的所有代码
# command alt E运行光标以后的所有代码
# command shift O 运行外部文件的代码

X <- c(1:10,NA)
Y <- log(X+1,2)
mean(X)
cov(X,Y)      #return error cause the NA

na.rm
mean(X,na.rm=TRUE)
cov(X,Y,na.rm=TRUE)

#数列生成函数 
row <- seq(from=2,to=10,by=1)
column <- seq(from=2,to=12,length.out=3)
cat(row,column)
#重复数列
repeat_row <- rep(2,times=5)
print(repeat_row)

#向量比较运算符： == != < > <= >=  返回 TRUE 或 False
#向量选取： 狗[n]
row[2];
row[2:4];

#偶数选取
row[row %% 2 == 0] 
#奇数选取
row[row %% 2 == 1]
#比较选取技巧
row[ row < 5 ]

#选取所有小于中位数的元素
row[row < median(row)]

#选取分布两端5%的元素
row[(row < quantile(row,0.05))|(row < quantile(row,0.95))]

#选取所有处于均值的两倍标准差区间以外的元素
temp <- row[( abs(row - mean(row)) > 2*sd(row))]
print(temp)

#选取空值
row[ !is.na(row) & !is.null(row)]

