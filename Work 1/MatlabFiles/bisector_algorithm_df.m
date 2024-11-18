function [a,b,k]= bisector_algorithm_df(a1,b1,l,f)
syms x;
a=a1; b=b1;
lamda=l/(b1-a1);
ni=log(lamda)/log(1/2);
n=ceil(ni);
k=1;
disp(n);
df=diff(f,x);
Df=matlabFunction(df);
while k<=n
    xk=(a+b)/2;
    Dfk=Df(xk);
    if (Dfk == 0)
        disp(xk);
        disp([-1,-1]);
        return
    elseif (Dfk>0)
        b=xk;
    else 
        a=xk;
    end
    if k==n
        disp([a b]);
        return
    else
        k=k+1;
    end
end
disp(k);
end