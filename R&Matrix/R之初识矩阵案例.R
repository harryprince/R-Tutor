##欢迎来信交流7harryprince@gmail.com ##欢迎直接复制代码&bug反馈
##R之初识矩阵案例

##知识背景：单纯形法 线性代数
##本案例选取 清华大学运筹学 第3版P76 2.10

##默认标准型##
##初始化单纯形法矩阵##
x1<-c(8,10,2)
x2<-c(2,5,13)
x3<-c(10,8,10)
b<-c(300,400,420)##resource constraint
Cj<-c(3,2,2.9,0,0,0,0)##value coefficent
#########矩阵产生的过程############
Aij<- data.frame(x1,x2,x3)##产生Aij系数矩阵
as.matrix(Aij)##强制Aij变为矩阵形式
rowAij<-nrow(Aij)##计算Aij矩阵行数
Matrix0<- rbind(cbind(Aij,diag(rowAij),b),Cj)## m*n主矩阵
m<- nrow(Matrix0)##也可以用dim(Matrix0)[1]表示
n<- ncol(Matrix0)##也可以用dim(Matrix0)[2]表示
names<-LETTERS[n:26]##产生字母，LETTERS是26个系统自带的字母#以数组形式存储
colnames(Matrix0)<- c(names[1:n-1],"右侧值")##列名称，涉及最右侧
rownames(Matrix0)<- c(names[(m+1):n-1],"检验数")##行名称，涉及检验数，
Matrix0        ##重新显示主矩阵
prod(dim(Matrix0))##计算矩阵元素的总个数#prod()意思是product()
######矩阵初始化完成#######

######开始矩阵操作#############
B<-Matrix0[1:m-1,(m+1):n-1]##提取基B
inverseB<-solve(B)  ##solve() 求矩阵的逆
eigen(B)##计算基B的特征值、特征向量
##
检验数ij1<-which(Matrix0[m,]==max(Matrix0[m,]),arr.ind=T)##找到第一次迭代中最大的检验数
检验数1<-Matrix0[m,检验数ij1[2]]##此时的检验数数值
θ1<- Matrix0[1:m-1,n]/Matrix0[1:m-1,检验数ij[2]]
min(θ1)##最小θ原则
主元1<-   Matrix0[which(θ1==min(θ1),arr.ind=TRUE),检验数ij1[2]]
##迭代过程##
newrow1<-Matrix0[which(θ1==min(θ1),arr.ind=TRUE),]/主元1
newrow2<-  Matrix0[2,]-Matrix0[which(θ1==min(θ1),arr.ind=TRUE),]*Matrix0[2,检验数ij1[2]]/主元1 
newrow3<- Matrix0[3,]-Matrix0[which(θ1==min(θ1),arr.ind=TRUE),]*Matrix0[3,检验数ij1[2]]/主元1
newrow4<- Matrix0[4,]-Matrix0[which(θ1==min(θ1),arr.ind=TRUE),]*Matrix0[4,检验数ij1[2]]/主元1 
########
Matrix1<-rbind(newrow1,newrow2,newrow3,newrow4)##迭代过一次以后的结果

##再次寻找检验数
检验数ij2<-which(Matrix1[m,]==max(Matrix1[m,]),arr.ind=T)##找到第二次迭代中最大的检验数
检验数2<-Matrix1[m,检验数ij2[2]]##此时的检验数数值
θ2<- Matrix1[1:m-1,n]/Matrix1[1:m-1,检验数ij2[2]]
min(θ2)
主元2<-   Matrix1[which(θ2==min(θ2),arr.ind=TRUE),检验数ij2[2]]

##迭代过程##
newrow22<-Matrix1[which(θ2==min(θ2),arr.ind=TRUE),]/主元2
newrow21<-  Matrix1[1,]-Matrix1[which(θ2==min(θ2),arr.ind=TRUE),]*Matrix1[1,检验数ij2[2]]/主元2 
newrow23<- Matrix1[3,]-Matrix1[which(θ2==min(θ2),arr.ind=TRUE),]*Matrix1[3,检验数ij2[2]]/主元2
newrow24<- Matrix1[4,]-Matrix1[which(θ2==min(θ2),arr.ind=TRUE),]*Matrix1[4,检验数ij2[2]]/主元2 
Matrix2<-rbind(newrow21,newrow22,newrow23,newrow24)##迭代过二次以后的结果

##再次寻找检验数
检验数ij3<-which(Matrix2[m,]==max(Matrix2[m,]),arr.ind=T)##找到第三次迭代中最大的检验数
检验数3<-Matrix2[m,检验数ij3[2]]##此时的检验数数值
分子<-Matrix2[1:m-1,检验数ij3[2]]
分母<-Matrix2[1:m-1,n]
θ<- 分母/分子
θ[which(θ<=0,arr.ind=TRUE)]<- 1000000
θ3<-θ 
minθ3<-as.numeric(min(θ3))
主元3<-   Matrix2[which(θ3==min(θ3),arr.ind=TRUE),检验数ij3[2]]


##迭代过程##
newrow33<-Matrix2[which(θ3==min(θ3),arr.ind=TRUE),]/主元3
newrow31<-  Matrix2[1,]-Matrix2[which(θ3==min(θ3),arr.ind=TRUE),]*Matrix2[1,检验数ij3[2]]/主元3 
newrow32<- Matrix2[2,]-Matrix2[which(θ3==min(θ3),arr.ind=TRUE),]*Matrix2[2,检验数ij3[2]]/主元3
newrow34<- Matrix2[4,]-Matrix2[which(θ3==min(θ3),arr.ind=TRUE),]*Matrix2[4,检验数ij3[2]]/主元3 
Matrix3<-rbind(newrow31,newrow32,newrow33,newrow34)##迭代过三次以后的结果
##最终单纯型表
#G H I     J          K           L      右侧值
#J      1 0 0 -0.09  0.1833333 -0.05666667   22.533333
#K      0 1 0 -0.14  0.1000000  0.06000000   23.200000
#L      0 0 1  0.20 -0.1666667  0.03333333    7.333333
#检验数 0 0 0 -0.03 -0.2666667 -0.04666667 -135.266667
##此时达到最优情况
cat("初始单纯形表为","Matrix0，","最终单纯形表为","Matrix3，","迭代次数为3次")
#####由于本题的特殊性，可以直接用矩阵方程的求解方式，找到最简阶梯行列式，得出最优解

####the opt X#####
x<-as.vector(solve(Aij,as.matrix(b,byrow=TRUE)))##solve the matrix equation
#####the opt Z####
z<-sum((x*c(3,2,2.9)))##as.vector(Matrix0[m,1:(n-m-1)])
cat("the opt solution","Z=",z,","," X*=",x)
##这题刚好就是3个变量都是基变量；所以化成阶梯行列式后直接可以得出最优方案；进一步得最优解
##写出Aij和Bj直接求得X*；再乘以Cj得最优方案

##可改进之处：1.可以尝试ifelse语句来控制迭代过程
##            2.可以增加语句来控制左侧基变量的显示


