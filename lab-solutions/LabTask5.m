%% ADC Lab Task #5

%% Fs < 2F

Fs = 1.5*f; % Sampling rate less than Nyquist rate
f = 10e3;   % Frequency of sine wave
T0 = 0.01;  % Time period

t = 0:1/Fs:T0;  % Time interval
x = sin(f*t);   % Sine wave
X = fft(x);     % Fourier transform

figure
subplot(311),stem(t,x)  % Plot of wave
title('x(t) with Fs<2F')
subplot(312),stem(t,abs(X));    % Magnitude plot of transform
title('|X(w)| with Fs<2F')
subplot(313),stem(t,angle(X));  % Phase plot of transform
title('<X(w) with Fs<2F')

%% Fs = 2F

Fs = 2*f; % Sampling rate less than Nyquist rate
f = 10e3;   % Frequency of sine wave
T0 = 0.01;  % Time period

t = 0:1/Fs:T0;  % Time interval
x = sin(f*t);   % Sine wave
X = fft(x);     % Fourier transform

figure
subplot(311),stem(t,x)  % Plot of wave
title('x(t) with Fs=2F')
subplot(312),stem(t,abs(X));    % Magnitude plot of transform
title('|X(w)| with Fs=2F')
subplot(313),stem(t,angle(X));  % Phase plot of transform
title('<X(w) with Fs=2F')

%% Fs > 2F

Fs = 2.5*f; % Sampling rate less than Nyquist rate
f = 10e3;   % Frequency of sine wave
T0 = 0.01;  % Time period

t = 0:1/Fs:T0;  % Time interval
x = sin(f*t);   % Sine wave
X = fft(x);     % Fourier transform

figure
subplot(311),stem(t,x)  % Plot of wave
title('x(t) with Fs>2F')
subplot(312),stem(t,abs(X));    % Magnitude plot of transform
title('|X(w)| with Fs>2F')
subplot(313),stem(t,angle(X));  % Phase plot of transform
title('<X(w) with Fs>2F')