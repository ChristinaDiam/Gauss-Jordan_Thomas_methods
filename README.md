## Gauss-Jordan and Thomas methods

### File ask1.m:

This MATLAB code performs numerical computations related to solving linear systems of equations using the Gauss-Jordan elimination method. It starts by defining a matrix A and a solution vector x. Then, it calculates the right-hand side vector b by taking the matrix-vector product Ax. Next, it applies the Gauss-Jordan elimination method to solve the system Ax=b and calculates the solution vector xn​ along with some error metrics. Additionally, it generates another matrix A2 based on a specific formula and repeats the process to solve the system A2x=b2. Finally, it computes error metrics to analyze the accuracy of the solutions and calculates the condition numbers K(A) for both matrices A and A2.

### File ask2.m:

This MATLAB code implements two numerical methods, Thomas algorithm and Gauss elimination without pivoting, for solving tridiagonal linear systems Ax=b, where A is a tridiagonal matrix. It first generates tridiagonal matrices A of different sizes and creates a solution vector x. Then, it calculates the right-hand side vector b using the matrix-vector product Ax. Subsequently, it measures the execution time for solving the system using each method for two different sizes of matrices. The Thomas algorithm is employed for solving tridiagonal systems efficiently, while Gauss elimination without pivoting is used as a benchmark for comparison.

#### There is also a PDF file with the observations and results of both methods.