#include <Rcpp.h>
#include <iostream>


using namespace std;

// Below is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar)

// For more on using Rcpp click the Help button on the editor toolbar

// [[Rcpp::export]]
int timesTwo(int x) {
   return x * 2;
}

//
//  main.cpp
//  DynamicProgramming
//
//  Created by HarryZhu on 12/29/14.
//  Copyright (c) 2014 HarryZhu. All rights reserved.
//


interest <- function (a,p,r) {
  int main(int argc, const char * argv[]) {
  
  
      float a;
      float p = 1000;
      float r = 0.01;
      
      for (int day = 1;day<=20;day++){
          a = pow(1+r,p);
          cout << day<<"__________"<<a<<endl;
      }
      return 0;
  }
}
