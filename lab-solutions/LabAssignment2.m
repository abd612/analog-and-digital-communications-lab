%% ADC Lab Assignment #2

%% Problem #1

%%
t = 0:1/16:2;

y1 = sin(2*pi*t)';
y2 = sin(4*pi*t)';
y3 = exp(-2*t)';
y4 = cos(2*pi*t)';

%%
lsq1 = dot(y1,y1)
lsq2 = dot(y2,y2)
lsq3 = dot(y3,y3)
lsq4 = dot(y4,y4)

%% Problem #2

%%
figure
plot(t,y1,'r','Linewidth',1)
hold
grid
plot(t,y2,'b','Linewidth',1)
xlabel('Time');
ylabel('Amplitude')
title('y1 and y2 vectors as function of time')
legend('y1','y2')

%%
d = dot(y1,y2)

%%
figure
plot(t,y1,'r','Linewidth',1)
hold
grid
plot(t,y3,'b','Linewidth',1)
xlabel('Time');
ylabel('Amplitude')
title('y1 and y3 vectors as function of time')
legend('y1','y3')

%%
d = dot(y1,y3)

%% Problem #3

%%
d = dot(y1,y4)

%% Problem #4

%%
t_ = 0:1/16:1;
g1 = sin(pi*t_)';
g2 = zeros(1,16)';
g = vertcat(g1,g2);
figure
plot(t,g,'r','Linewidth',1)
hold
grid
y1 = (ones(1,16)*1)';
y2 = zeros(1,17)';
y5 = vertcat(y1,y2);
plot(t,y5,'b','Linewidth',1)
xlabel('Time');
ylabel('Amplitude')
title('g and y5 vectors as function of time')
legend('g','y5')

%%
c = dot(g,y5)/dot(y5,y5)
g = c*y5;

%% Problem #5

%%
t = 0:1/16:1;
x = sin(2*pi*t)';
g1 = sin(4*pi*t)';
g2 = (-sin(2*pi*t))';
g3 = (ones(1,17)*0.707)';
g4a = (ones(1,9)*0.707)';
g4b = (ones(1,8)*-0.707)';
g4 = vertcat(g4a,g4b);

%%
c1 = corrcoef(x,g1)
c1_ = dot(g1,x)/(norm(g1)*norm(x))
c2 = corrcoef(x,g2)
c2_ = dot(g2,x)/(norm(g2)*norm(x))
c3 = corrcoef(x,g3)
c3_ = dot(g3,x)/(norm(g3)*norm(x))
c4 = corrcoef(x,g4)
c4_ = dot(g4,x)/(norm(g4)*norm(x))

%%
% Made by: Muhammad Abdullah (2015-EE-166)