%% QUESTAO 7
%% H(z) = 1 / (1 - 0.8*z^-1) - Resposta ao impulso e estabilidade
clc; clear; close all;

N   = 40;
n   = 0:N-1;
a   = 0.8;

% Resposta ao impulso calculada manualmente: h[n] = 0.8^n * u[n]
h = a .^ n;

% --- Grafico 1: Resposta ao impulso ---
figure('Name', 'Questao 7 - Resposta ao Impulso H(z)');

subplot(2, 1, 1);
stem(n, h, 'filled', 'MarkerSize', 4);
title('Resposta ao Impulso  H(z) = 1 / (1 - 0.8z^{-1})');
xlabel('n'); ylabel('h[n]'); grid on;

% --- Grafico 2: Diagrama de polos e zeros manual ---
subplot(2, 1, 2);
theta = linspace(0, 2*pi, 300);
plot(cos(theta), sin(theta), 'k--'); hold on;  % circulo unitario
plot(a, 0, 'rx', 'MarkerSize', 12, 'LineWidth', 2); % polo
plot(0, 0, 'bo', 'MarkerSize', 8, 'LineWidth', 2);  % zero na origem
axlim = 1.5;
xlim([-axlim axlim]); ylim([-axlim axlim]);
xlabel('Real'); ylabel('Imaginario');
title('Diagrama de Polos (x) e Zeros (o) - Plano Z');
legend('Circulo Unitario', 'Polo', 'Zero', 'Location', 'northeast');
grid on; axis equal;

% Verificacao de estabilidade
fprintf('Questao 7: Polo em z = %.2f\n', a);
if abs(a) < 1
    fprintf('Sistema ESTAVEL: |polo| = %.2f < 1\n', abs(a));
else
    fprintf('Sistema INSTAVEL: |polo| = %.2f >= 1\n', abs(a));
end
