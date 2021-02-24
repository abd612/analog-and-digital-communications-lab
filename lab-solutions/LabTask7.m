%% ADC Lab Task #6

%% Data

Fs = 16;
T0 = 10;
Ts = 1/Fs;
F0 = 1/T0;

t = [-T0/2:Ts:T0/2-Ts]';
f = [-Fs/2:F0:Fs/2-F0]';

%% x(t)

u2 = t>=2;
u0 = t>0;

x = (abs(t-1)).*(u0-u2);

%% X(f)

X = fftshift(fft(x/Fs));

%% M(f)

M = -j*sign(f).*X;

%% m(t)

m = ifft(ifftshift(M))*Fs;

%% Graphs

figure
subplot(411), plot(t,x,'Linewidth',2), title('x(t)'), grid on
subplot(412), plot(f,abs(X),'Linewidth',2), title('|X(f)|'), grid on
subplot(413), plot(f,abs(M),'Linewidth',2), title('|M(f)|'), grid on
subplot(414), plot(t,real(m),'Linewidth',2), title('m(t)'), grid on