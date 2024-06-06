import math
import constraint

problem = constraint.Problem()
problem.addVariables("XY", range(0, 11))

problem.addConstraint(lambda x, y: 2 * x + 3 * y < 23 and 45 * x - 34 * y < 12, "XY")

resenja = problem.getSolutions()
resenja = sorted(resenja, key=lambda x: math.sqrt(x["X"] ** 2 + x["Y"] ** 2))
print(resenja[-1])
