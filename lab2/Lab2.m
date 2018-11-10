%Question #1
<<<<<<< HEAD

n = (1 : 10)
factorialN = sqrt(2*pi.*n).*(n/exp(1)).^n;
x = gamma(n + 1);

absError = abs(factorialN - x);
relError = absError ./ x;

%{
The absolute error increases 
and the relative error as n increases.
%}

%Question #2
A = [0 1 0 0 0 0; 
     1 0 1 0 0 1; 
     0 1 0 1 0 0; 
     0 0 1 0 1 1; 
     0 0 0 1 0 1; 
     0 1 0 1 1 0];
     
