function [a,b,k] = golden_algorithm(a1,b1,l,f)
gamma=0.618;
k=1;
a=a1;
b=b1;
x1 = a1+(1-gamma)*(b1-a1);
x2= a1+gamma*(b1-a1);
f1=f(x1);
f2=f(x2);

while (b-a>=l)
    if f1>f2
        a=x1;
        x1=x2;
        x2=a +gamma*(b-a);
        f1=f2;
        f2=f(x2);
    elseif (f1<f2)
        b=x2;
        x2=x1;
        x1=a +(1-gamma)*(b-a);
        f2=f1;
        f1=f(x1);
    end
    k=k+1;
end
disp(k);
disp([a,b]);
return
end
