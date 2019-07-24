[y,fs] = audioread("Home_2.wav");

%test flow
[S F T Y] = quickSpectrogram(y,4000,4096,1);
sc = pitchCorrector(S, F, Y, semitonePitchTable());
sc = conj(sc);
iwave = iistft(sc,4096,4000,2000).';
audiowrite("output_Home_2.wav", iwave, fs)