tex.print("\\begin{tabular}{|r|r|}\\hline")
tex.print("$n$&$2^n$\\\\")
tex.print("\\hline")
for n = 1,16 do
    tex.print(n .. "&" .. math.pow(2, n))
    tex.print("\\\\")
end
tex.print("\\hline")
tex.print("\\end{tabular}")
