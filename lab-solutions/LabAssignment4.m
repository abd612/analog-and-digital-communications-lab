%% ADC Lab Assignment #4

%% Problem #1

syms t w;
Fs = 20;
T0 = 15;
T = 0:1/Fs:T0;
W = T;

x1 = 2*exp(-t)*heaviside(t) + 5*exp(-(t-1)/2)*heaviside(t-1)
x2 = 1/(1+t^2)

X1 = subs(x1, t, T);
X2 = subs(x2, t, T);

y1 = fourier(x1)
y2 = fourier(x2)

Y1 = subs(y1, w, W);
Y2 = subs(y2, w, W);

figure
plot(W,abs(Y1), 'b')
title('Amplitude Spectrum of X1(w) with Fs and To')
figure
plot(W,angle(Y1), 'r')
title('Phase Spectrum of X1(w) with Fs and To')

figure
plot(W,abs(Y2), 'b')
title('Amplitude Spectrum of X2(w) with Fs and To')
figure
plot(W,angle(Y2), 'r')
title('Amplitude Spectrum of X2(w) with Fs and To')

%% Question #2

syms t w;
Fs = 40;
T0 = 30;
T = 0:1/Fs:T0;
W = T;

x1 = 2*exp(-t)*heaviside(t) + 5*exp(-(t-1)/2)*heaviside(t-1)
x2 = 1/(1+t^2)

X1 = subs(x1, t, T);
X2 = subs(x2, t, T);

y1 = fourier(x1)
y2 = fourier(x2)

Y1 = subs(y1, w, W);
Y2 = subs(y2, w, W);

figure
plot(W,abs(Y1), 'b')
title('Amplitude Spectrum of X1(w) with 2Fs and 2To')
figure
plot(W,angle(Y1), 'r')
title('Phase Spectrum of X1(w) with 2Fs and 2To')

figure
plot(W,abs(Y2), 'b')
title('Amplitude Spectrum of X2(w) with 2Fs and 2To')
figure
plot(W,angle(Y2), 'r')
title('Amplitude Spectrum of X2(w) with 2Fs and 2To')

%%
% Made by: Muhammad Abdullah (2015-EE-166)