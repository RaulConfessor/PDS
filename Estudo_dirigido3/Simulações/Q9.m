%% Analise espectral de sinal real simulado
%% Vibracao mecanica com ruido
%% ============================================================
clc; clear; close all;

% Simulacao de um sinal de vibracao mecanica
% Ex: rolamento defeituoso com frequencia caracteristica de falha
fs    = 1000;            % Taxa de amostragem (Hz)
T     = 1;               % Duracao (s)
t     = 0 : 1/fs : T - 1/fs;

f_rot  = 50;   % Frequencia de rotacao (Hz) - 3000 RPM
f_falha = 120; % Frequencia caracteristica de falha (Hz)

% Sinal: rotacao + falha + ruido branco
sinal = 1.0 * sin(2*pi*f_rot  * t) + ...
        0.3 * sin(2*pi*f_falha * t) + ...
        0.5 * randn(size(t));

% FFT
N     = length(sinal);
X_mag = abs(fft(sinal)) / N;
f_ax  = (0:N-1) * fs / N;

% --- Graficos ---
figure('Name', 'Questao 10 - Vibracao Mecanica Simulada');

subplot(3, 1, 1);
plot(t, sinal);
title('Sinal de Vibracao no Dominio do Tempo');
xlabel('Tempo (s)'); ylabel('Amplitude (m/s^2)'); grid on;

subplot(3, 1, 2);
plot(f_ax(1:N/2), X_mag(1:N/2));
title('Espectro de Magnitude do Sinal de Vibracao');
xlabel('Frequencia (Hz)'); ylabel('Magnitude');
xline(f_rot,   '--r', sprintf('Rotacao: %d Hz', f_rot),   'LabelVerticalAlignment','bottom');
xline(f_falha, '--b', sprintf('Falha: %d Hz',   f_falha), 'LabelVerticalAlignment','bottom');
grid on;

% Aplicando janela de Hamming para melhorar o espectro
w      = hamming(N)';
X_jan  = abs(fft(sinal .* w)) / N;

subplot(3, 1, 3);
plot(f_ax(1:N/2), X_jan(1:N/2));
title('Espectro com Janela de Hamming (menor vazamento)');
xlabel('Frequencia (Hz)'); ylabel('Magnitude');
xline(f_rot,   '--r', sprintf('Rotacao: %d Hz', f_rot));
xline(f_falha, '--b', sprintf('Falha: %d Hz',   f_falha));
grid on;

fprintf('\nQuestao 10: Analise de vibracao mecanica simulada\n');
fprintf('Frequencia de rotacao: %d Hz (%.0f RPM)\n', f_rot, f_rot*60);
fprintf('Frequencia de falha identificada: %d Hz\n', f_falha);
fprintf('Interpretacao: o pico em %d Hz indica possivel defeito no rolamento\n', f_falha);
