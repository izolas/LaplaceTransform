function y = laplace2(A,conds,g)
   
    syms s;
    n = length(conds);

    G = sym(zeros(n,1))
    for i=1:2
       if g(i)==0
           G(i) = 0;
       else 
            G(i) = G(i) + laplace(g(i));
       end
    end
    
    P_expr = simplify(G+conds(n));
    P = @(s) (P_expr);
    Q = eval(['@(s)' char(inv(s*eye(n)-A))]);
    Y = eval(['@(s)' char(Q(s)*P(s))]);
    y = ilaplace(Y(s));

end

