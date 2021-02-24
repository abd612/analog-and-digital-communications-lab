function y = lp_filter(x, f_cutoff, F_sampling )

%y is the filtered sequence
%x is the input sequence
%f_cutoff is the desired cutoff frequency of the low pass filter
%F_sampling is the sampling rate of the inout sequence
%f_cutoff should be less than half of sampling frequency
% i.e. 2*f_cutoff < F_sampling

N = 100;
Rp = 0.00057565; % Corresponds to 0.01 dB peak-to-peak ripple
Rst = 1e-4; % Corresponds to 80 dB stopband attenuation

Wn = 2*f_cutoff/F_sampling;
b = firceqrip(N,Wn,[Rp Rst],'passedge'); % NUM = vector of coeffs
y = filter(b,1,x);
y = [y(N/2+1:end); zeros(N/2,1)];

end
