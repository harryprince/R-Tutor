##依旧是清华运筹三版P76 2.10
##这题刚好就是3个变量都是基变量；所以化成阶梯行列式后直接可以得出最优方案；进一步得最优解
##写出Aij和Bj直接求得X*；再乘以Cj得最优方案

##default:solve max problem;direciton is "<=")
x1<-c(8,10,2)
x2<-c(2,5,13)
x3<-c(10,8,10)
b<-c(300,400,420)##resource constraint
Cj<-c(3,2,2.9,0,0,0,0)##value coefficent
#########matrix in processing############
Aij<- data.frame(x1,x2,x3)##generate the matrix of Aij,represents the cost
as.matrix(Aij)##convert vectors to matrix
rowAij<-nrow(Aij)##count the row number of Aij
mainMatrix<- rbind(cbind(Aij,diag(rowAij),b),Cj)## m*n matrix
m<- nrow(mainMatrix)##dim(mainMatrix)[1]
n<- ncol(mainMatrix)##dim(mainMatrix)[2]
names<-LETTERS[n:26]##generate the letters
colnames(mainMatrix)<- c(names[1:n-1],"rightHandSide")## name the col
rownames(mainMatrix)<- c(names[(m+1):n-1],"test")
mainMatrix
prod(dim(mainMatrix))##m*n
######matrix initilizaiton completed#######

######start to use the matrix#############
B<-mainMatrix[1:m-1,(m+1):n-1]
inverseB<-solve(B)
eigen(B)
####the opt X#####
x<-as.vector(solve(Aij,as.matrix(b,byrow=TRUE)))##solve the matrix equation
#####the opt Z####
z<-sum((x*c(3,2,2.9)))##as.vector(mainMatrix[m,1:(n-m-1)])
cat("the opt solution","Z=",z,","," X*=",x)

ij<-which(mainMatrix==max(mainMatrix[m,]),arr.ind=T)
mainMatrix[ij]
########
##ij <- which(C>5.5, arr.ind=T); ##最强大的指针系统来了
##v <- C[ij]##根据指针定位数值

##class(mainMatrix)
##length(mainMatrix) ##(m+n)
##extreme<- c("Max = TRUE","Max = FALSE")##extreme situation
##which(mainMatrix[m,]>=max(mainMatrix[m,]))## judge degeneration problem
##?which(mainMatrix[,])
##?which.mainMatirx[4,]==(max(mainMatrix[4,])))
##public static class main(args[]){}



#simplex<- function(Aij,b,Cj){
  
#}
#apply(mainMatrix,1,2,function)s row ,2 is col
#ifelse(condition1,result1,result2)