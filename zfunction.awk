#!/usr/bin/awk -f

function zfunction(z,x,y){
  #x=μ
  #y=ρ2
  pi = atan2(0,-0)
  roa = sqrt(y)
  return 1 / (sqrt(2*pi)*roa) * exp(-1*(z-x)^2/(2*y))
}

function abs(x){
  if(x<0){
    return -1*x
  }
  return x
}

BEGIN{
  print "正規分布 N(μ,ρ2)に従ったときのz関数を計算するプログラム"
  print "\n==参考公式=="
  print "1. 標準正規分布(z分布)はN(0,1)です"
  print "2. B(n,p)に従い、nが十分に大きいとき、N(np,np(1-p))に近似できる\n"
  printf "μ:"
  getline x
  printf "ρ2:"
  getline y
  printf "z(上限):"
  getline z
  printf "下限(-z程度):"
  getline area
  printf "N(等分数):"
  getline N

  pi = atan2(0,-0)
  sum = 0
  #area = -1*z

  print "\n==Integral== " 
  print "from " area " to " z
  print N "等分で積分します"
  print "正規分布N(" x "," y ")に従います"

  h = (z - area) / N
  for(k=1; k<N+1; k++){
    sum += zfunction(area+(k-1)*h,x,y) + zfunction(area+k*h,x,y)
  }

  sum = h * sum / 2

  print "積分値:" abs(sum)
  print "パーセント形式:" 100*abs(sum) "%"
}


