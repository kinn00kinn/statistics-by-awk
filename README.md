# README.md
このレポジトリは統計で使用する数値計算用プログラムが入っています

## PROGRAM
### biomial.awk
二項対立（ベルヌーイ試行）の計算が出来ます
引数はB(n,p)
n = 試行回数
p = 期待する確率

### gamma_function.awk
ガンマ関数-Γ(s)を計算するプログラム

==参考公式==
1. Γ(s+1) = s*Γ(s) (0 < s)
2. Γ(1/2) = sqrt(pi)
3. Γ(n+1) = n! (n=自然数)

このプログラムは **1<s<78** で安定して動作します

引数はΓ(s)
s = 実数

### hensa.awk
1次元のデータ整理を行うプログラム
```bash
Usage: ./hensa.awk [datafile]
```

### hensa2.awk
2次元のデータ整理を行うプログラム
```bash
Usage: ./hensa2.awk [datafile]
``` 

### poisson.awk 
ポアソン分布 P(λ)の計算を行います
この確率分布は離散です

### normal.awk
正規分布 N(μ,ρ2)の計算を行います
この確率分布は定義上では連続ですが，このプログラムは離散です

### zfunction.awk
正規分布 N(μ,ρ2)に従ったときのz関数を計算するプログラム

$$\phi(z)=\int_{-\infty}^{z} \frac{1}{\sqrt {2\pi}\sigma}\exp(-\frac{(z-\mu)^2}{2\sigma^2})$$

==参考公式==
1. 標準正規分布(z分布)はN(0,1)です
2. B(n,p)に従い、nが十分に大きいとき、N(np,np(1-p))に近似できる
