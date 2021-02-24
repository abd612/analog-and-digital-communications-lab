%% ADC Lab Task #6

%%

Fs = 10;
Ts = 1/Fs;
T0 = 5;
t = -T0:Ts:T0;

u0 = t>=1;
u1 = t>=-1;

x = (1 - abs(t)).*(u1-u0);

X = fftshift(fft(x,(length(t))));
f = (-(length(t))/2:(length(t))/2-1);

subplot(311),plot(t,x,'Linewidth',2),title('Signal'),grid on
subplot(312),plot(f,abs(X),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(X),'Linewidth',2),title('Phase Spectrum'),grid on