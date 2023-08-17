# README.md
このレポジトリは統計で使用する数値計算用プログラムです．

# [binomial](//binomial.awk)
二項対立（ベルヌーイ試行）の計算
引数はB(n,p)
n = 試行回数
p = 期待する確率

# [gamma_function.awk](//gamma_function.awk)
ガンマ関数-Γ(s)を計算するプログラム

==参考公式==
1. Γ(s+1) = s*Γ(s) (0 < s)
2. Γ(1/2) = sqrt(pi)
3. Γ(n+1) = n! (n=自然数)

このプログラムは **1<s<78** で安定して動作します．

引数はΓ(s)
s = 実数

# [hensa.awk](//hensa.awk)
1次元のデータ整理を行うプログラム
```bash
Usage: ./hensa.awk [datafile]
```

# [hensa2.awk](//hensa2.awk)
2次元のデータ整理を行うプログラム
```bash
Usage: ./hensa2.awk [datafile]
``` 

# [poisson.awk](//poisson.awk) 
ポアソン分布 P(λ)の計算を行う
この確率分布は離散です．

# [normal.awk](//normal.awk)
正規分布 N(μ,ρ2)の計算を行う
この確率分布は定義上では連続，しかしこのプログラムは離散で定義している

# [zfunction.awk](//zfunction.awk)
zfunctionとは正規分布 N(μ,ρ2)に従ったときの，区間の積分値を計算する関数です．

==参考公式==
1. 標準正規分布(z分布)はN(0,1)です
2. B(n,p)に従い、nが十分に大きいとき、N(np,np(1-p))に近似できる

# [kai2.awk](//kai2.awk)
χ二乗分布-χ(n,α)を計算するプログラムです．



