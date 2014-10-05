#R和线性代数##
##背景知识：线性代数
##喜闻乐见矩阵之：正定矩阵：主对角线上的元素都大于0；
##喜闻乐见矩阵之：正交矩阵：矩阵的逆=矩阵的转置（逆一般不好求，正交矩阵减少了计算量）

#data.frame(col1,col2,coln)
A<- c(1:3)###A为第一列的variable name
B<- c(3:5)##B为第二列的variable name
C<- rep(20,3)##C 为第三列的variable name
D<- data.frame(A,B,C)##data.frame直接将3个variable name联立到一起；他们竖条地摆放着
##产生案例数据框 D##
plot(D)##查看各自的关系图；本质上就是协方差矩阵
summary(D)##快速查看基本统计信息

R<-matrix(seq(1,18,4),3,3)##产生一个简单的案例矩阵 R

R[,3:1]  ##矩阵逆序显示
lower.tri(R)##矩阵下三角##下三角矩阵 
upper.tri(R)##矩阵上三角##上三角矩阵
prod(as.vector(t(R)),as.vector(t(R)))##连乘product
prod(dim(R))##总个数

object.size(R)  ##高级一点。。计算内存消耗
outer(as.matrix(D),R)##外积   即叉乘；两两对应成比例 表示 两两平行
crossprod(as.matrix(B),R)##内积 即点乘；点乘=0 表示 两两正交

##singular value deRomposition奇异值分解
svd(R)##奇异值分解 国内一般研究生课程； MIT本科也教 在网易公开课可见
svd(R)$d##奇异值
svd(R)$u##左奇异矩阵
svd(R)$v##右奇异矩阵
##任何矩阵都可以进行奇异值分解，奇异值源于桥梁建设，后来用在图像识别、信号处理。
##奇异值计算过程
tempR <-R%*%t(R) ##
##奇异值=特征值开根号
特征值<- eigen(tempR)$values
单位特征向量<- eigen(tempR)$vectors
奇异值矩阵d<-diag(特征值^0.5)
##左奇异值矩阵
左奇异值矩阵u<- 单位特征向量
##右奇异值矩阵
R的逆<-solve(tempR)
奇异值矩阵d的逆<- solve(奇异值矩阵d)
##此处右奇异值矩阵计算结果有误 望高手指正
右奇异值矩阵v<-R的逆%*%左奇异值矩阵u%*%奇异值矩阵d的逆

##未完工
##解矩阵方程组
##构造一个由方阵+右侧值构成的增广矩阵,使用solve函数求解
##解矩阵方程组即将矩阵化为最简行阶梯型矩阵，得出最优解
##solve()
##
#outer(c(1,2,3),c(2,3,4))
#solve(D,as.matrix(R[,3],byrow=TRUE))##求解矩阵方程

##基础计算函数
log(2)#对数函数 默认底数为e，即ln();此处以ln2为例
log(100,10)#表示以10为底，100的对数 对数在简化乘法计算方面有重要贡献
log10(D)##系统自带常用的以10为底 的log10()函数
exp(D)##指数函数
sin(D)
cos(D)
tan(D)
asin(1)##arcsin()
acos(1)##arccos()
min(D)
max(D)
range(D)
length(D)
###
