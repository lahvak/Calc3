import sympy

x = sympy.Symbol('x')

tmplt = "#declare {} = function(x) {{{}}};\n"

fname = "curve.inc"

fx = (2+sympy.cos(1.5*x))*sympy.cos(x)
fy = sympy.sin(1.5*x)
fz = (2+sympy.cos(1.5*x))*sympy.sin(x)

dfx = sympy.diff(fx, x)
dfy = sympy.diff(fy, x)
dfz = sympy.diff(fz, x)

ddfx = sympy.diff(dfx, x)
ddfy = sympy.diff(dfy, x)
ddfz = sympy.diff(dfz, x)

with open(fname, 'w') as incfile:
    incfile.write(tmplt.format("XFun", fx))
    incfile.write(tmplt.format("YFun", fy))
    incfile.write(tmplt.format("ZFun", fz))
    incfile.write(tmplt.format("XFunp", dfx))
    incfile.write(tmplt.format("YFunp", dfy))
    incfile.write(tmplt.format("ZFunp", dfz))
    incfile.write(tmplt.format("XFunpp", ddfx))
    incfile.write(tmplt.format("YFunpp", ddfy))
    incfile.write(tmplt.format("ZFunpp", ddfz))
