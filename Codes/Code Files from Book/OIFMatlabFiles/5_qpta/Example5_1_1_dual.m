% Matlab CVX code for asset allocation model
% Request dual variables
n = 3 ;
sigma = [0.12;0.2;0.05] ;
correl = [1 0.6 0.2; 0.6 1 0.5; 0.2 0.5 1] ;
V = correl.*(sigma*sigma') ;

cvx_begin
    variables x(n) ;
    dual variable y ;
    minimize (x'*V*x)
    y: ones(1,3)*x == 1 ;
    x >= zeros(n,1) ;
cvx_end