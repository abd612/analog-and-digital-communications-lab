%% ADC Lab Evaluation (Mid)

%%

Fs = 16;    % Sampling Rate
T0 = 6;    % Time Interval
Ts = 1/Fs;  % Sampling Time
F0 = 1/T0;  % Frequency Interval

t = -T0/2:Ts:T0/2-Ts;   % Time Vector
f = -Fs/2:F0:Fs/2-F0;   % Frequency Vector

u0 = t>=1;
u1 = t>-1;

a = (u1-u0);    % Signal a
b = (1 - abs(t)).*(u1-u0);  % Signal b

figure  % Graphs
subplot(211), plot(t,a,'Linewidth',2), title('a(t)'), grid on
subplot(212), plot(t,b,'Linewidth',2), title('b(t)'), grid on

%%
c = conv(a,b,'same');   % Convolution in Time Domain
C = fftshift(fft(c));

A = fftshift(fft(a));
B = fftshift(fft(b));

M = A.*B;   % Multiplication in Frequency Domain
m = ifftshift(ifft(M));

figure  % Graphs
subplot(211), plot(t,c,'Linewidth',2), title('Convolution in Time Domain'), grid on
subplot(212), plot(t,abs(m),'Linewidth',2), title('Multiplication in Frequency Domain'), grid on

%%

% Hence the convolution in time domain is equivalent to multiplication in
% frequency domain.

disp('Hence the convolutdion in time domain is equivalent to multiplication in frequency domain.');