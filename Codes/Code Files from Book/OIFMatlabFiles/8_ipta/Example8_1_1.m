% Matlab CVX code for capital budgeting model
n = 4 ;
invest_required = [7;10;6;3] ;
npv = [9;11;7;4] ;
cvx_begin
    cvx_solver gurobi
    variable x(n) binary ;
    maximize (npv'*x)
    invest_required'*x <= 19 ;
cvx_end