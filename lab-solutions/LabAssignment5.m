%% ADC Lab Assignment #5

%% Part (a): Code

T0 = 2;
N0 = 2^6;
Ts = T0/N0;
t = 0:Ts:T0-Ts;

x1 = exp(-2*t);

Dn = fft(x1)/N0;
n = 0:length(Dn)-1;
f = n/T0;

subplot(2,1,1), stem(f,abs(Dn),'.', 'r');
title('\bf Amplitude Spectrum');
xlabel('Frequency');
ylabel('Amplitude');
subplot(2,1,2), stem(f,angle(Dn),'.', 'b');
title('\bf Phase Spectrum');
xlabel('Frequency');
ylabel('Phase');

%% Part (a): Questions
% 
%  The value of Fs chosen is 32. It is calculated by dividing the total
%  time period T0 by number of samples N0 to get Ts and then taking the
%  inverse to get Fs. N0 should be in powers of 2.
%  The first frequency is 0 while the last frequency is 32.
% 

%% Part (b): Code

T0 = 4;
Ts = 1/32;
N0 = T0/Ts;
t = 0:Ts:T0-Ts;

x2 = exp(-t).*heaviside(t);

X2 = fft(x2);
n = 0:length(X2)-1;
f = n/T0;

subplot(2,1,1), stem(f,abs(X2),'.', 'r');
title('\bf Amplitude Spectrum');
xlabel('Frequency');
ylabel('Amplitude');
subplot(2,1,2), stem(f,angle(X2),'.', 'b');
title('\bf Phase Spectrum');
xlabel('Frequency');
ylabel('Phase');

%% Part (b): Questions
% 
%  The value of Fs chosen is 32 whereas T0 is chosen to be 4. By
%  calculations, Ts comes out to be 0.03125, whose inverse gives Fs to be
%  32. T0 is equal to 4 time constants, so its value comes out to be 4.
%  The first frequency is 0 while the last frequency is 32.
% 
%% Part (c): Code

T0 = 2;
N0 = 2^6;
Ts = T0/N0;
t = 0:Ts:T0-Ts;

x1 = exp(-2*t);

Dn = fft(x1)/N0;
n = 0:length(Dn)-1;
f = n/T0;

f = f(1:length(f)/2);
Dn = Dn(1:length(Dn)/2);
subplot(2,1,1), stem([-f f],[abs(Dn) abs(Dn)],'.', 'r');
title('\bf Amplitude Spectrum');
xlabel('Frequency');
ylabel('Amplitude');
subplot(2,1,2), stem([-f f],[angle(Dn) angle(Dn)],'.', 'b');
title('\bf Phase Spectrum');
xlabel('Frequency');
ylabel('Phase');

%% Part (c): Questions
% 
%  Let f0 be the fundamental frequency. If -f0 corresponds to -f0 + 32,
%  -2f0 corresponds to -2f0 +32.
%  The first frequency is -16 while the last frequency is +16.
%  There are Fs*T0/2 positive frequencies and as many negative frequencies.
% 
%% Part (d): Code

T0 = 4;
Ts = 1/32;
N0 = T0/Ts;
t = 0:Ts:T0-Ts;

x2 = exp(-t).*heaviside(t);

X2 = fft(x2);
n = 0:length(X2)-1;
f = n/T0;

f = f(1:length(f)/2);
X2 = X2(1:length(X2)/2);
subplot(2,1,1), stem([-f f],[abs(X2) abs(X2)],'.', 'r');
title('\bf Amplitude Spectrum');
xlabel('Frequency');
ylabel('Amplitude');
subplot(2,1,2), stem([-f f],[angle(X2) angle(X2)],'.', 'b');
title('\bf Phase Spectrum');
xlabel('Frequency');
ylabel('Phase');

%% Part (d): Questions
% 
%  Let f0 be the fundamental frequency. If -f0 corresponds to -f0 + 32,
%  -2f0 corresponds to -2f0 +32.
%  The first frequency is -16 while the last frequency is +16.
%  There are Fs*T0/2 positive frequencies and as many negative frequencies.
% 
%% Part (e): Questions
% 
%  It does matter if N0 is power of 2 or not. Alternatively, values change
%  for N0 being even or odd.
% 
%% Part (f): Questions
%
%  In this case, the spectrum is padded with trailing zeros when the
%  fourier fft is performed.
%
%% Part (g): Questions
%
%  For Fourier Series:
%  * fft is divided by N0
%  * Fs taken as basis of magnitude of Dn
%  * T0 is fixed
%
%  For Fourier Transform:
%  * fft is not divided by N0
%  * Fs taken as basis of magnitude of G(w)
%  * T0 is equal to four time constants
%  
%% Credits
%
%  Made by:
%  Muhammad Abdullah
%  2015-EE-166
%