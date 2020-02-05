%{ 
 ref:
 https://www.mathworks.com/matlabcentral/answers/22112-how-to-plot-wav-file
 https://www.mathworks.com/help/matlab/ref/audioread.html
%}

clear all;
close all;

%% read in audio & initialize parameters
[t,y,fs] = read_audio('data/trail1_1.m4a');
[t,y,fs] = trim_audio(t,y,fs);
% [t,y] = trim_audio_specific(t,y,18000,20000);


% plotting
% fourier_approx(t,y,fs);
% sin_approx(t,y);
% all_subplots(t,y,fs, L, y_fft);
% plot_all_trails();
% fitting_data(t,fs);
plot_major_terms();

%% helper functions

function plot_major_terms()
    model = @(x, a1,b1,c1,a2,b2,c2,a3,b3,c3,a4,b4,c4) ...
            a1*sin(b1*x+c1) + a2*sin(b2*x+c2) + a3*sin(b3*x+c3) + a4*sin(b4*x+c4);
    
    fplot(@(t) model(t,0.03579, 63.74, 1.15,0,73.48,-3.032,0.03317,52.23, 3.428,0,73.5,0.07624 ),'r');
    hold on
    fplot(@(t) model(t,0.03015,58.44,1.771 ,0.0281 , 67.01, -0.5688 ,0.02931,39.42,1.405 ,0.02912,31.18, -3.295),'g');
    fplot(@(t) model(t, 0.02183,81.56,1.664,0,58.63,4.277,0,58.56, -5.025,0.02067,48.7,-0.6374),'b');
    xlim([0 2]);legend('25ml','20ml','30ml');xlabel('Seconds'); ylabel('Amplitude'); 
end

function fitting_data(t,fs)
    model = @(x, a1,b1,c1,a2,b2,c2,a3,b3,c3,a4,b4,c4,a5,b5,c5,a6,b6,c6,a7,b7,c7,a8,b8,c8) ...
            a1*sin(b1*x+c1) + a2*sin(b2*x+c2) + a3*sin(b3*x+c3) + a4*sin(b4*x+c4) + ...
            a5*sin(b5*x+c5) + a6*sin(b6*x+c6) + a7*sin(b7*x+c7) + a8*sin(b8*x+c8);

    fit1_1 = [0.04567, 63.56, 0.8288 , 0.03803, 80.87, -0.6849, 2.824,55.44,-2.685,0.01935,67.84,...
        -3.476, 0.04224,61.16,1.476,0.0313,44.48,2.361,2.821,55.47, 0.4207,0.0244,84.43,2.721];
    fit1_2 = [0.04377,64.28,0.4241,3.645,73.67,-3.175, 0.03412,52.16,3.618,3.643,73.69,-0.05854,...
        0.0337,66.14,0.8657,0.02665,116.9,0.4682, 0.02242 ,57.97,2.627,0.02454,197.4,2.061 ];
    fit1_3 = [7.447,95.86,0.5538,0.03644,135.7,0.5111,0.03173,107.9 ,-1.324,0.02891, 194.8, -0.2652,...
        0.03849,117.2,-1.289,7.43, 95.87,3.683,0.02672,82.33,-1.497, 0.03297,113.3,-1.728];
    fit2_1 = [0.03558, 56.82,0.3658,0.03393,101.7,1.152,0.03817,75.48,-2.345,0.03249, 47.86,1.424,...
        0.0354,87.68,3.632,0.02997,126.6,0.6918, 0.0295,33.88,-2.397,0.02524,42.01,-3.762];
    fit2_2 = [0.03019,58.04, 2.092,3.017, 68.03,-2.366,0.0293,39.34, 1.425,0.02818,30.76,-3.041...
        ,0.02544, 25.15,-1.43,3.011,68.05,0.7478,0.02643,44.89,0.2291,0.02402,122 , -0.4068];
    fit2_3 = [0.03019,58.04, 2.092,3.017,68.03,-2.366,0.0293,39.34,1.425,0.02818,30.76, -3.041...
        ,0.02544,25.15,-1.43, 3.011 , 68.05,0.7478, 0.02643,44.89,0.2291,0.02402,122,-0.4068 ];
    fit3_1 = [ 0.04308,52.71,-0.107,0.03606,152.9,-2.797,0.0323,66.02, -0.1352,0.03391,104.7, ...
        0.008657,0.03104,147.5, -0.6179,0.02967, 49.83,1.891,0.03036,44.46,-2.784,0.03009,112.7 ,-3.031 ];
    fit3_2 = [ 0.009235,28.32, -0.6547,0.7013,32.43,-0.1106,0.009581,44.61, -2.604,0.7005,32.4,...
        -3.212,0.007895,25.75,0.6238,0.8958,52.15,-1.38,0.8948,52.17,1.734,0.006301,39.86,2.652];
    fit3_3 = [0.02291,81.55,1.629,0.01427,59.73,2.496,1.068,55.63,-0.8634,0.02062,48.86,-0.9306,1.07,...
        55.59, -3.948,0.02008,76.35,2.914,0.2265,64.24,2.257, 0.2238,64.09, -0.6156];
    %sanity check
%     fprintf('%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f',length(fit1_1),length(fit1_2),length(fit1_3),length(fit2_1),length(fit2_2),length(fit2_3),length(fit3_1),length(fit3_2),length(fit3_3))

    fplot(@(t) model(t,0.03558, 56.82,0.3658,0.03393,101.7,1.152,0.03817,75.48,-2.345,0.03249, 47.86,1.424,...
        0.0354,87.68,3.632,0.02997,126.6,0.6918, 0.0295,33.88,-2.397,0.02524,42.01,-3.762),'r');
%     fplot(@(t) model(t,0.03019,58.04, 2.092,3.017, 68.03,-2.366,0.0293,39.34, 1.425,0.02818,30.76,-3.041...
%         ,0.02544, 25.15,-1.43,3.011,68.05,0.7478,0.02643,44.89,0.2291,0.02402,122 , -0.4068),'g');
%     fplot(@(t) model(t,0.03019,58.04, 2.092,3.017,68.03,-2.366,0.0293,39.34,1.425,0.02818,30.76, -3.041...
%         ,0.02544,25.15,-1.43, 3.011 , 68.05,0.7478, 0.02643,44.89,0.2291,0.02402,122,-0.4068),'g');
%    
%     fplot(@(t) model(t,0.04567, 63.56, 0.8288 , 0.03803, 80.87, -0.6849, 2.824,55.44,-2.685,0.01935,67.84,...
%         -3.476, 0.04224,61.16,1.476,0.0313,44.48,2.361,2.821,55.47, 0.4207,0.0244,84.43,2.721),'r');
    hold on 
    fplot(@(t) model(t,0.04377,64.28,0.4241,3.645,73.67,-3.175, 0.03412,52.16,3.618,3.643,73.69,-0.05854,...
        0.0337,66.14,0.8657,0.02665,116.9,0.4682, 0.02242 ,57.97,2.627,0.02454,197.4,2.061 ),'g');
%     fplot(@(t) model(t,7.447,95.86,0.5538,0.03644,135.7,0.5111,0.03173,107.9 ,-1.324,0.02891, 194.8, -0.2652,...
%         0.03849,117.2,-1.289,7.43, 95.87,3.683,0.02672,82.33,-1.497, 0.03297,113.3,-1.728),'r');
%     
%     
%
%     fplot(@(t) model(t,0.04308,52.71,-0.107,0.03606,152.9,-2.797,0.0323,66.02, -0.1352,0.03391,104.7, ...
%         0.008657,0.03104,147.5, -0.6179,0.02967, 49.83,1.891,0.03036,44.46,-2.784,0.03009,112.7 ,-3.031 ),'b');
%     fplot(@(t) model(t, 0.009235,28.32, -0.6547,0.7013,32.43,-0.1106,0.009581,44.61, -2.604,0.7005,32.4,...
%         -3.212,0.007895,25.75,0.6238,0.8958,52.15,-1.38,0.8948,52.17,1.734,0.006301,39.86,2.652),'b');
    fplot(@(t) model(t,0.02291,81.55,1.629,0.01427,59.73,2.496,1.068,55.63,-0.8634,0.02062,48.86,-0.9306,1.07,...
        55.59, -3.948,0.02008,76.35,2.914,0.2265,64.24,2.257, 0.2238,64.09, -0.6156),'b');
    
    xlim([0 2]);legend('25ml','20ml','30ml');xlabel('Seconds'); ylabel('Amplitude'); 
    
    y1 = model(t, 0.009235,28.32, -0.6547,0.7013,32.43,-0.1106,0.009581,44.61, -2.604,0.7005,32.4,...
        -3.212,0.007895,25.75,0.6238,0.8958,52.15,-1.38,0.8948,52.17,1.734,0.006301,39.86,2.652);
    play_sound(y1,fs);
    audiowrite('testout.wav',1000*y1,fs);
    
end

function sin_approx(t,y)
    % fit the data's larger patterns
    load enso;
    subplot(2,1,1)
%     plot(t,y, 'b-'); 
    hold on
    f = fit( t', y, 'fourier4'); plot(f,t,y); %fit data with fourier - sin+cos
    xlabel('Seconds'); ylabel('Amplitude'); 
    
    subplot(2,1,2);
    f1 = fit( t', y, 'sin8'); %fit data with only sin functions
    plot(f1,t',y);xlabel('Seconds'); ylabel('Amplitude'); %legend('data','sin');

     %     disp(f1);
end

function [t,y,fs] = read_audio(filename)
    %{
      @param: filename - a directory under this folder
      @return: t - time, y - amplitude, fs - a sample frequency for that data
      read in an audio file as a number array
    %}
    load handel.mat
    [y,fs] = audioread(filename);
    y = y(:,1); %only get the first channel
    dt = 1/fs;  %period
    t = 0:dt:(length(y)*dt)-dt; %seconds vector
end

function [t,y,fs] = trim_audio(t,y,fs)
    %{
      @param:  t - time, y - amplitude, fs - a sample rate(freq) for that data
      @return: t,y,fs, the trimmed version
      cut the audio so that the small amplitude wave segment will be
      removed
    %}
    thresh = 10e-3;
    start = 0; ending = 0;
    for i = 1:length(y)
        if abs(y(i)) > thresh
            start = i;
            break
        end
    end
    for i = length(y):-1:1
        if abs(y(i)) > thresh
            ending = i;
            break
        end
    end
%     fprintf('%.4f,%.4f ', t(start), t(ending)); % sanity check
%     [t,y] = trim_audio_specific(t,y,start,ending);
    adjust_val = t(start-1);
    t = t(start:ending);
    y = y(start:ending);
    t = t-adjust_val; %adjust the starting time of t to 0
end

function [t,y] = trim_audio_specific(t,y,start,ending)
    adjust_val = t(start-1);
    t = t(start:ending);
    y = y(start:ending);
    t = t-adjust_val; %adjust the starting time of t to 0
end

function player = play_sound(y,fs)
    %{
     @param: y,fs
     call the built-in player
    %}
    player = audioplayer(y, fs);
    sound(y,fs); %play the sound
end

function plot_all_trails()
    [t,y,fs] = read_audio('data/trail2_2.m4a');
    [t,y,fs] = trim_audio(t,y,fs);
    [t1,y1,fs1] = read_audio('data/trail1_1.m4a');
    [t1,y1,fs1] = trim_audio(t1,y1,fs1);
    [t2,y2,fs2] = read_audio('data/trail3_3.m4a');
    [t2,y2,fs2] = trim_audio(t2,y2,fs2);
%     subplot(3,1,1)
    plot1 = plot(t,y,'g'); xlabel('Seconds'); ylabel('Amplitude'); 
%     subplot(3,1,2)
    hold on
    plot2 = plot(t1,y1,'r'); xlabel('Seconds'); ylabel('Amplitude'); 
%     subplot(3,1,3)
    plot3 = plot(t2,y2,'b'); xlabel('Seconds'); ylabel('Amplitude');
    legend('20ml','25ml','30ml');
    % play_sound(y,fs)
    % play_sound(y1,fs1)
    % play_sound(y2,fs2)
end

function all_subplots(t,y,fs, L, y_fft) 
    fig = figure;
    %plot the waveform amplititude
    sub1 = subplot(3,1,1);
    plot1 = plot(t,y); xlabel('Seconds'); ylabel('Amplitude'); 

    %plot the frequency/power
    sub2 = subplot(3,1,2);
    plot(psd(spectrum.periodogram,y,'Fs',fs,'NFFT',L)); 

    %plot the fft
    sub3 = subplot(3,1,3); 
    freq = (0:L-1)*50/L;
    plot(freq,abs(y_fft));xlabel('f (Hz)');ylabel('|P1(f)|');
    title('Single-Sided Amplitude Spectrum of S(t)');

end

function [F,P1,P2,freq] = fourier_approx(t,y,fs)
    T = 1/fs;  %- Sampling period  
    L = length(y); %- Length of signal
    y_fft = fft(y);

    P2 = abs(y_fft/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    freq = fs*(0:(L/2))/L;
    F = zeros(1,L);
    for n = 1:100
       w = (pi*n)/T;
       F = F +  P1(n).*sin(w.*t)+ P2(n).*cos(w.*t); 
    end
    % plot(t,F,'linewidth',1.5,'color','r')
    % hold on
    % play_sound(F,fs)
end


