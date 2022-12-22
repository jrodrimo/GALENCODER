function threshold_plot(x, y, y1,y2)
hold on

n = length(x);
threshold=-100.6%mean(data_loaded.signal);
    color_3=[0 0 1];
    color_2=[0 1 0];
    color_1=[1 0 0];
color1=color_2;
color2=color_3;
y0=y1;
for k=1:2
        if k==2

    color1=color_1;
color2=color_2;
y0=y2

        end
    

    
for i = 2 : n
  x1 = x(i - 1); y1 = y(i - 1);
  x2 = x(i); y2 = y(i);
  ascending = y1 < y2;
  if x1 == x2
    if ascending
      plot([x1 x2], [y1, y0], 'Color', color1);
      plot([x1 x2], [y0, y2], 'Color', color2);
    else
      plot([x1 x2], [y1, y0], 'Color', color2);
      plot([x1 x2], [y0, y2], 'Color', color1);
    end;
  elseif y1 == y2
    if threshold <= y1
      plot([x1 x2], [y1 y2], 'Color', color2);
    else
      plot([x1 x2], [y1 y2], 'Color', color1);
    end;
  else
    a = (y2 - y1) / (x2 - x1);
    b = y1 - a * x1;
    x0 = (y0 - b) / a;
    if x1 <= x0 && x0 <= x2
      if ascending
        plot([x1 x0], [y1, y0], 'Color', color1);
        plot([x0 x2], [y0, y2], 'Color', color2);
      else
        plot([x1 x0], [y1, y0], 'Color', color2);
        plot([x0 x2], [y0, y2], 'Color', color1);
      end;
    else
      if y0 <= y1
        plot([x1 x2], [y1 y2], 'Color', color2);
      else
        plot([x1 x2], [y1 y2], 'Color', color1);
      end;
    end;   
  end;

end;
end;



% plot(data_loaded.time/1000000000000,'r')

% %     fs= 4000;                % Hz sample rate
% %     Ts= 1/fs;
% %     f0= 500;                 % Hz sine frequency
% %     A= sqrt(2);              % V sine amplitude for P= 1 W into 1 ohm.
% %     N= 1024;                 % number of time samples
% %     n= 0:N-1;                % time index
% %     x= A*sin(2*pi*f0*n*Ts) + .1*randn(1,N);    % 1 W sinewave + noise    
% % 
% % nfft= N;
% %     window= rectwin(nfft);
% %     [pxx,f]= pwelch(x,window,0,nfft,fs);    % W/Hz power spectral density
% %     PdB_Hz= 10*log10(pxx);                  % dBW/Hz
% %     
%     
%    %% 
%     
%     %spectrum_demo.m   1/3/19  Neil Robertson
% % Use FFT to find spectrum of sine + noise in units of dBW/bin and dBW/Hz.
% fs= 2000;                        % Hz sample frequency
% Ts= 1/fs;
% f0= 1200;                         % Hz sine frequency
% A= sqrt(2)                        % V sine amplitude for P= 1 W into 1 ohm.
% N= 2^15;                         % number of time samples
% nfft= N;                         % number of frequency samples
% n= 0:N-1;                        % time index
% watts = 10.^((data_loaded.signal-30)/10)*1e12;
% wattsr = 10.^((data_loaded.signal-30)/10);
% A_=wattsr./max(wattsr);
% for k=1:200
% for k=1:length(level)
%    hold off
%   A=A_(k);
%   
% x= A*sin(2*pi*f0*n*Ts) + .1*randn(1,N);    % 1 W sinewave + noise
% w= hanning(N);                   % window function
% window= w.*sqrt(N/sum(w.^2));    % normalize window for P= 1
% xw= x.*window';                  % apply window to x
% %
% X= fft(xw,nfft);                 % DFT
% X= X(1:nfft/2);                  % retain samples from 0 to fs/2
% magsq= real(X).^2 + imag(X).^2;  % DFT magnitude squared
% P_bin= 2/nfft.^2 * magsq;        % W/bin power spectrum into 1 ohm
% P_Hz= P_bin*nfft/fs;             % W/Hz power spectrum
% %
% PdB_bin= 10*log10(P_bin);        % dBW/bin
% PdB_Hz= 10*log10(P_Hz);          % dBW/Hz
% %
% k= 0:nfft/2-1;                   % frequency index
% f= k*fs/nfft;                    % Hz frequency vector
% %
% %
% % plot(f,PdB_bin),grid
% % axis([0 fs/2 -60 10])
% % xlabel('Hz'),ylabel('dBW/bin')
% % title('Spectrum with amplitude units of dBW/bin')
% % figure
% [y_val y_poss] = max(PdB_Hz);
% 
% plot(f,PdB_Hz),grid on
% hold on
% plot(f(y_poss),PdB_Hz(y_poss),'or')
% plot(f(y_poss),PdB_Hz(y_poss),'*k')
% axis([0 fs/2 -65 10])
% xlabel('Hz'),ylabel('dBW/Hz')
% title('Spectrum with amplitude units of dBW/Hz')
% pause(1)
% 
% end
% end
% %%
% % figure(20)
% % 
% % %spectrum_demo_avg  1/3/19 Neil Robertson
% % % Perform DFT averaging on signal = sine + noise
% % % noverlap = 0
% % % Given signal x(1:8192),
% % %
% % %            |x(1)    x(1025) . . . . x(7169)|
% % %            |x(2)    x(1026) . . . . x(7170)|
% % % xMatrix=   | .         .               .   |
% % %            | .         .               .   |
% % %            |x(1024) x(2048) . . . . x(8192)|
% % %
% % %
% % fs= 4000;                        % Hz sample frequency
% % Ts= 1/fs;
% % f0= 500;                         % Hz sine frequency
% % A= sqrt(2)                       % V sine amplitude for P= 1 W into 1 ohm
% % nfft= 1024;                      % number of frequency samples
% % Navg= 8;                         % number of DFT's to be averaged
% % N= nfft*Navg;                    % number of time samples
% % n= 0:N-1;                        % time index
% % x= A*sin(2*pi*f0*n*Ts) + .1*randn(1,N);    % 1 W sinewave + noise
% % w= hanning(nfft);                          % window function
% % window= w.*sqrt(nfft/sum(w.^2));           % normalize window for P= 1 W
% % %
% % % Create matrix xMatrix with Navg columns,
% % % each column a segment of x of length nfft
% % xMatrix= reshape(x,nfft,Navg);
% % magsq_sum= zeros(nfft/2);
% % for i= 1:Navg
% %     x_column= xMatrix(:,i);
% %     xw= x_column.*window;                % apply window of length nfft
% %     X= fft(xw);                          % DFT
% %     X= X(1:nfft/2);                      % retain samples from 0 to fs/2
% %     magsq= real(X).^2 + imag(X).^2;      % DFT magnitude squared
% %     magsq_sum= magsq_sum + magsq;        % sum of DFT mag squared
% % end
% % mag_sq_avg= magsq_sum/Navg;              % average of DFT mag squared
% % P_bin= 2/nfft.^2 *mag_sq_avg;            % W/bin power spectrum
% % P_Hz= P_bin*nfft/fs;                     % W/Hz power spectrum
% % PdB_bin= 10*log10(P_bin);                % dBW/bin
% % PdB_Hz= 10*log10(P_Hz);                  % dBW/Hz
% % k= 0:nfft/2 -1;                          % frequency index
% % f= k*fs/nfft;                            % Hz frequency vector
% % %
% % plot(f,PdB_bin),grid
% % axis([0 fs/2 -60 10])
% % xlabel('Hz'),ylabel('dBW/bin')
% % title('Averaged Spectrum with amplitude units of dBW/bin')
% % figure
% % plot(f,PdB_Hz),grid
% % axis([0 fs/2 -60 10])
% % xlabel('Hz'),ylabel('dBW/Hz')
% % title('Averaged Spectrum with amplitude units of dBW/Hz')
% % 
% % figure(25)
% % %snr1.m   2/17/20 nr
% % 
% % % compute SNR of sine + gaussian noise
% % 
% % % generate signal
% % 
% % fs= 4000;
% % 
% % Ts= 1/fs;
% % 
% % f0= 500;
% % 
% % A= sqrt(2);
% % 
% % N= 8192;
% % 
% % n= 0:N-1;
% % 
% % % signal with SNR of 40 dB  (20 log10(.01) = -40 dBW)
% % 
% % x= A*sin(2*pi*f0*n*Ts) + .01*randn(1,N);
% % 
% % nfft= 2048;
% % 
% % noverlap= nfft/2;
% % 
% % window= hanning(nfft);
% % 
% % [p,f]= pwelch(x,window,noverlap,nfft,fs);
% % 
% % dBW_bin= 10*log10(p*fs/nfft);
% % 
% % % sum noise, excluding carrier neighborhood
% % 
% % sump= sum(p(1:252)) + sum(p(262:end));  
% % 
% % pnoise_bin= sump*fs/nfft;   % total noise power in W
% % 
% % N= 10*log10(pnoise_bin);    % dBW
% % 
% % SNR_dB= 0 - N           %  note: signal power is 0 dBW
% % 
% % plot(f,dBW_bin),grid
% % 
% % axis([0 fs/2 -90 10])
% % 
% % xlabel('Hz'),ylabel('dBW/bin')