%% DFT direta (definicao) vs funcao fft()
%% Comparacao de resultados e custo computacional
%% ============================================================
clc; clear; close all;

% Sinal curto para DFT direta
x = [1 2 3 4 3 2 1];
N = length(x);

% DFT direta pela definicao matematica
X_direta = zeros(1, N);
for k = 0:N-1
    for n_idx = 0:N-1
        X_direta(k+1) = X_direta(k+1) + x(n_idx+1) * exp(-1j * 2 * pi * k * n_idx / N);
    end
end

% FFT via funcao built-in
X_fft = fft(x);

% Comparacao dos resultados
fprintf('\nQuestao 6 - Comparacao DFT direta vs fft():\n');
fprintf('%-5s  %-25s  %-25s\n', 'k', 'DFT Direta (mag)', 'fft() (mag)');
for k = 1:N
    fprintf('%-5d  %-25.6f  %-25.6f\n', k-1, abs(X_direta(k)), abs(X_fft(k)));
end

% Medicao de tempo (sinal maior para evidenciar diferenca)
x_grande = rand(1, 1024);
N_g      = length(x_grande);

tic;
X_d = zeros(1, N_g);
for k = 0:N_g-1
    for n_idx = 0:N_g-1
        X_d(k+1) = X_d(k+1) + x_grande(n_idx+1) * exp(-1j*2*pi*k*n_idx/N_g);
    end
end
t_direta = toc;

tic;
fft(x_grande);
t_fft = toc;

fprintf('\nCusto computacional para N = 1024:\n');
fprintf('DFT direta: %.4f s\n', t_direta);
fprintf('fft():      %.6f s\n', t_fft);
fprintf('FFT e %.1f x mais rapida\n', t_direta / t_fft);

% Grafico comparativo
figure('Name', 'Questao 6 - DFT direta vs fft');
k_axis = 0:N-1;
subplot(2,1,1);
stem(k_axis, abs(X_direta), 'r', 'filled', 'MarkerSize', 5);
title('Magnitude - DFT Direta');
xlabel('k'); ylabel('|X[k]|'); grid on;

subplot(2,1,2);
stem(k_axis, abs(X_fft), 'b', 'filled', 'MarkerSize', 5);
title('Magnitude - fft()');
xlabel('k'); ylabel('|X[k]|'); grid on;
