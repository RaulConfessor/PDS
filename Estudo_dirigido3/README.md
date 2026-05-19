# Estudo Dirigido – Parte 3
**Disciplina:** Processamento Digital de Sinais  
**Instituição:** Instituto Federal da Paraíba – IFPB  
**Curso:** Engenharia da Computação / Telemática  

---

## Descrição

Esta etapa do estudo dirigido aborda a análise de sinais discretos no domínio da frequência. Os conteúdos trabalhados incluem a Transformada de Fourier em Tempo Discreto (DTFT), a Transformada Discreta de Fourier (DFT), o algoritmo FFT, a Transformada-Z, o fenômeno de aliasing e o janelamento espectral.

As atividades foram desenvolvidas com simulações computacionais em MATLAB, com apresentação dos códigos, gráficos gerados e discussão técnica dos resultados.

---

## Estrutura do Repositório

```
/
├── teorico.pdf           # Resumo teórico individual sobre os conteúdos da Parte 3
├── /simulacoes           # Códigos MATLAB comentados das 10 questões
└── /resultados           # Gráficos e espectros gerados pelas simulações
```

---

## Simulações Desenvolvidas

| Questão | Tema |
|---------|------|
| 1 | FFT de senoide discreta com f₀ = 0,1 e N = 128 |
| 2 | Separação de duas componentes em frequência via FFT |
| 3 | Demonstração do fenômeno de aliasing |
| 4 | Comparação entre espectro sem janela e com janela de Hamming |
| 5 | Análise espectral de sinal senoidal com ruído aditivo |
| 6 | DFT calculada pela definição matemática vs função `fft()` |
| 7 | Resposta ao impulso e estabilidade de H(z) = 1/(1 − 0,8z⁻¹) |
| 8 | Influência do número de amostras na resolução espectral |
| 9 | Identificação de frequência fundamental e harmônico |
| 10 | Análise espectral de sinal de vibração mecânica simulada |

---

## Ferramentas Utilizadas

- MATLAB
- Funções nativas: `fft()`, `stem()`, `hamming()`, `plot()`

---

## Conteúdos Abordados

- Transformada de Fourier em Tempo Discreto (DTFT)
- Transformada Discreta de Fourier (DFT)
- Algoritmo FFT e importância computacional
- Transformada-Z e análise de estabilidade
- Aliasing e Teorema de Nyquist
- Janelamento e vazamento espectral
