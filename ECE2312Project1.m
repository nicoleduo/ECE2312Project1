%% Project: Discrete-Time Signal and System Analysis

% Step 1: Record Your Speech
recObj = audiorecorder(44100, 16, 1); % Create a recorder object with 44.1 kHz, 16-bit, mono
disp('Start speaking.');
recordblocking(recObj, 5); % Record 5 seconds of speech
disp('End of Recording.');

% Extract audio data
audioData = getaudiodata(recObj);

% Step 2: Plot Time Domain Representation
figure;
plot(audioData);
title('Time Domain Representation of Recorded Speech');
xlabel('Sample Number');
ylabel('Amplitude');

% Step 3: Generate and Plot Spectrogram
figure;
spectrogram(audioData, 256, [], [], recObj.SampleRate, 'yaxis');
title('Spectrogram of Recorded Speech');
colorbar;

% Step 4: Save the Recording as a WAV file
filename = 'crazyFredrick.wav';
audiowrite(filename, audioData, recObj.SampleRate);

% Step 5: Load and Play the WAV File
[loadedAudio, Fs] = audioread(filename);
sound(loadedAudio, Fs);

% Step 6: Fun with Stereo Speech Files
delaySamples = round(0.03 * Fs); % 0.03 seconds delay for stereo effect
leftChannel = [audioData; zeros(delaySamples, 1)]; % Extend left channel
rightChannel = [zeros(delaySamples, 1); audioData]; % Delay right channel
stereoAudio = [leftChannel, rightChannel]; % Combine into a stereo track
sound(stereoAudio, Fs); % Play the stereo audio with a delay on one channel

% Save the stereo audio file
audiowrite('stereoSpeech0delay.wav', stereoAudio, Fs);
