###欢迎来信交流7harryprince@gmail.com ##欢迎直接复制代码
##背景知识：线性代数 EXCEL 
##知识结构：A.向量B.矩阵C.数据框D.各种操作
##1.从向量到矩阵和数据框
  c(1,2,3)##形如c(1,2,3) 可以创建一个行向量(1,2,3)；
  
  x1<- c(1,2,3)## x1<-  表示赋值##类似于其他语言中的  =  号
  x1          ##再次输入x1 可以查看生成的行向量
  x2<- c(1:3) ##生成从1到3,间隔(步长)默认为1 的行向量(1,2,3)
  
  as.matrix(x2)##as.xxx 表示强制类型转换；此处强制行向量转化为矩阵；默认矩阵先行后列摆放数字
  as.vector(x2)##将矩阵“拍扁”，回到向量的形式
  
  x<- data.frame(x1,x2)##将若干向量(等长)组合在一起，形成一个数据框，方便分析。
  
  rep("Harry",3)##重复函数，想重复一个句话或者几个数字的时候用；
  rownames(x)=c("row1","row2","row3")##给每一行起名字
  colnames(x)=rep("Harry",2)##给每一列起名字
  x            ##再次查看数据框，数据框有名字了~~
  ##练习：产生一个5*5的矩阵（任意）
  
##有了矩阵，一切都可以开始上路了######
  
##2.各种操作
##矩阵操作函数之父:apply()
##apply()函数是矩阵操作函数之父，apply()函数的作用就相当于Excel的公式刷子。
  rowsum<- apply(x,1,sum)##这里就是对矩阵x的每一行进行求和
  colsum<- apply(x,2,sum)## 2表示对每列操作，这里就是列求和
  
##我们是不是有在Excel中学过对行列求和的=sum()函数，如何将sum的结果添加到矩阵后面再显示呢？
  cbind(x,rowsum)##cbind即colcombind；利用cbind(狗1，狗2，狗3...)函数将想要的矩阵按列组合
  rbind(x,colsum)##rbind即rowbind；同理
  
##想要同时对行列求和，并且同时显示怎么办了？
  xSum<- rbind(cbind(x,rowsum),colsum=apply(cbind(x,rowsum),1,sum))##利用嵌套函数同时显示；

##同理这里的sum()函数可以换成min(),max(),mean(),sd()等,甚至自定义的函数。
##联系求出自己写的5*5矩阵的方差，并同时显示出来；
  
##矩阵操作函数之母which()
##which()函数是矩阵操作之母，which()函数的作用就相当于Excel的定位函数：index(),vlookup(),hlookup(),offset(),match()等
  ij<-which(x==3,arr.ind=TRUE)##利用ij来标记所查找的数值在矩阵x中的位置
  x[ij]##轻松返回出刚才查找的数值
##当然which()的强大之处在于，索引条件约束较少；
##
 ij<- which((x[,2])==max(x),arr.ind=TRUE) ##
 x[ij]
