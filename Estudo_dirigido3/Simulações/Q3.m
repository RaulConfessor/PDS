N  = 64;
f0 = 0.1;
n  = 0:N-1;

% Sinal base
x = sin(2 * pi * f0 * n);

% Janela de Hamming
w = hamming(N)';

% FFT sem e com janela
X_sem    = abs(fft(x, N));
X_com    = abs(fft(x .* w, N));
X_sem    = X_sem / max(X_sem);
X_com    = X_com / max(X_com);

f = (0:N-1) / N;

% --- Graficos ---
figure('Name', 'Questao 4 - Janelamento');

subplot(2, 2, 1);
stem(n, x, 'filled', 'MarkerSize', 3);
title('Sinal sem Janela');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(2, 2, 2);
stem(n, x .* w, 'filled', 'MarkerSize', 3);
title('Sinal com Janela de Hamming');
xlabel('n'); ylabel('Amplitude'); grid on;

subplot(2, 2, 3);
stem(f(1:N/2), X_sem(1:N/2), 'filled', 'MarkerSize', 3);
title('Espectro sem Janela (Vazamento Espectral)');
xlabel('Frequencia Normalizada'); ylabel('Magnitude Norm.'); grid on;

subplot(2, 2, 4);
stem(f(1:N/2), X_com(1:N/2), 'filled', 'MarkerSize', 3);
title('Espectro com Janela de Hamming (Reduzido Vazamento)');
xlabel('Frequencia Normalizada'); ylabel('Magnitude Norm.'); grid on;
