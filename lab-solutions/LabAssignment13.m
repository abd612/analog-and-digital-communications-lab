%% ADC Lab Assignment #13

%% Task 1

[x,Fs] = audioread('almostcaught.wav');
sound(x,Fs);
t = 1:length(x);
figure, plot(t,x), title('Original Signal');

%% Task 2

L = [256 128 64 32 16];

for n = 1:length(L)
    [y,d,SNR_act(n)] = quantization(x',L(n));
    sound(y,Fs);
    figure, plot(t,y), title(['Quantized Signal for L = ' num2str(L(n))]);
end

disp(['The signal is hardly intelligible for L = ' num2str(L(4))]);

%% Task 3

mp2 = max(x)^2;
m2p = mean(x.^2);

for n = 1:length(L)
    SNR(n) = 3*L(n)^2*m2p/mp2;
    SNR_dB(n) = 10*log10(3*L(n)^2*m2p/mp2);
    disp(['For L = ' num2str(L(n)) ', the SNR = ' num2str(SNR(n))]);
end

disp(['The signal is hardly intelligible for L = ' num2str(L(4)) ' with SNR = ' num2str(SNR(4))]);

%% Function for Quantization
%
%  function [y,del,snr] = quantization (x,l)
% 
%     xp = max(x);
%     xn = min(x);
%     del = (xp - xn)/l;
% 
%     lev = xn+del/2:del:xp-del/2;
%     sig = (x - xn)/del + 1/2;
%     ind = round(sig);
%     ind = min(ind,l);
%     y = lev(ind);
% 
%     snr = 20*log10(norm(x)/norm(x-y));
% 
%  end
%

%% Credits
% 
%  Made by:
%  Muhammad Abdullah
%  (2015-EE-166)
%  