%% ADC Lab Assignment #3

%% Problem 1

Fs = 16;
Ts = 1/Fs;
To = 1;
t = 0:Ts:To;

y = exp(-2*t)';

No = To*Fs;
n1 = To*Fs/2;
n2 = To*Fs/2 - 1;

ya0 = 1';

ya1 = cos((2*pi*t*1)/To)';
ya2 = cos((2*pi*t*2)/To)';
ya3 = cos((2*pi*t*3)/To)';
ya4 = cos((2*pi*t*4)/To)';
ya5 = cos((2*pi*t*5)/To)';
ya6 = cos((2*pi*t*6)/To)';
ya7 = cos((2*pi*t*7)/To)';
ya8 = cos((2*pi*t*8)/To)';

yb1 = sin(2*pi*t*1/To)';
yb2 = sin(2*pi*t*2/To)';
yb3 = sin(2*pi*t*3/To)';
yb4 = sin(2*pi*t*4/To)';
yb5 = sin(2*pi*t*5/To)';
yb6 = sin(2*pi*t*6/To)';
yb7 = sin(2*pi*t*7/To)';

fa0 = @(t) (1/To)*exp(-2*t);
a0 = integral(fa0,0,1);

fa1= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*1/To));
a1 = integral(fa1,0,1);
fa2= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*2/To));
a2 = integral(fa2,0,1);
fa3= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*3/To));
a3 = integral(fa3,0,1);
fa4= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*4/To));
a4 = integral(fa4,0,1);
fa5= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*5/To));
a5 = integral(fa5,0,1);
fa6= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*6/To));
a6 = integral(fa6,0,1);
fa7= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*7/To));
a7 = integral(fa7,0,1);
fa8= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*8/To));
a8 = integral(fa8,0,1);

fb1= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*1/To));
b1 = integral(fb1,0,1);
fb2= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*2/To));
b2 = integral(fb2,0,1);
fb3= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*3/To));
b3 = integral(fb3,0,1);
fb4= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*4/To));
b4 = integral(fb4,0,1);
fb5= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*5/To));
b5 = integral(fb5,0,1);
fb6= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*6/To));
b6 = integral(fb6,0,1);
fb7= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*7/To));
b7 = integral(fb7,0,1);

y_ = a0 + a1*ya1 + a2*ya2 + a3*ya3 + a4*ya4 + a5*ya5 + a6*ya6 + a7*ya7 + a8*ya8;
y_ = y_ + b1*yb1 + b2*yb2 + b3*yb3 + b4*yb4 + b5*yb5 + b6*yb6 + b7*yb7;

plot(t,y,'r',t,y_,'b')
legend('y','y_')

e = y - y_;
E = dot(e,e);

%% Problem 2

Fs = 16;
Ts = 1/Fs;
To = 1;
t = 0:Ts:To;

y = exp(-2*t)';

No = To*Fs;
n1 = To*Fs/4;
n2 = To*Fs/4 - 1;

ya0 = 1';

ya1 = cos((2*pi*t*1)/To)';
ya2 = cos((2*pi*t*2)/To)';
ya3 = cos((2*pi*t*3)/To)';
ya4 = cos((2*pi*t*4)/To)';

yb1 = sin(2*pi*t*1/To)';
yb2 = sin(2*pi*t*2/To)';
yb3 = sin(2*pi*t*3/To)';

fa0 = @(t) (1/To)*exp(-2*t);
a0 = integral(fa0,0,1);

fa1= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*1/To));
a1 = integral(fa1,0,1);
fa2= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*2/To));
a2 = integral(fa2,0,1);
fa3= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*3/To));
a3 = integral(fa3,0,1);
fa4= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*4/To));
a4 = integral(fa4,0,1);


fb1= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*1/To));
b1 = integral(fb1,0,1);
fb2= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*2/To));
b2 = integral(fb2,0,1);
fb3= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*3/To));
b3 = integral(fb3,0,1);


y_ = a0 + a1*ya1 + a2*ya2 + a3*ya3 + a4*ya4;
y_ = y_ + b1*yb1 + b2*yb2 + b3*yb3;

plot(t,y,'r',t,y_,'b')
legend('y','y_')

e = y - y_;
E = dot(e,e);

%% Problem 3

Fs = 16;
Ts = 1/Fs;
To = 1;
t = 0:Ts:To;

y = t';

No = To*Fs;

yd1 = exp(-i*2*pi*t*1/To)';
yd2 = exp(-i*2*pi*t*2/To)';
yd3 = exp(-i*2*pi*t*3/To)';
yd4 = exp(-i*2*pi*t*4/To)';
yd5 = exp(-i*2*pi*t*5/To)';
yd6 = exp(-i*2*pi*t*6/To)';
yd7 = exp(-i*2*pi*t*7/To)';
yd8 = exp(-i*2*pi*t*8/To)';
yd9 = exp(-i*2*pi*t*9/To)';
yd10 = exp(-i*2*pi*t*10/To)';
yd11 = exp(-i*2*pi*t*11/To)';
yd12 = exp(-i*2*pi*t*12/To)';
yd13 = exp(-i*2*pi*t*13/To)';
yd14 = exp(-i*2*pi*t*14/To)';
yd15 = exp(-i*2*pi*t*15/To)';

fd0 = @(t) (1/To)*t;
d0 = integral(fd0,0,1);

fd1= @(t) (2/To)*(t).*(exp(-i*2*pi*t*1/To));
d1 = integral(fd1,0,1);
fd2= @(t) (2/To)*(t).*(exp(-i*2*pi*t*2/To));
d2 = integral(fd2,0,1);
fd3= @(t) (2/To)*(t).*(exp(-i*2*pi*t*3/To));
d3 = integral(fd3,0,1);
fd4= @(t) (2/To)*(t).*(exp(-i*2*pi*t*4/To));
d4 = integral(fd4,0,1);
fd5= @(t) (2/To)*(t).*(exp(-i*2*pi*t*5/To));
d5 = integral(fd5,0,1);
fd6= @(t) (2/To)*(t).*(exp(-i*2*pi*t*6/To));
d6 = integral(fd6,0,1);
fd7= @(t) (2/To)*(t).*(exp(-i*2*pi*t*7/To));
d7 = integral(fd7,0,1);
fd8= @(t) (2/To)*(t).*(exp(-i*2*pi*t*8/To));
d8 = integral(fd8,0,1);
fd9= @(t) (2/To)*(t).*(exp(-i*2*pi*t*9/To));
d9 = integral(fd9,0,1);
fd10= @(t) (2/To)*(t).*(exp(-i*2*pi*t*10/To));
d10 = integral(fd10,0,1);
fd11= @(t) (2/To)*(t).*(exp(-i*2*pi*t*11/To));
d11 = integral(fd11,0,1);
fd12= @(t) (2/To)*(t).*(exp(-i*2*pi*t*12/To));
d12 = integral(fd12,0,1);
fd13= @(t) (2/To)*(t).*(exp(-i*2*pi*t*13/To));
d13 = integral(fd13,0,1);
fd14= @(t) (2/To)*(t).*(exp(-i*2*pi*t*14/To));
d14 = integral(fd14,0,1);
fd15= @(t) (2/To)*(t).*(exp(-i*2*pi*t*15/To));
d15 = integral(fd15,0,1);

y_ = d0 + d1*yd1 + d2*yd2 + d3*yd3 + d4*yd4 + d5*yd5 + d6*yd6 + d7*yd7 + d8*yd8;
y_ = y_ + d9*yd9 + d10*yd10 + d11*yd11 + d12*yd12 + d13*yd13 + d14*yd14 + d15*yd15;

plot(t,y,'r',t,y_,'b')
legend('y','y_')

e = y - y_;
E = dot(e,e);

%% Problem 4

Fs = 32;
Ts = 1/Fs;
To = 1;
t = 0:Ts:To;

y = exp(-2*t)';

No = To*Fs;
n1 = To*Fs/2;
n2 = To*Fs/2 - 1;

ya0 = 1';

ya1 = cos((2*pi*t*1)/To)';
ya2 = cos((2*pi*t*2)/To)';
ya3 = cos((2*pi*t*3)/To)';
ya4 = cos((2*pi*t*4)/To)';
ya5 = cos((2*pi*t*5)/To)';
ya6 = cos((2*pi*t*6)/To)';
ya7 = cos((2*pi*t*7)/To)';
ya8 = cos((2*pi*t*8)/To)';
ya9 = cos((2*pi*t*9)/To)';
ya10 = cos((2*pi*t*10)/To)';
ya11 = cos((2*pi*t*11)/To)';
ya12 = cos((2*pi*t*12)/To)';
ya13 = cos((2*pi*t*13)/To)';
ya14 = cos((2*pi*t*14)/To)';
ya15 = cos((2*pi*t*15)/To)';
ya16 = cos((2*pi*t*16)/To)';

yb1 = sin(2*pi*t*1/To)';
yb2 = sin(2*pi*t*2/To)';
yb3 = sin(2*pi*t*3/To)';
yb4 = sin(2*pi*t*4/To)';
yb5 = sin(2*pi*t*5/To)';
yb6 = sin(2*pi*t*6/To)';
yb7 = sin(2*pi*t*7/To)';
yb8 = sin(2*pi*t*8/To)';
yb9 = sin(2*pi*t*9/To)';
yb10 = sin(2*pi*t*10/To)';
yb11 = sin(2*pi*t*11/To)';
yb12 = sin(2*pi*t*12/To)';
yb13 = sin(2*pi*t*13/To)';
yb14 = sin(2*pi*t*14/To)';
yb15 = sin(2*pi*t*15/To)';

fa0 = @(t) (1/To)*exp(-2*t);
a0 = integral(fa0,0,1);

fa1= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*1/To));
a1 = integral(fa1,0,1);
fa2= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*2/To));
a2 = integral(fa2,0,1);
fa3= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*3/To));
a3 = integral(fa3,0,1);
fa4= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*4/To));
a4 = integral(fa4,0,1);
fa5= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*5/To));
a5 = integral(fa5,0,1);
fa6= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*6/To));
a6 = integral(fa6,0,1);
fa7= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*7/To));
a7 = integral(fa7,0,1);
fa8= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*8/To));
a8 = integral(fa8,0,1);
fa9= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*9/To));
a9 = integral(fa9,0,1);
fa10= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*10/To));
a10 = integral(fa10,0,1);
fa11= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*11/To));
a11 = integral(fa11,0,1);
fa12= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*12/To));
a12 = integral(fa12,0,1);
fa13= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*13/To));
a13 = integral(fa13,0,1);
fa14= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*14/To));
a14 = integral(fa14,0,1);
fa15= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*15/To));
a15 = integral(fa15,0,1);
fa16= @(t) (2/To)*(exp(-2*t)).*(cos(2*pi*t*16/To));
a16 = integral(fa16,0,1);

fb1= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*1/To));
b1 = integral(fb1,0,1);
fb2= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*2/To));
b2 = integral(fb2,0,1);
fb3= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*3/To));
b3 = integral(fb3,0,1);
fb4= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*4/To));
b4 = integral(fb4,0,1);
fb5= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*5/To));
b5 = integral(fb5,0,1);
fb6= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*6/To));
b6 = integral(fb6,0,1);
fb7= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*7/To));
b7 = integral(fb7,0,1);
fb8= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*8/To));
b8 = integral(fb8,0,1);
fb9= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*9/To));
b9 = integral(fb9,0,1);
fb10= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*10/To));
b10 = integral(fb10,0,1);
fb11= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*11/To));
b11 = integral(fb11,0,1);
fb12= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*12/To));
b12 = integral(fb12,0,1);
fb13= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*13/To));
b13 = integral(fb13,0,1);
fb14= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*14/To));
b14 = integral(fb14,0,1);
fb15= @(t) (2/To)*(exp(-2*t)).*(sin(2*pi*t*15/To));
b15 = integral(fb15,0,1);


y_ = a0 + a1*ya1 + a2*ya2 + a3*ya3 + a4*ya4 + a5*ya5 + a6*ya6 + a7*ya7 + a8*ya8;
y_ = y_ + a9*ya9 + a10*ya10 + a11*ya11 + a12*ya12 + a13*ya13 + a14*ya14 + a15*ya15 + a15*ya16;
y_ = y_ + b1*yb1 + b2*yb2 + b3*yb3 + b4*yb4 + b5*yb5 + b6*yb6 + b7*yb7 + b8*yb8;
y_ = y_ + b9*yb9 + b10*yb10 + b11*yb11 + b12*yb12 + b13*yb13 + b13*yb13 + b14*yb14 +b14*yb14;

plot(t,y,'r',t,y_,'b')
legend('y','y_')
e = y - y_;
E = dot(e,e);