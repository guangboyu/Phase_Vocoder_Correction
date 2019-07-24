function Y = displaySpectrogram(S,F,T)
%%Quick function to display the spectrogram of a given STFT
%%uimagesc is used so that the axes can have non-linear spacing

X = abs(S);
%%uimagesc(T,F,S);  
colorbar;
axis xy
xlabel('Time (s)')
ylabel('Freq (Hz)')

end