%% Sampling and Aliasing: Lab P-4 : 4 Lab Exercise
function y=main(x)

%% 4.1 a)
%  Write an M-file called beat.m

function [xx,tt]= beat(A,B,fc,delf,fsamp,dur)
tt=0:1/fsamp:dur;
xx=A.*cos(2*pi.*(fc-delf).*tt)+B.*cos(2*pi.*(fc+delf).*tt);
end
%% 4.1 b)
% Call beat.m and 
%test the file with the values 
%A=10, B=10, fc=1000, delf=10, fsamp=11025, and dur=1 s.

close all; 
clear all; 
clc;
A =10;
B=10;
fc=1000;
delf=10;
dur=1;
fsamp=11025;
[xx,tt]= beat(A,B,fc,delf,fsamp,dur);
t=tt(1:round(0.2*fsamp));
plot(t,xx(1:length(t)));
xlabel('t(seconds)');
ylabel('x(t)');

soundsc(xx,fsamp);

sound(xx, fsamp);
filename='sound4_1b.wav';
audiowrite(filename, xx, fsamp)


%% 4.2 
% When A=B 

function [xx,tt]= beat2(A,fc,delf,fsamp,dur)
tt=0:1/fsamp:dur;
xx= 2*A*cos(2*pi*delf*tt).*cos(2*pi*fc*tt);
end
%% 4.2 a)
% Call beat2.m and 
% generate and plot a beat signal using the values of 
%f = 32Hz, Tdur = 0.26s, fs = 11025Hz, and fc = 2000 Hz.

close all; 
clear all; 
clc;
A=10;
fc=2000;
delf=32;
dur=0.26;
fsamp=11025;
[xx,tt]= beat2(A,fc,delf,fsamp,dur);
plot(tt,xx);
xlabel('t(seconds)');
ylabel('x(t)');

soundsc(xx,fsamp);

sound(xx, fsamp);
filename='sound4_2a.wav';
audiowrite(filename, xx, fsamp)




%% 4.2 b)
% Find the spectrogram using window length 2048.

close all; 
clear all; 
clc;
A=10;
fc=2000;
delf=32;
dur=0.26;
fsamp=11025;
[xx,tt]= beat2(A,fc,delf,fsamp,dur);

figure 
specgram(xx, 2048, fsamp);
colormap(1-gray(256));
soundsc(xx,fsamp);

sound(xx, fsamp);
filename='sound4_2b.wav';
audiowrite(filename, xx, fsamp)



%% 4.2 c)
% Find the spectrogram using window length 16.

close all; 
clear all; 
clc;
A=10;
fc=2000;
delf=32;
dur=0.26;
fsamp=11025;
[xx,tt]= beat2(A,fc,delf,fsamp,dur);

figure 
specgram(xx, 16, fsamp);
colormap(1-gray(256));

soundsc(xx,fsamp);

sound(xx, fsamp);
filename='sound4_2c.wav';
audiowrite(filename, xx, fsamp)


%% 4.3
% This is mychirp

function [xx,tt] = mychirp( f1, f2, dur, fsamp )
%MYCHIRP generate a linear-FM chirp signal
%
% usage: xx = mychirp( f1, f2, dur, fsamp )
%
% f1 = starting frequency
% f2 = ending frequency
% dur = total time duration
% fsamp = sampling frequency (OPTIONAL: default is 11025)
%
% xx = (vector of) samples of the chirp signal
% tt = vector of time instants for t=0 to t=dur
dt = 1/fsamp;
tt = 0:dt:dur;
u = (f2 - f1)/(dur*2);
% instantaneous frequency = fi
fi = 2*u*tt + f1;
% theta(t) = psi = integral(fi(t) dt)
psi = 2*pi*(2*u*tt.^2+2*f1*tt);
% Assume A = 7.7
A = 7.7;
xx = real(A*exp(1i*psi));
end
%% 4.3
% Synthesize the chirp signal using mychirp. 
% The D/A conversion rate is fs = 11025 Hz, total time = 3 s, 
% and the instantaneous frequency starts at 5,000 Hz and ends at 300 Hz.

close all; 
clear all; 
clc;
dur = 3;
fsamp = 11025;%sampling frequency
f1 = 5000;%starting frequency
f2 = 300;%ending frequency
 [xx,tt] = mychirp( f1, f2, dur, fsamp )

plot(tt,xx);
figure
specgram(xx, 2048, fsamp);
colormap(1-gray(256));
soundsc(xx,fsamp);

sound(xx, fsamp);
filename='sound4_3.wav';
audiowrite(filename, xx, fsamp)

end
