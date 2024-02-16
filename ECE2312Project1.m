%% Project: Discrete-Time Signal and System Analysis

% Recording Speech
recObj = audiorecorder(44100, 16, 1); % Create a recorder object with 44.1 kHz, 16-bit, mono
disp('Start speaking.');
recordblocking(recObj, 5); % Record 5 seconds of speech
disp('End of Recording.');

% Extract audio data
audioData = getaudiodata(recObj);

% Plot Time Domain Representation
figure;
plot(audioData);
title('Time Domain Representation of Recorded Speech');
xlabel('Sample Number');
ylabel('Amplitude');

% Plot Spectrogram
figure;
spectrogram(audioData, 256, [], [], recObj.SampleRate, 'yaxis');
title('Spectrogram of Recorded Speech');
colorbar;

% Save the Recording as a WAV file
filename = 'crazyFredrick.wav';
audiowrite(filename, audioData, recObj.SampleRate);

% Load and Play the WAV File
[loadedAudio, Fs] = audioread(filename);
sound(loadedAudio, Fs);

