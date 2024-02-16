
delaySamples = round(23); 
attenuatedData = 0.501 * audioData;
leftChannel = audioData; % Set left channel as speech without delay
rightChannel = [zeros(delaySamples, 1); attenuatedData(1:(220500 - delaySamples))]; % Delay right channel
stereoAudio = [leftChannel, rightChannel]; % Combine into a stereo track
sound(stereoAudio, Fs); % Play the stereo audio with a delay on one channel
audiowrite('Duong-stereosoundfile-avghead-6dB.wav', stereoAudio, Fs);