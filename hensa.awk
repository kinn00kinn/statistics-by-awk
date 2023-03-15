#!/usr/bin/awk -f

NR == 1{
 max = $1
 min = $1
}

{
  sum_x += $1
  sum_x2 += $1 ^ 2
  if($1 > max) max = $1
  if($1 < min) min = $1
}
END{
  if(NR == 0) exit
  print "要素数  : " NR
  print "合計値  : " sum_x
  print "最大最小: " max,min
  print "平均値  : " sum_x / NR
  print "分散    : " sum_x2 / NR - (sum_x / NR) ^ 2
  print "標準偏差: " sqrt(sum_x2 / NR - (sum_x / NR) ^ 2)
}
