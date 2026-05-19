%% Sinal senoidal com ruido aditivo - analise espectral

clc; clear; close all;

N   = 256;
f0  = 0.15;
SNR = 10; % dB
n   = 0:N-1;

% Sinal puro + ruido gaussiano
x_puro = sin(2 * pi * f0 * n);
ruido  = randn(1, N) * 10^(-SNR/20);
x      = x_puro + ruido;

% FFT
X_mag      = abs(fft(x, N)) / N;
X_puro_mag = abs(fft(x_puro, N)) / N;
f          = (0:N-1) / N;

% --- Graficos ---
figure('Name', 'Questao 5 - Sinal com ruido');

subplot(3, 1, 1);
plot(n, x);
title('Sinal com Ruido Aditivo no Dominio do Tempo');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(3, 1, 2);
stem(f(1:N/2), X_puro_mag(1:N/2), 'filled', 'MarkerSize', 3);
title('Espectro do Sinal Puro (referencia)');
xlabel('Frequencia Normalizada'); ylabel('Magnitude'); grid on;

subplot(3, 1, 3);
stem(f(1:N/2), X_mag(1:N/2), 'filled', 'MarkerSize', 3);
title('Espectro do Sinal com Ruido');
xlabel('Frequencia Normalizada'); ylabel('Magnitude'); grid on;

[~, idx] = max(X_mag(1:N/2));
fprintf('Questao 5: Pico espectral identificado em f = %.4f\n', f(idx));
