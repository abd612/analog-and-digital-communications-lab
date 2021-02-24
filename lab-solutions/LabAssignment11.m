%% ADC Lab Assignment #11

%% Task 1

T0 = 0.1;
Fs = 10000;
Fc = 300;
Kf = 1000*pi;
Ts = 1/Fs;
t = -T0/2:Ts:T0/2;

m = 0.5*cos(20*pi*t);

mi = Kf*cumsum(m)/Fs;
s_fm = cos(2*pi*Fc*t + mi);

figure,
subplot(211), plot(t,m), title('Message Signal')
subplot(212), plot(t,s_fm), title('Frequency Modulated Signal')

%% Task 2

s_am = zeros(1,length(s_fm));

for n=2:length(s_fm)
    s_am(n) = abs((s_fm(n)-s_fm(n-1)));
end

figure, plot(t,s_am,'r',t,s_fm,'b');
legend('AM','FM');
title('FM Signal and AM Signal')

%% Task 3

N = 100;                      
Wn = 10/(Fs/2);                
a = fir1(N,Wn);                

rec = filter(a,1,s_am);

figure,
subplot(211), plot(t,m), title('Original Signal');
subplot(212),plot(t,rec), title('AM Recovered Signal');

%% Task 4

clc

Fs = 10000;
Fc = 500;
Kf = 50*pi;
t = -0.04:1/Fs:0.04;

m = 0.5*cos(20*pi*t);

s_fm = cos(2*pi*Fc*t+Kf*cumsum(m)/Fs);

lf_out = pll(s_fm,t,Fs,Fc);

%% Task 5

figure,
subplot(211), plot(t,m), title('Original Signal');
subplot(212), plot(t,lf_out), title('FM Recovered Signal')

%% Task 6

disp('The required scaling factor is 5')
figure,
subplot(211), plot(t,m), title('Original Signal');
subplot(212), plot(t,lf_out*5), title('Scaled FM Recovered Signal')

%% Credits
% 
%  Made by:
%  Muhammad Abdullah
%  (2015-EE-166)
%  