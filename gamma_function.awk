#!/usr/bin/awk -f
function gamma(x,s){
  e = exp(1)
  return x^(s-1) * e^(-1*x)
}

BEGIN{
  print "ガンマ関数-Γ(s)を計算するプログラム"
  print "\n==参考公式=="
  print "1. Γ(s+1) = s*Γ(s) (0 < s)"
  print "2. Γ(1/2) = sqrt(pi)"
  print "3. Γ(n+1) = n! (n=自然数)"
  print "このプログラムは 1<s<78.063 で安定して動作します"

  printf "s:"
  getline s
  #printf "N(等分数):"
  #getline N

  pi = atan2(0,-0)
  sum = 0
  N = 100000

  print "\n==Integral== " 
  print N " 等分で積分します"
  #[a,b]
  a = 0
  b = 10000
  h = (b-a)/N

  for(k=1; k<N+1; k++){
    sum+=gamma(a+(k-1)*h,s) + gamma(a+k*h,s)
  }

  sum = h * sum / 2
  print "積分値: " sum
}


