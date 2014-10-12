  #install.packages('R.matlab')  
  #install.packages("RColorBrewer", dependencies = TRUE)
  library(RColorBrewer)
  library(ggplot2)
  library(R.matlab)
  B<-R.matlab::readMat('matlabtest.mat')
  str(B)
  B1<-as.matrix(B$B)
  
  ##
 