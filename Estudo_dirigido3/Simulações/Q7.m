%% ============================================================
%% QUESTAO 1
%% Senoide discreta com f0 = 0.1, N = 128
%% Espectro via FFT e identificacao da frequencia dominante
%% ============================================================
clc; clear; close all;

N  = 128;
f0 = 0.1;
n  = 0:N-1;

% Geracao do sinal
x = sin(2 * pi * f0 * n);

% Calculo da FFT
X     = fft(x, N);
X_mag = abs(X) / N;

% Eixo de frequencia normalizada [0, 1)
f = (0:N-1) / N;

% --- Graficos ---
figure('Name', 'Questao 1 - FFT de senoide discreta');

subplot(2, 1, 1);
stem(n, x, 'filled', 'MarkerSize', 3);
title('Sinal no Dominio do Tempo  (f_0 = 0,1 | N = 128)');
xlabel('Amostras (n)');
ylabel('Amplitude');
grid on;

subplot(2, 1, 2);
stem(f, X_mag, 'filled', 'MarkerSize', 3);
title('Espectro de Magnitude (FFT)');
xlabel('Frequencia Normalizada (ciclos/amostra)');
ylabel('Magnitude');
xlim([0 0.5]);
grid on;

% Identificacao da frequencia dominante
[~, idx] = max(X_mag(1:N/2));
fprintf('Questao 1: Frequencia dominante identificada = %.4f\n', f(idx));
