#!/usr/bin/awk -f


function factorial(n){
  ans = 1
  if(n==1 || n <= 1){
    return 1
  }

  return n*factorial(n-1)
}

function combination(n,k){
  return factorial(n) / (factorial(k)* factorial(n-k))
}

BEGIN{
  print "二項分布-ベルヌーイ試行 B(n,p)"
  printf "n:"
  getline x
  printf "p:"
  getline y

  for(k=0; k<x+1; k++){
    sum = combination(x,k) * y^k * (1-y)^(x-k)
    print k ": " sum
  }

  print "\n平均: " x*y
  print "分散: " x*y*(1-y)
}


