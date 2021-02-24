% Lab Assignment 9
% Phase-Locked Loop
% -------------------------------------------------------------------------
% Author: Muhamad Abdullah (2015-EE-166)

%close all;clear all;clc;

% Initialize all the following variables here.
% Fs = Sampling frequency, samples per second
% Fc = VCO free-running frequency, Hz
% df = The deviation in the incoming carrier frequency, Hz
% F0 = Cut-off frequency of the loop filter, Hz
% K vco = VCO sensitivity, rad/volts
% sim end = Simulation end time in seconds.

Fs = 20e3;
F0 = 1;
Fc = 2e3;
df = 42;
K_vco = 2*pi*15e1;
sim_end = 2;
Ts = 1/Fs;

% Generate the time axis
t = 0:Ts:sim_end-Ts;

% Generate the incoming carrier
y = sin(2*pi*(Fc+df)*t);

% Declare empty vectors to store the output of the loop filter, error
% detector and vco output.
len_y = length(y);
error_detector = zeros(1,len_y);
loop_filter = zeros(1,len_y);
vco_output = zeros(1,len_y);

% Initialize VCO angle to zero
vco_angle = 0;
T = 1/Fs;

% Declare the loop filter
[b, a] = butter(1 , F0/(Fs/2));
z = zeros(max(length(a), length(b))-1 ,1);

%% Phase Locked Loop
% Simulate the PLL loop iterations
for i= 1:len_y,
    % Calculate the output of the VCO using current vco angle
    vco_output(i) = cos(2*pi*Fc*T + vco_angle);
    % Calculate the output of the error detector using one sample of the
    % incoming carrier and one sample of the VCO output
    error_detector(i) = y(i)*vco_output(i);
    % Calculate the loop filter's output. Note that the variable Z contains
    % the final state of the filter after a sample is passed through it.
    [loop_filter(i), z] = filter(b, a, error_detector(i),z);
    % Update the VCO angle based on the output from the loop filter. The
    % output of the loop filter adds to the free-running frequency of the
    % VCO after multiplication by K vco. To convert this frequency to VCO
    % angle, you can integrate the frequency term to get the VCO angle. The
    % integration can be thought of as a cumulative sum of the updated
    % frequency.
    vco_angle = vco_angle + 2*pi*(loop_filter(i)*K_vco + Fc)*T;
    % Limit the VCO angle to - 2*pi and 2*pi. When the value of VCO angle is
    % higher than 2*pi subtract 2*pi and when the value of the VCO angle is
    % lower than - 2*pi add 2*pi.
    if(vco_angle > 2*pi) vco_angle = vco_angle - 2*pi; end
    if(vco_angle < -2*pi) vco_angle = vco_angle + 2*pi; end
end

% Plot error detector output
figure, subplot(311), plot(t,error_detector), grid;
title(['Error Detector Output (df = ' num2str(df) ')']);

% Plot a scaled version of the loop filter's output, i.e.,
% loop filter*K vco/(2*pi).
subplot(312), plot(t,loop_filter*K_vco/(2*pi)), grid;
title(['Loop Filter Output (df = ' num2str(df) ')']);

% Plot last five cycles of incoming carrier and the VCO output overlayed on
% each other
% subplot(313), plot(t(1:50),y(39951:40000),t(1:50),vco_output(39951:40000));
subplot(313), plot(t,y,'--',t,vco_output), grid;
title(['Incoming Signal & VCO Output (df = ' num2str(df) ')']);
legend('Incoming Signal','VCO Output'), xlim([1.9975 2]);

%% Credits
% 
%  Made by:
%  Muhammad Abdullah
%  (2015-EE-166)
%  