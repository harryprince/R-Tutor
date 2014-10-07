##本文介绍如何读取matlab的.mat文件的方法
##案例中的matlabtest.mat文件是事先从matlab中读取嫦娥3号月球表面100m处拍摄的数字高程图.tif文件得到的结果，保存后形成的

##读取matlab文件的数据
#install.packages('R.matlab')安装matlab包
library(R.matlab)
Image<-R.matlab::readMat('matlabtest.mat')##读取成功
str(Image)##查看B中的信息
ImageMatrix<-as.matrix(Image$B)

##得到数字高程图
contour(ImageMatrix)
