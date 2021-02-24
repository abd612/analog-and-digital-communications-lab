%% ADC Lab Task #4

%%
Fs = 100;       % Sampling Frequency
Ts = 1/Fs;      % Sampling Time
t = 1:Ts:10;    % Time Interval
To = 9;         % Period
No = To*Fs;
k = 0:No;
w = 2*pi*k/To;

x = cos(t) + j*sin(t);      % Function
X = fft(x);                 % Fourier Transform of Function
[Xp Xm] = cart2pol(real(X), imag(X));
figure
plot(w,Xm)      % Plot of Function Transform
title('Function')

sigma = 1;
y1 = sigma*randn(901,1);
y2 = sigma*randn(901,1);
y = sqrt(y1.^2 + y2.^2);
y = y';     % Noise

Y = fft(y);     % Fourier Transform of Noise
[Yp Ym] = cart2pol(real(Y), imag(Y));
figure
plot(w,Ym)      % Plot of Noise Transform
title('Noise')

z = x + y;      % Sum
Z = fft(z);     % Fourier Transform of Sum
[Zp Zm] = cart2pol(real(Z), imag(Z));
figure
plot(w,Zm)      % Plot of Sum
title('Function + Noise')