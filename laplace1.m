function y = laplace1(A,conds,g)

    syms s;

    n = length(conds);
    if g==0
        P_expr = 0;
    else 
        P_expr = simplify(laplace(g));
    end

    n = length(conds);
    P = @(s) (P_expr);

    for k=0:n-1
        T = @(s) (0);
        for i=0:n-(k+1)
            T = eval(['@(s)' char(T(s) + (A(n-(i+k)) * power(s,i)))]);
        end 
        P = eval(['@(s)' char(P(s) + T(s) * conds(k+1))]);
        if k==0
            Q = eval(['@(s)' char(s*T(s) + A(n+1))]);
        end

    end
    
    Y = eval(['@(s)' char(P(s)/Q(s))]);
    y = ilaplace(Y(s));

end
