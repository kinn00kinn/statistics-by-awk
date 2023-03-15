#!/usr/bin/awk -f

NR == 1{
 xmax = $1
 xmin = $1
 ymax = $2
 ymin = $2
}

{
  sum_x += $1
  sum_y += $2
  sum_x2 += $1 ^ 2
  sum_y2  += $2 ^ 2
  sum_xy += $1 * $2
  if($1 > xmax) xmax = $1
  if($1 < xmin) xmin = $1
  if($2 > ymax) ymax = $2
  if($2 < ymin) ymin = $2
}
END{
  if(NR == 0) exit
  print  "========== "FILENAME " =========="
  print "要素数  : " NR "\n"

  print "x 合計値  : " sum_x
  print "x 最大最小: " xmax, xmin
  print "x 平均値  : " sum_x / NR
  print "x 分散    : " sum_x2 / NR - (sum_x / NR) ^ 2
  print "x 標準偏差: " sqrt(sum_x2 / NR - (sum_x / NR) ^ 2)

  print "\n"

  print "y 合計値  : " sum_y
  print "y 最大最小: " ymax, ymin
  print "y 平均値  : " sum_y / NR
  print "y 分散    : " sum_y2 / NR - (sum_y / NR) ^ 2
  print "y 標準偏差: " sqrt(sum_y2 / NR - (sum_y / NR) ^ 2)

print "\n"



print "共分散  : " ((sum_xy) / NR - sum_x/NR * sum_y/NR)

print "相関係数: " ((sum_xy) / NR - sum_x/NR * sum_y/NR) / ( sqrt(sum_x2 / NR - (sum_x / NR) ^ 2) * sqrt(sum_y2 / NR - (sum_y / NR) ^ 2))

print "\n"

print "回帰直線 a: "  ((sum_xy) / NR - sum_x/NR * sum_y/NR) / (sum_x2 / NR - (sum_x / NR) ^ 2)

print "回帰直線 b: " sum_y / NR - (((sum_xy) / NR - sum_x/NR * sum_y/NR) / (sum_x2 / NR - (sum_x / NR) ^ 2)) * (sum_x/NR)

print "回帰直線  : " "y = " ((sum_xy) / NR - sum_x/NR * sum_y    /NR) / (sum_x2 / NR - (sum_x / NR) ^ 2) "x + " sum_y / NR - (((sum_xy) / NR - sum_x/NR * sum_y/NR) / (sum_x2 / NR - (sum_x / NR) ^ 2)) * (sum_x/NR)
print "\n"
}
