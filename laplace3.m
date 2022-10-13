function y = laplace3(A,conds,g)
   
    syms s;
    n = length(conds)
    G = sym(zeros(n,1))
    if g==0
        G(n) = 0;
    else 
        G(n) = simplify(laplace(g)/A(1));   %a(k)=A(n+1-k)
    end
    
    %G(n) = laplace(g)
    M = sym(zeros(n));
    M(n,1) = -A(n+1)/A(1);
    for i=1:n-1
        M(i,i+1) = 1;
        M(n,i+1) = -A(n+1-i)/A(1);
    end

    P_expr = simplify(G+conds(n));
    P = @(s) (P_expr);
    Q = eval(['@(s)' char(inv(s*eye(n)-M))]);
    Y = eval(['@(s)' char(Q(s)*P(s))]);
    y = ilaplace(Y(s));

end

