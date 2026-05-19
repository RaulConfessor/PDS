% Parametros do sinal original
fs_original = 1000;   % Hz
fs_reduzida  = 300;   % Hz (abaixo de Nyquist para f = 200 Hz)
f_sinal      = 200;   % Hz - frequencia do sinal

% Sinal com taxa original
t1 = 0 : 1/fs_original : 1 - 1/fs_original;
x1 = sin(2 * pi * f_sinal * t1);

% Sinal com taxa reduzida (aliasing)
t2 = 0 : 1/fs_reduzida : 1 - 1/fs_reduzida;
x2 = sin(2 * pi * f_sinal * t2);

% FFT de ambos
N1     = length(x1);
X1_mag = abs(fft(x1)) / N1;
f1_ax  = (0:N1-1) * fs_original / N1;

N2     = length(x2);
X2_mag = abs(fft(x2)) / N2;
f2_ax  = (0:N2-1) * fs_reduzida / N2;

% --- Graficos ---
figure('Name', 'Questao 3 - Aliasing');

subplot(2, 2, 1);
plot(t1(1:100), x1(1:100));
title(sprintf('Sinal Original  (fs = %d Hz)', fs_original));
xlabel('Tempo (s)'); ylabel('Amplitude'); grid on;

subplot(2, 2, 2);
stem(f1_ax(1:N1/2), X1_mag(1:N1/2), 'filled', 'MarkerSize', 3);
title('Espectro - Taxa Original');
xlabel('Frequencia (Hz)'); ylabel('Magnitude'); grid on;

subplot(2, 2, 3);
plot(t2(1:30), x2(1:30));
title(sprintf('Sinal com Taxa Reduzida  (fs = %d Hz)', fs_reduzida));
xlabel('Tempo (s)'); ylabel('Amplitude'); grid on;

subplot(2, 2, 4);
stem(f2_ax(1:N2/2), X2_mag(1:N2/2), 'filled', 'MarkerSize', 3);
title('Espectro - Taxa Reduzida (Aliasing)');
xlabel('Frequencia (Hz)'); ylabel('Magnitude'); grid on;

fprintf('Questao 3: Sinal de %d Hz amostrado a %d Hz gera alias em %d Hz\n', ...
    f_sinal, fs_reduzida, abs(f_sinal - fs_reduzida));

