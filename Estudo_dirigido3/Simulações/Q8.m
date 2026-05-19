%% Sinal com frequencia fundamental + harmonico
%% Diagnostico de vibracao mecanica
%% ============================================================
clc; clear; close all;

N  = 256;
f1 = 0.1;    % Frequencia fundamental
f2 = 0.2;    % 2o harmonico (o dobro da fundamental)
n  = 0:N-1;

% Sinal com fundamental e harmonico
x = sin(2 * pi * f1 * n) + 0.5 * sin(2 * pi * f2 * n);

% FFT
X_mag = abs(fft(x, N)) / N;
f     = (0:N-1) / N;

% --- Graficos ---
figure('Name', 'Questao 9 - Fundamental e Harmonico');

subplot(2, 1, 1);
plot(n, x);
title('Sinal com Fundamental (f_1=0,1) e Harmonico (f_2=0,2)');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(2, 1, 2);
stem(f(1:N/2), X_mag(1:N/2), 'filled', 'MarkerSize', 3);
title('Espectro de Magnitude - Identificacao de Harmonicos');
xlabel('Frequencia Normalizada'); ylabel('Magnitude');
xline(f1, '--r', 'Fundamental', 'LabelVerticalAlignment', 'bottom');
xline(f2, '--b', '2o Harmonico', 'LabelVerticalAlignment', 'bottom');
grid on;

fprintf('Questao 9: Fundamental em f = %.1f | Harmonico em f = %.1f\n', f1, f2);
