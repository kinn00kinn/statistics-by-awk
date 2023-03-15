#!/usr/bin/awk -f


function factorial(n){
  ans = 1
  if(n==1 || n <= 1){
    return 1
  }
  ans=n*factorial(n-1)
  return ans
}

BEGIN{
  print "ポアソン分布 P(λ)"
  printf "λ: "
  getline x
  x = int(x)
  e = exp(-x)

  for(k=0; k<x+1; k++){
    sum = (e) * (x^k) / (factorial(k))
    print k ": " sum
  }

  print "\n平均: " x
  print "分散: " x
}


