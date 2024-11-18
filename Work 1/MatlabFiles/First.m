clc
clear 
close all 

 
colors = {'r','b','g','black'};

syms x;
f(x)= (x-2)^2 + x*log(x+3); %κάθε φορα καλώ την κάθε συνάρτηση για κάθε plot
%f(x)= exp((-2*x)) + (x-2)^2;
%f(x)= exp(x)*(x^3 - 1)+(x-1)*sin(x);


l_values = [0.005, 0.01, 0.05, 0.1];

figure;
for i=1:length(l_values)
    l=l_values(i);
    [ak,bk,k_values]=bisector_algorithm(f,-1,3,0.001,l,colors{i});
    hold on
    grid on
    plot(k_values,ak,'Color',colors{i},'LineWidth', 1.8,'DisplayName', ['a_k for l = ' num2str(l)]);
    plot(k_values,bk,'Color',colors{i},'LineWidth', 1.8,'LineStyle', '--','DisplayName', ['b_k for l = ' num2str(l)]);
    xlabel('k'); 
    ylabel('[ak bk]');
    legend;
    title('f1(x) για διάφορες τιμές του τελικού εύρους αναζήτησης l');

end
function [ak,bk,k_values] = bisector_algorithm(f,a1,b1,epsilon,l,colors)
a=a1; b=b1;
    k=1;
    ak=[];
    bk=[];
    k_values=[];
    while (b-a)>l
        ak=[ak,a];
        bk=[bk,b];
        k_values=[k_values,k];
        x1 = (a+b)/2-epsilon;
        x2 = (a+b)/2+epsilon;
        if f(x1)<f(x2)
            b = x2;
        else
            a = x1;
        end
        k = k+1;
    end
    ak=[ak,a];
    bk=[bk,b];
    k_values=[k_values,k];
    %disp(k);
    %return
end
