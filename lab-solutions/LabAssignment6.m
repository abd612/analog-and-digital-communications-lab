%% ADC Lab Assignment #6

%% Part (a)

Fc = 300;
B = 64;
T0 = 5;
Fs = 2*B + 10;
Ts = 1/Fs;
t = 0:Ts:T0';

x = 5*[exp(-10*t) + exp(-t) + exp(-t/2)].*sin(4*pi*t).*[heaviside(t) - heaviside(t-5)];
X = fftshift(fft(x,(length(t))));
f = (-(length(t))/2:(length(t))/2-1);

figure
subplot(311),plot(t,x,'Linewidth',2),title('Signal'),grid on
subplot(312),plot(f,abs(X),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(X),'Linewidth',2),title('Phase Spectrum'),grid on

%% Part (b)

xmod = x.*cos(2*pi*Fc*t);
Xmod = fftshift(fft(xmod,length(t)));

figure
subplot(311),plot(t,xmod,'Linewidth',2),title('Modulated Signal (DSB-SC)'),grid on
subplot(312),plot(f,abs(Xmod),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(Xmod),'Linewidth',2),title('Phase Spectrum'),grid on

%% Part (c)

xdem = xmod.*cos(2*pi*Fc*t)*2;
Xdem = fftshift(fft(xdem,length(t)));

figure
subplot(311),plot(t,xdem,'Linewidth',2),title('Demodulated Signal (DSB-SC)'),grid on
subplot(312),plot(f,abs(Xdem),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(Xdem),'Linewidth',2),title('Phase Spectrum'),grid on

%%

h = fir1(12,[B/Fs]);
xrec = filter(h,1,xdem);
Xrec = fftshift(fft(xrec,length(t)));

figure
subplot(311),plot(t,xrec,'Linewidth',2),title('Recovered Signal (DSB-SC)'),grid on
subplot(312),plot(f,abs(Xrec),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(Xrec),'Linewidth',2),title('Phase Spectrum'),grid on

%%

figure
plot(t,x,t,xrec,'Linewidth',2);
title('Original and Recovered Signal (DSB-SC)'); legend('Original Signal', 'Recovered Signal'); grid on

%% Part (d)

A = 10;
xmod = (A+x).*cos(2*pi*Fc*t);
Xmod = fftshift(fft(xmod,length(t)));

figure
subplot(311),plot(t,xmod,'Linewidth',2),title('Modulated Signal (AM)'),grid on
subplot(312),plot(f,abs(Xmod),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(Xmod),'Linewidth',2),title('Phase Spectrum'),grid on

%% Part (e)

%%

xdem = xmod.*cos(2*pi*Fc*t)*2;
Xdem = fftshift(fft(xdem,length(t)));

figure
subplot(311),plot(t,xdem,'Linewidth',2),title('Demodulated Signal (AM)'),grid on
subplot(312),plot(f,abs(Xdem),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(Xdem),'Linewidth',2),title('Phase Spectrum'),grid on

%%

h = fir1(12,[B/Fs]);
xrec = filter(h,1,xdem);
Xrec = fftshift(fft(xrec,length(t)));

figure
subplot(311),plot(t,xrec,'Linewidth',2),title('Recovered Signal (AM)'),grid on
subplot(312),plot(f,abs(Xrec),'Linewidth',2),title('Magnitude Spectrum'),grid on
subplot(313),plot(f,angle(Xrec),'Linewidth',2),title('Phase Spectrum'),grid on

%%

figure
plot(t,x,t,xrec,'Linewidth',2);
title('Original and Recovered Signal (AM)'); legend('Original Signal', 'Recovered Signal'); grid on

%% Credits
% 
%  Made by:
%  Muhammad Abdullah
%  (2015-EE-166)
%  