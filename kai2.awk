#!/usr/bin/awk -f

function gamma(gammax,gammas){
    e = exp(1)
    return gammax^(gammas-1) * e^(-1*gammax)
}

function sgamma1(s1){
  #bとNはユーザ設定
  a1 = 0
  b1 = 10000
  N1 = 10000
  h1 = (b1-a1)/N1

  sum1 = 0

  for(k=1; k<N1; k++){
     sum+=gamma(a1+(k-1)*h1,s1) + gamma(a1+k*h1,s1)
  }

  return sum1 * h1 /2
}
function sgamma2(s2){
  #bとNはユーザ設定
  a2 = 0.000001
  b2 = 10
  N2 = 10000
  h2 = (b2-a2)/N2
  sum2 = 0
  
  for(l=1; l<N2; l++){
    sum2+=gamma(a2+(l-1)*h2,s2) + gamma(a2+l*h2,s2)
  }
  
  return sum2 * h2 /2
}

function kai2(x,v){
  if (v/2 > 1){
    return (x^(-1+v/2) * exp(-1*x/2)) / (2^(v/2) * sgamma1(v/2) + 0.001)
  }else{
    return (x^(-1+v/2) * exp(-1*x/2)) / (2^(v/2) * sgamma2(v/2) + 0.001) 
  }
}

function skai2(alpha,v){
  N = 10000
  a = alpha
  b = 1000
  h = (b-a) / N
  
  sum = 0
  for(k=1; k<N; k++){
    sum += kai2(a+(k-1)*h,v) + kai2(a+k*h) 
  }

  return sum * h / 2
}

BEGIN{
  print "χ二乗分布-χ(n,α)を計算するプログラム"
  printf "n:"
  getline n
  printf "α:"
  getline alpha
  print "自由度: " n
  print n "種類の確率分布が互いに独立で，" "標準正規分布N(0,1)に従うとします"
  

  print "χ^2" "[" n "] " "(" alpha "): " skai2(alpha,n)*100
}


