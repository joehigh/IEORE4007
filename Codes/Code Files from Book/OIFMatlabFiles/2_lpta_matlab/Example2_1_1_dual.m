% Matlab CVX code for the fund allocation problem
% Request dual variables
n = 4 ;
r = [0.10;0.15;0.16;0.08] ;
A = [1 1 1 1] ;
b = 80 ;
D = [0.5 0.3 0.25 0.6;
     0.3 0.1 0.4  0.2;
     0.2 0.6 0.35 0.2] ;
d = [28;24;12] ;

cvx_begin
    variables x(n) ;
    dual variable y ;
    dual variable z ;
    maximize (r'*x) 
    y: A*x == b ;
    z: D*x >= d ;
    x >= zeros(n,1) ;
cvx_end
