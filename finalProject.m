%{
   Part A
  Use Matlab to calculate the payoff of 100 dollar with annually discretely compounded interest and continuously compounded interest for different scalar inputs
  Part B 
  Not extend you program to take vector input in r, then in t, and then in both
  Part C
  Produce a plot of the payoff of one dollar at 8% interest per year, with continuous and discrete compounding, for maturities of one to 35 years, in steps of 6 months. 
%}

%% Part A

clear all
clc
%%clears the command window

p=100;
%%defining principle variable
t=5.5;
%%defining time variable
r=0.05;
%%defining rate variable
m=1; 
%compounding periods variable
if p>0
    if t>0
    fvdiscreteA=p*(1+r/m)^(m*t);
    fvcontinuousA=p*exp(r*t);
    else 
        disp ('Time can not be a negative number')
    end
    else
disp('Principal cannot be a negative number or zero')
end 


%% Part B

timedomain=(0:0.5:10);
ratedomain=(0:0.1:1);
[X,Y]=meshgrid(timedomain,ratedomain);
compoundingperiods=1;
Z=100*exp(X.*Y);
W=100*(1+Y/compoundingperiods).^(compoundingperiods*X);

figure(1)
surf(X, Y, Z)
xlabel('Time');
ylabel('Rate');
zlabel('Final Value');
title('Continuously Compounding $100 Investment');

figure(2)
surf(X, Y, W)
xlabel('Time');
ylabel('Rate');
zlabel('Final Value');
title('Semi-Annually Compounding $100 Investment');

%% Part C

p2=1;
t2=linspace(0,35,35);
r2=.08;
m2=2;
fvdiscrete=p2*(1+(r2/m2)).^(m2*t2);
fvcontinous=p2*exp(r2*t2);

figure(3)
stairs(t2,fvdiscrete, 'r')
hold on
plot(t2,fvcontinous, 'k')
title('Growth of a $100 Investment over Time');
xlabel('time');
ylabel('final value');
legend('discrete semi-annually','continuous');
