%% ADC Lab Evaluation (Mid)

%% Data

r = 2;      % Downsampling Ratio
s = 2;      % Upsampling Ratio

Fs = 16;    % Sampling Rate
T0 = 2;    % Time Interval
Ts = 1/Fs;  % Sampling Time
F0 = 1/T0;  % Frequency Interval

t = -T0/2:Ts:T0/2-Ts;   % Time Vector
f = -Fs/2:F0:Fs/2-F0;   % Frequency Vector

%% Signal

x = cos(2*pi*t);     % Siignal
X = fftshift(fft(x/Fs));    % Fourier Transform

figure     % Graphs
subplot(211), stem(t,real(x),'Linewidth',2), axis([-1 1 -1 1]), title('x(t) (Original)'), grid on
subplot(212), stem(f,abs(X),'Linewidth',2), axis([-8 8 0 1]), title('|X(f)| (Original)'), grid on

%% Downsampling (Decimation)

y = decimate(x,r);  % Decimated Signal
u = decimate(t,r);
g = decimate(f,r);
Y = fftshift(fft(y/Fs));    % Fourier Transform

figure     % Graphs
subplot(211), stem(u,real(y),'Linewidth',2), axis([-1 1 -1 1]), title('y(t) (Downsampled)'), grid on
subplot(212), stem(g,abs(Y),'Linewidth',2), axis([-8 8 0 1]), title('|Y(f)| (Downsampled)'), grid on

%% Upsampling (Interpolation)

z = interp(y,s);  % Interpolated Signal
v = interp(u,s);
h = interp(g,s);
Z = fftshift(fft(z/Fs));    % Fourier Transform

figure     % Graphs
subplot(211), stem(v,real(z),'Linewidth',2), axis([-1 1 -1 1]), title('z(t) (Upsampled)'), grid on
subplot(212), stem(h,abs(Z),'Linewidth',2), axis([-8 8 0 1]), title('|Z(f)| (Upsampled)'), grid on