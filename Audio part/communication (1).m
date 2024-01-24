%% start from scratch
clc;
clear ;
close all;
load Low_Pass_Filter;
load First_Band_Pass_Filter;
load Second_Band_Pass_Filter;   %load the filters


%% filteration 
[Signal_1_Orignal, fs] = audioread('input1.WAV');
[Signal_2_Orignal, fs2] = audioread('input2.WAV');
Signal_1=filter(Hd,Signal_1_Orignal);
Signal_2=filter(Hd,Signal_2_Orignal);
% First we select the filter to stop at 8000 hz as the audio didn't change at all
% But it doesn't modulate well as we saw after testing MATLAP seem to has
% limmit to the carrier which work 
% So the biggest filter that Worked in the hole code is 6000 hz fpass and
% 6500 hz fstop and after all the audio still clear

% code for voice testing
%{
sound (Signal_1,fs,16);
pause(12);
sound (Signal_2,fs2,16);
pause(12);
%}
%% ploting the signals

N_Oringnal =length(Signal_1);                               %length of the signal
X_Oringanl=fft(Signal_1,N_Oringnal);                        %get fourier transform
freq_Orignal=(-N_Oringnal/2:N_Oringnal/2-1)*fs/N_Oringnal;  %get the frequence vector
figure();                                                   %open a new figure
plot(freq_Orignal,abs(fftshift(X_Oringanl))/N_Oringnal);    %plot the figure over frequency

title ("Orignal First Signal");
xlabel("Frequency",'FontSize',12);                           %create titles in the figures
ylabel("Amplitude",'FontSize',12);


N2_Oringnal =length(Signal_2);                               
X2_Oringanl=fft(Signal_2,N2_Oringnal);                        
freq2_Orignal=(-N2_Oringnal/2:N2_Oringnal/2-1)*fs2/N2_Oringnal;  
figure();                                                   
plot(freq2_Orignal,abs(fftshift(X2_Oringanl))/N2_Oringnal);    

title ("Orignal Second Signal");
xlabel("Frequency",'FontSize',12);  
ylabel("Amplitude",'FontSize',12);


N =length(Signal_1);      % same for the filtered Signal
X=fft(Signal_1,N);
f1=(-N/2:N/2-1)*fs/N;
figure();
plot(f1,abs(fftshift(X))/N);

title ("Filtered First Signal");
xlabel("Frequency",'FontSize',12);  
ylabel("Amplitude",'FontSize',12);


N2 =length(Signal_2);
X2=fft(Signal_2,N2);
f2=(-N2/2:N2/2-1)*fs2/N2;
figure();
plot(f2,abs(fftshift(X2))/N2);

title ("Filtered Second Signal");
xlabel("Frequency",'FontSize',12);  
ylabel("Amplitude",'FontSize',12);


%% Modulation 

A=1;                                    %Carry amplitude
fc1=5500;                               %Carry frequency
fc2=16000;                              %Carry frequency
ts=1/fs;                                %Sample period           
t=(0:ts:(N-1)*ts);                      %Time vector
f=(-fs/2:fs/N:fs/2-fs/N);               %Frequency vector 
Carry_1=A*transpose(cos(2*pi*fc1*t));   %Carry making
Carry_2=A*transpose(cos(2*pi*fc2*t));
modulate=Signal_1.*Carry_1 +Signal_2 .*Carry_2; % creat the modulated signal
% we make transpose to make the signal and the carry with the same dimention
% to make it avilable to muliply them elements by elements                   
figure();
plot(f2,abs(fftshift(fft(modulate)))/N2);

title ("Modulated Signals");
xlabel("Frequency",'FontSize',12);  
ylabel("Amplitude",'FontSize',12);

figure();


xft=fft(Carry_1)+fft(Carry_2);             %Fourier transform
plot(f,fftshift(abs(xft)));         %plot carry in frequency domain
title ("carry in Freq domain");
xlabel("Frequency",'FontSize',10);  
ylabel("Amplitude",'FontSize',10);


%% Demodulation

Recived_Signal_1=filter(BandFilter1,modulate);      % filtering bandpass
Recived_Signal_1=Carry_1.*(Recived_Signal_1)*2; % demoulating by multipling by the carry again
Recived_Signal_1=filter(Hd,Recived_Signal_1);       % lowpass filter to get the signal    

figure();
plot(f2,abs(fftshift(fft(Recived_Signal_1)))/N);
title ("Recived signal_1 in Freq domain");           %ploting the signal in freq. domain
xlabel("Frequency",'FontSize',10);  
ylabel("Amplitude",'FontSize',10);

figure();
plot(t,Recived_Signal_1/N);
title ("Recived signal_1 in time domain");           %ploting the signal in time domain
xlabel("time",'FontSize',10);  
ylabel("Amplitude",'FontSize',10);

Recived_Signal_2=filter(BandFilter2,modulate);
Recived_Signal_2=Carry_2.*(Recived_Signal_2)*2;
Recived_Signal_2=filter(Hd,Recived_Signal_2);

figure();
plot(f2,abs(fftshift(fft(Recived_Signal_2)))/N2)
title ("Recived signal_2 in Freq domain");
xlabel("Frequency",'FontSize',10);  
ylabel("Amplitude",'FontSize',10);

figure();
plot(t,Recived_Signal_2/N);
title ("Recived signal_2 in time domain");           %ploting the signal in time domain
xlabel("time",'FontSize',10);  
ylabel("Amplitude",'FontSize',10);

audiowrite('Output1.wav',Recived_Signal_1,fs);
audiowrite('Output2.wav',Recived_Signal_2,fs2);  %save the output audio




sound (Recived_Signal_1,fs,16);     %play the audio
pause(12);
sound (Recived_Signal_2,fs2,16);
pause(12);



