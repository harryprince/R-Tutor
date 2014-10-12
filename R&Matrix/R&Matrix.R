##R中矩阵处理方式


matrix(c(1:12),nrow=6,ncol=2,byrow=TRUE,dimnames=list(rnames,cnames))
##错误经验：中文括号出错

#############data.frame###########
#data.frame(col1,col2,coln)
A<- c(1:2)###A为第一列的variable name
B<- c(3:4)##B为第二列的variable name
C<- rep("c",2)##C 为第三列的variable name
D<- data.frame(A,B,C)##data.frame直接将3个variable name联立到一起；他们竖条地摆放着
##########通过data.frame创建最完美的数据格式##########

col1<- c(1:10)
col2<- c(2:11)
df<-data.frame(X=col1,Y=col2)      
df[1:4,]######选取框中数据
#########
attach(df)##定位到
summary(X)##总结
#Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#1.00    3.25    5.50    5.50    7.75   10.00 
plot(df)#画图
detach(df )##离开定位  ##好的编程习惯
##常用计算函数
log(x)
log10(x)
exp(x)
sin(x)
cos(x)
tan(x)
asin(x)
acos(x)
min(x)
max(x)
range(x)
length(x)
统计检验
mean(x)
sd(x)
var(x,y)##协方差 二阶混合中心距
cov(x)
median(x)
quantile(x,p)
cor(x,y)##相关系数 本质上就是协方差的标准化形式
t.test()
lm(y ~ x)
wilcox.test()
kruskal.test()
sort(mainMatrix[1,])##sort vector
plot(x, y, main="Main title", sub="subtitle",xlab="x-label", ylab="y-label")
##plot 5个要点：自变量、因变量、主题、子题、横坐标意义、纵坐标意义
##plot其他参数：add=TURE 可以叠加图形；axes=TRUE画边框；xlim=range(x)##限制坐标范围
Two graphs in one plot
plot(x1,y1)
matplot(x2,y2,add=T)##相当于hold on 在matlab中
plot(c(1:10,10:1), asp=1)##网格密度
grid()
x<- c(1:3)
stem(x[,3])

C<-matrix(1:9,3,3)##testMatrix


B[-2,-3]##miss the col or row

matrix(value<-0,m,n)##zeros(m,n)
diag(m,n)##unit matrix
as.vector(t(B)) ## a'(:)##把矩阵拍扁
eigen(C)$values##求特征值
eigen(C)$vectors##特征向量
apply(C,2,sum)##列求和
apply(C,1,sum)##行求和
apply(C,1,sort)
apply(C,2,cummax)

apply(a,2,max)##列最值  牛逼函数##可以替代Excel中 先sum 再拖动的操作
apply(C,1,max)##行最值

C[,3:1]  ##矩阵逆序显示
lower.tri(C)##矩阵下三角
upper.tri(C)##矩阵上三角
prod(as.vector(t(C)),as.vector(t(B)))##连乘product
prod(dim(C))##m*n
     svd(C)$d##奇异值
object.size(C)  ##高级一点。。计算内存消耗
outer(as.matrix(B),C)##外积
crossprod(as.matrix(B),C)##内积

outer(c(1,2,3),c(2,3,4))
solve(Aij,as.matrix(b,byrow=TRUE))##求解矩阵方程

svd(mainMatrix)
