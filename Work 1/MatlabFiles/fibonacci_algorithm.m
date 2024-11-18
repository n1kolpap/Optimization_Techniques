function [a,b,k] = fibonacci_algorithm(a1,b1,epsilon,l,f)
a=a1;
b=b1;
n=0;
while fibonacci(n)<=((b-a)/l) 
    n = n+1;
end
disp(n-1);
fib=zeros(1,n+1); %αποθήκευση αριθμών fibonacci για να μην καλούμε τον αλγόριθμο για την ίδια τιμη
for i= 1 : n+1
    fib(i) = fib(i) + fibonacci(i-1);
end
    x1 = a + (fib(n-1)/fib(n+1))*(b-a);
    x2 = a + (fib(n)/fib(n+1))*(b-a);
    f1 = f(x1);
    f2 = f(x2);
    k=1;
for j= 1 : (n-2)
    if (f(x1)>f(x2))
        a=x1;
        x1=x2;
        x2= a + (fib(n-k)/fib(n-k+1))*(b-a);
        if (k == (n-2))
            x1n = x1;
            x2n = x1 + epsilon;
            if (f(x1n) > f(x2n))
                a=x1n;
            else
                b=x2n;
            end
            return
        else
            f1 = f2;
            f2 = f(x2);
            k = k+1;
        end
    elseif (f(x1)<f(x2))
        b = x2;
        x2 = x1;
        x1= a + ((fib(n-k-1)/fib(n-k+1))*(b-a));
        if k == (n-2)
            x1n = x1;
            x2n = x1 + epsilon;
            if (fx1n) > f(x2n)
                a=x1n;
            else
                b=x2n;
            end
            return
        else
            f2 = f1;
            f1 = f(x1);
            k = k+1;
        end
    end
end
disp([a b]);
end