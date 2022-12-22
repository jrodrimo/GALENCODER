 load('data_loaded.mat')
level=data_loaded.signal;
fs= 2000;                        % Hz sample frequency
Ts= 1/fs;
f0= 1200;                         % Hz sine frequency
A= sqrt(2)                        % V sine amplitude for P= 1 W into 1 ohm.
N= 2^15;                         % number of time samples
nfft= N;                         % number of frequency samples
n= 0:N-1;                        % time index
watts = 10.^((data_loaded.signal-30)/10)*1e12;
wattsr = 10.^((data_loaded.signal-30)/10);
A_=wattsr./max(wattsr);
for k=1:200
for k=1:length(level)
   hold off
  A=A_(k);
  
x= A*sin(2*pi*f0*n*Ts) + .1*randn(1,N);    % 1 W sinewave + noise
w= hanning(N);                   % window function
window= w.*sqrt(N/sum(w.^2));    % normalize window for P= 1
xw= x.*window';                  % apply window to x
%
X= fft(xw,nfft);                 % DFT
X= X(1:nfft/2);                  % retain samples from 0 to fs/2
magsq= real(X).^2 + imag(X).^2;  % DFT magnitude squared
P_bin= 2/nfft.^2 * magsq;        % W/bin power spectrum into 1 ohm
P_Hz= P_bin*nfft/fs;             % W/Hz power spectrum
%
PdB_bin= 10*log10(P_bin);        % dBW/bin
PdB_Hz= 10*log10(P_Hz);          % dBW/Hz
%
k= 0:nfft/2-1;                   % frequency index
f= k*fs/nfft;                    % Hz frequency vector
%
%
% plot(f,PdB_bin),grid
% axis([0 fs/2 -60 10])
% xlabel('Hz'),ylabel('dBW/bin')
% title('Spectrum with amplitude units of dBW/bin')
% figure
[y_val y_poss] = max(PdB_Hz);

set(handles.DronPositio,f,PdB_Hz),grid on
hold on
plot(handles.DronPositio,f(y_poss),PdB_Hz(y_poss),'or')
plot(handles.DronPositio,f(y_poss),PdB_Hz(y_poss),'*k')
axis([0 fs/2 -65 10])
xlabel('Hz'),ylabel('dBW/Hz')
title('Spectrum with amplitude units of dBW/Hz')
pause(1)

end
end