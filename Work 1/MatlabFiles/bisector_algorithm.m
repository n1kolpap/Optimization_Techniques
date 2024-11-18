function [a,b,k] = bisector_algorithm(f,a1,b1,epsilon,l)
a=a1;
b=b1;
k=1;

while (b-a>l)
        x1= ((a+b)/2) - epsilon;
        x2=((a+b)/2) + epsilon;

        if (f(x1) < f(x2))
            b=x2;
        else
            a=x1;

        end
        k=k+1;
end
disp([a b]);
disp(k);
return
end




       