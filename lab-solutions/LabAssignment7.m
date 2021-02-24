%% ADC Lab Assignment #7

%% Problem 1

%% Data

Fs = 16;
T0 = 10;
Ts = 1/Fs;
F0 = 1/T0;

t = [-T0/2:Ts:T0/2-Ts]';
f = [-Fs/2:F0:Fs/2-F0]';

%% X(f)

x = sinc(t).^2;
X = fftshift(fft(x/Fs));

figure
subplot(211), plot(t,real(x),'Linewidth',2), title('x(t)'), grid on
subplot(212), plot(f,abs(X),'Linewidth',2), title('|X(f)|'), grid on

%% M(f)

H = -j*sign(f);
M = H.*X;
m = ifft(ifftshift(M))*Fs;

figure
subplot(211), plot(t,real(m),'Linewidth',2), title('m(t)'), grid on
subplot(212), plot(f,abs(M),'Linewidth',2), title('|M(f)|'), grid on

%% Z(f)

z = x + j*m;
Z = fftshift(fft(z/Fs));

figure
subplot(211), plot(t,real(z),'Linewidth',2), title('z(t)'), grid on
subplot(212), plot(f,abs(Z),'Linewidth',2), title('|Z(f)|'), grid on

%% Y(f)

y = (z + conj(z).*exp(j*2*pi*2*t))/2;
Y = fftshift(fft(y/Fs));

figure
subplot(211), plot(t,real(y),'Linewidth',2), title('y(t)'), grid on
subplot(212), plot(f,abs(Y),'Linewidth',2), title('|Y(f)|'), grid on

%% Credits
% 
%  Made by:
%  Muhammad Abdullah
%  (2015-EE-166)
%  