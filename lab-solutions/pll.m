function out = pll(y,t,Fs,Fc)

F0 = 1;
K_vco = 2 * pi * 15e1;

len_y = length(y);
error_detector = zeros(1, len_y);
loop_filter = zeros(1, len_y);
vco_output = zeros(1, len_y);

vco_angle = 0;
T = 1/Fs;

[b, a] = butter(1, F0/(Fs/2));
z = zeros(max(length(a), length(b))-1,1);

for i=1:len_y,
    vco_output(i)=cos(vco_angle);
    
    error_detector(i) = vco_output(i)*y(i);
    
    [loop_filter(i), z] = filter(b, a, error_detector(i), z);

    w_c = (2*pi*Fc + loop_filter(i)*K_vco)*T;
    vco_angle = vco_angle + w_c;
    
    vco_angle = vco_angle + (-2*pi)*(vco_angle>2*pi) + (2*pi)*(vco_angle<-2*pi);
end

out = loop_filter;
end