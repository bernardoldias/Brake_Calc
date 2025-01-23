# Código de Simulação de Freios em MATLAB 

Este repositório contém um código desenvolvido em MATLAB para simular o comportamento de um sistema de freios automotivo. O script calcula diversos parâmetros relacionados ao desempenho do sistema de frenagem e gera gráficos úteis para análise, como o diagrama de travamento das rodas e a transferência de carga.

## 📋 Funcionalidades

- **Cálculo do torque de frenagem**: Dianteiro e traseiro, considerando força aplicada no pedal, bias e propriedades do sistema de freios.
- **Análise de travamento das rodas**: Verifica se o sistema entra em condição de travamento.
- **Transferência de carga**: Determina como a aceleração influencia na distribuição de carga entre os eixos dianteiro e traseiro.
- **Geração de gráficos**:
  - Diagrama de travamento das rodas.
  - Gráfico de transferência de carga.

## 🛠 Estrutura do Código

O código está organizado nas seguintes seções:
1. **Inicialização**: Configuração inicial e carregamento das variáveis do arquivo `variaveis.m`.
2. **Forças aplicadas pelo piloto**: Cálculo das forças e pressões nos cilindros mestre e nos discos de freio.
3. **Torque de frenagem no pneu**: Determinação do torque máximo disponível com base na força de frenagem máxima.
4. **Transferência de carga**: Cálculo das cargas dinâmicas nos eixos durante a frenagem.
5. **Geração de gráficos**: Visualização dos resultados em dois gráficos principais.
6. **Verificação de travamento**: Determina se o sistema de freios está em condição de travamento.

## 📊 Gráficos Gerados

- **Diagrama de Travamento das Rodas**: Relaciona a força aplicada no pedal com os torques de frenagem dianteiro e traseiro, além do torque máximo permitido pelo pneu.
- **Gráfico de Transferência de Carga**: Mostra como a aceleração afeta a carga nos eixos dianteiro e traseiro.

## 🚀 Como Executar

1. Certifique-se de ter o MATLAB instalado no seu computador.
2. Clone este repositório:
   ```bash
   git clone https://github.com/bernardoldias/Brake_Calc.git
3. Certifique-se de que o arquivo variaveis.m está configurado corretamente com os parâmetros do sistema de freios.
4. Execute o script principal: brake_calc

   
Os gráficos gerados serão salvos automaticamente como imagens no formato .png (ex.: travaBias.png e transferencia.png).


