% cvx for bond dedication
% find min-cost long-only portfolio of bonds to match a stream of liabilities
clear all
n = 10 ;
m = 6 ;

F = [10	10	10	10	10	110;
7	7	7	7	7	107 ;   
8	8	8	8	8	108 ;
6	6	6	6	106	0   ;
7	7	7	7	107	0   ;
5	5	5	105	0	0   ;
10	10	110	0   0   0   ;		
8	8	108	0   0   0   ;   		
7	107	0   0   0   0   ;
100	0   0   0   0   0]' ;	

L = [100	200 800	100	800	1200]' ;

R = -eye(m) + diag(ones(m-1,1),-1);

p = [109 94.8 99.5 93.1 97.2 92.9 110 104 102 95.2]';

cvx_begin
    variables x(n) ;
    variables s(m) ;
    minimize (p'*x)
    F*x + R*s == L ;
    x >= zeros(n,1) ;
    s >= zeros(m,1) ;
cvx_end
