%% ADC Lab Project

% Input from User
userInput = helperFMUserInput;
[fmRxParams,sigSrc] = helperFMConfig(userInput);

% Initializations
runtime = 0;
rtlsdr_data = [];

while(1)

% Data from SDR
while runtime < 1
[rcv,~,lost,late] = sigSrc();
rtlsdr_data = [rtlsdr_data; rcv];
runtime = runtime + fmRxParams.FrontEndFrameTime + ...
double(lost)/fmRxParams.FrontEndSampleRate;
end

% Normalization
x = double(rtlsdr_data);

% w = x;
% W = fftshift(fft(w));
% f = -length(W)/2:length(W)/2-1;
% figure;
% subplot(211), plot(w), title('Signal after Data Acquisition'), grid on;
% subplot(212), plot(f,abs(W)), title('Spectrum after Data Acquisition'), grid on;

x_norm = exp(1i*angle(x));

% w = x_norm;
% W = fftshift(fft(w));
% f = -length(W)/2:length(W)/2-1;
% figure;
% subplot(211), plot(w), title('Signal after Normalization'), grid on;
% subplot(212), plot(f,abs(W)), title('Spectrum after Normalization'), grid on;

% Discriminator
x_conj = conj(x_norm);
x_conj = [0; x_conj(1:end-1)];
m = angle(x_norm.*x_conj);

% w = m;
% W = fftshift(fft(w));
% f = -length(W)/2:length(W)/2-1;
% figure;
% subplot(211), plot(w), title('Signal after Discrimination'), grid on;
% subplot(212), plot(f,abs(W)), title('Spectrum after Discrimination'), grid on;

% Normalization
m_norm = m/max(m);

% w = m_norm;
% W = fftshift(fft(w));
% f = -length(W)/2:length(W)/2-1;
% figure;
% subplot(211), plot(w), title('Signal after Second Normalization'), grid on;
% subplot(212), plot(f,abs(W)), title('Spectrum after Second Normalization'), grid on;

% Decimator
m_deci = decimate(m_norm, 15);

% w = m_deci;
% W = fftshift(fft(w));
% f = -length(W)/2:length(W)/2-1;
% figure;
% subplot(211), plot(w), title('Signal after Decimation'), grid on;
% subplot(212), plot(f,abs(W)), title('Spectrum after Decimation'), grid on;

% Sound Output
sound(m_deci,16000);

% Resetting variables
rtlsdr_data = [];
runtime = 0;

end
