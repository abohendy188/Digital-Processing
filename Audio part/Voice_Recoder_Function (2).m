%% check no error
clc;
clear ;
close all;
%to make sure that no previous data interupt and no error happended and
%clear the command window
%% variable setting
ch=1;%Number of channels--2 options--1 (mono) or 2 (stereo)
Fs=44100;%Sampling frequency in hertz
datatype='int16';
Nseconds=10;
nbits=16;%8,16,or 24

% as the doctor say in the first lecture sampling time for telefon is 8khz
% and in music in CDs is 44.1 khz
% if you want a high quality resultion audio sampling frequency would be
% 96khz or 196khz 

% the numbers of bit used in quantzion are 8 bits for low quality voices
% like in telefon and 16 bit for CDs used in music as shown in the first
% lecture of the term and also there are 24 and 32 bits which used in high
% quality resulatuion and professional 

% the voice parameteres fs 44100 hz and 16 bit for quantization
%% recording audio and saving it
recorder=audiorecorder(Fs,nbits,ch);
disp('Start speaking..')
%Record audio to audiorecorder object,hold control until recording completes
recordblocking(recorder,Nseconds);
disp('End of Recording.');
%Store recorded audio signal in numeric array
x=getaudiodata(recorder,datatype); % datatype could be int16 or uint8 or int8 or 
%Write audio file
audiowrite('input1.wav',x,Fs);

