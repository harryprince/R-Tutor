# R&微积分
##计算定积分 不定积分 求偏导 求梯度 求海塞矩阵 求三重积分

积分值<- integrate(dnorm, 1, 10)[1]##从1到10的标准正态分布的积分
积分值

积分的计算误差<- integrate(dnorm, 1, 10)[2]
积分的计算误差

## 自定义一个算法 再积分
算法 <- function (M) {
  1/((M+1)*sqrt (M))
  }
integrate(算法 , lower = 0, upper = 2)

##求偏导数
表达式<- expression(sin(x)^2/(cos(x)^3) + 3*y)

D(表达式,"x")
D(表达式,"y")




##
f<- function(x,y) {
  r <- sqrt(x^2+y^2)
      10 * sin(r)/r } 

##求外积
z <- outer(x,y,f)
plot(z)

##复数表示方法
x<- 1-2i
x<-complex(1,2) ##complex(虚部，实部)

复数<- Conj(x)
复数
虚部<- Mod(x) 
虚部

矩阵<- matrix(c(1:9),3,3)
##形成上三角矩阵
矩阵[lower.tri(矩阵)] <- 0
上三角矩阵<- 矩阵
上三角矩阵

组合数<- choose(4,2) ##计算 Cnk
组合数

所有元素的组合<- combn(6,2)##得到所有元素的组合
所有元素的组合  

#使用 uniroot()函数,不过 uniroot 是基于二分法来计算方程根,当初始区间不能满足要求

uniroot()

##求根值 求极值
算法 <- function (x){
  sin(x) + 2*x - 1
}

uniroot(算法,c(0,5))   ##区间(a,b)上 求根值

optimize(算法,c(0,5))  ##区间(a,b)上 求极值

plot(算法)


