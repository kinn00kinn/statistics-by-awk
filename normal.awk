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
  print "正規分布 N(μ,ρ2)"
  printf "μ:"
  getline x
  printf "ρ2:"
  getline y
  printf "描画距離(オススメは10):"
  getline area

  pi = atan2(0,-0)

  for(k=area*-1; k<area+1; k++){
    print k ": " 1/(sqrt(y) * sqrt(2*pi)) * exp(-0.5*((k-x)/sqrt(y))^2 )
  }

  print "\n平均: " x
  print "分散: " y
}


