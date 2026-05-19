%% H(z) = 1 / (1 - 0.8*z^-1) - Resposta ao impulso e estabilidade

% Coeficientes do filtro IIR: b = [1], a = [1, -0.8]
b = [1];
a = [1, -0.8];

N  = 40;
h  = impz(b, a, N);   % Resposta ao impulso
n  = 0:N-1;

% --- Grafico ---
figure('Name', 'Questao 7 - Resposta ao Impulso H(z)');

subplot(2, 1, 1);
stem(n, h, 'filled', 'MarkerSize', 4);
title('Resposta ao Impulso  H(z) = 1 / (1 - 0{,}8z^{-1})');
xlabel('n'); ylabel('h[n]'); grid on;

subplot(2, 1, 2);
zplane(b, a);
title('Diagrama de Polos e Zeros (plano-Z)');

% Verificacao de estabilidade: polo em z = 0.8 (dentro do circulo unitario)
polo = roots(a);
fprintf('Questao 7: Polo em z = %.2f\n', polo);
if abs(polo) < 1
    fprintf('Sistema ESTAVEL: |polo| = %.2f < 1 (dentro do circulo unitario)\n', abs(polo));
else
    fprintf('Sistema INSTAVEL: |polo| = %.2f >= 1\n', abs(polo));
end
