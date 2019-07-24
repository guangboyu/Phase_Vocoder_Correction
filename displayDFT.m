function [F Y Z]=displayDFT(wave,fs)
%%Displays the positive half of the DFT magnitude spectrum in dB, but
%%can return the entire DFT (Z). Requires input wave signal and its
%%sampling frequency fs.

%%NFFT is a power of 2 to maximize efficiency of FFT algorithm
NFFT = 2^nextpow2(length(wave));

Z = fft(wave,NFFT);

%Scales amplitude axis
W = Z/length(wave);
Y = abs(W(1:floor(NFFT/2+1)));
Y = 20*log10(Y/min(Y(:)));

%Scales frequency axis
F = fs/2*linspace(0,1,floor(NFFT/2+1));

plot(F,Y);
title('Single-Sided Amplitude Spectrum of Y(t)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

end