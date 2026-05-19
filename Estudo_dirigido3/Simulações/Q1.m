N  = 128;
f1 = 0.1;
f2 = 0.3;
n  = 0:N-1;

% Geracao dos sinais individuais e do sinal somado
x1 = sin(2 * pi * f1 * n);
x2 = sin(2 * pi * f2 * n);
x  = x1 + x2;

% FFT do sinal somado
X     = fft(x, N);
X_mag = abs(X) / N;
f     = (0:N-1) / N;

% --- Graficos ---
figure('Name', 'Questao 2 - Soma de duas senoides');

subplot(3, 1, 1);
stem(n, x, 'filled', 'MarkerSize', 3);
title('Sinal Somado no Dominio do Tempo  (f_1=0,1 + f_2=0,3)');
xlabel('Amostras (n)'); ylabel('Amplitude'); grid on;

subplot(3, 1, 2);
stem(f(1:N/2), X_mag(1:N/2), 'filled', 'MarkerSize', 3);
title('Espectro de Magnitude do Sinal Somado');
xlabel('Frequencia Normalizada'); ylabel('Magnitude'); grid on;

subplot(3, 1, 3);
stem(n, x1, 'r', 'filled', 'MarkerSize', 3); hold on;
stem(n, x2, 'b', 'filled', 'MarkerSize', 3);
legend('f_1 = 0,1', 'f_2 = 0,3');
title('Sinais Individuais no Dominio do Tempo');
xlabel('Amostras (n)'); ylabel('Amplitude'); grid on;

fprintf('Questao 2: O espectro apresenta dois picos em f = %.1f e f = %.1f\n', f1, f2);
