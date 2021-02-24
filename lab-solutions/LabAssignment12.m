%% ADC Lab Assignment #12

%% Data

Fc = 100;
T0 = 1;
N = 5000;

%% Task 1

t_row = linspace(0,1,N);
t = repmat(t_row,N,1);

%% Task 2

O_col = 2*pi*rand(N,1);
O = repmat(O_col,1,N);

%% Task 3

x = cos(2*pi*Fc*t + O);

%% Task 4

x1 = x(:,1000);
x2 = x(:,2000);
x3 = x(:,3000);
x4 = x(:,4000);
x5 = x(:,5000);

m1 = mean(x1)
m2 = mean(x2)
m3 = mean(x3)
m4 = mean(x4)
m5 = mean(x5)

%% Task 5

t1 = 100;
t2 = 200;
t3 = 300;

x1 = x(:,t1);
x2 = x(:,t2);
x3 = x(:,t3);

xa = x1.*x2;
xb = x2.*x3;

ma = mean(xa)
mb = mean(xb)

%% Task 6

t4 = 400;
t5 = 500;
t6 = 600;

x4 = x(:,t4);
x5 = x(:,t5);
x6 = x(:,t6);

xc = x4.*x5;
xd = x5.*x6;

mc = mean(xc)
md = mean(xd)

%% Task 7

disp('The process is Wide Sense Stationary (WSS) because:');
disp(' - WSS processes have a constant ensemble mean.');
disp(' - The ensemble autocorrelation function of a WSS process is a function of the time difference.');

%% Task 8

xo = x(:,1);
xr = repmat(xo,1,N);

y = zeros(1,N-1);

for n = 1:N-1
    y(n) = mean(xr(:,n).*x(:,n+1));
end

figure, plot(y), title('Ensemble Autocorrelation Function');
figure, plot(y), xlim([1 1000]), ylim([-1 1]), title('Ensemble Autocorrelation Function (Expanded View)');

%% Credits
% 
%  Made by:
%  Muhammad Abdullah
%  (2015-EE-166)
%  