clc;
close all;
clear;

run('variaveis.m')
global arc afc Pr Fd asf asr ub rbf rbr fx1 scf rr hcg wb balance_bar Fx Fz m cgx g

%% o que vem do piloto
fb = Pr*Fd; %força no bias [N]
ffc = fb*balance_bar;   %força no cilindro mestre da dianteira [N]
frc = fb-ffc; %força no cilindro mestre da traseira [N]
pbf=ffc/afc; %pressão na linha dianteira [N/mm²]
pbr=frc/arc; %pressão na linha traseira [N/mm²] 
pbf2 = pbf*10; %conversão para bar
pbr2 = pbr*10; %conversão para bar
fcf = pbf *asf; %clamping force front [N]
fcr = pbr*asr; %clamping force rear [N]
variavel1= (rbf*ub*2);
variavel2=(rbr*ub*2);
Tbf = fcf*variavel1/1000; %torque de frenagem dianteira do piloto[N*mm]
Tbr = variavel2*fcr/1000; %torque de frenagem traseira do piloto [N*mm]
bb = Tbf./(Tbf+Tbr); %brake bias

%% sugestão derek

pdiscf = fcf/asf; %pressão no disco dianteiro
pdiscr = fcr/asr; %pressão no disco traseiro
%% o que vem do pneu

fp = fx1*scf; %força máxima de frenagem com scaling factor (12psi)[N]
Tfp = 2*fp*rr/1000; %torque de frenagem máximo do pneu [N*mm]
Tfp2 = Tfp*ones(1,501);

%dianteiro
fp3 = fx3*scf; %força máxima de frenagem com scaling factor (12psi)[N]
Tfp3 = 2*fp3*rr/1000; %torque de frenagem máximo do pneu [N*mm]
Tfp4 = Tfp3*ones(1,501);

%% Load transfer
hcg2 = hcg/1000;
wb2 = wb/1000;
fp2 = 4*Fx*scf; %força máxima de frenagem com scaling factor [N]
a2 = fp2/(m*g);

lt = a2*hcg2*m*g/wb2;
EB = m*g*cgx;
EA = m*g- EB;
EAD = EA+lt;
EBD = EB-lt;
%% prints

figure(1)
plot(Fd,Tbf,'r-',LineWidth=1.5,DisplayName='Torque pneu dianteira')
xlabel('Força aplicada no pedal [N]','FontSize',15)
ylabel('Torque na roda [Nm]','FontSize',15)
hold on
plot(Fd,Tbr,'b-',LineWidth=1.5,DisplayName='Torque pneu traseira')
hold on
plot(Fd, Tfp2,'k--',LineWidth=1.5,DisplayName='Torque máximo do pneu dianteiro')
hold on
plot(Fd, Tfp4,'g--',LineWidth=1.5,DisplayName='Torque máximo do pneu traseiro')
legend('Location','Best')
title('Diagrama de Travamento das Rodas','FontSize',20)

figure(2)
plot(a2,EAD,'r-',LineWidth=1.5,DisplayName='Carga eixo dianteiro')
hold on
plot (a2, EBD,'b-',LineWidth=1.5,DisplayName='Carga eixo traseiro')
legend('Location','Best')
xlabel('Aceleração [m/s²]','FontSize',15)
ylabel('Carga no eixo [N] ','FontSize',15)
xlim([0 1.5])
title('Gráfico de Transeferência de Carga','FontSize',20)

%% results

 Tbf2 = Tbf(501);
 Tbr2 = Tbr(501);
if Tbf2> Tfp && Tbr2> Tfp
    a = ('TRAVA');
else
    a = ('NÃO TRAVA');
end    

saveas(figure(1),'travaBias.png')
saveas(figure(2),'transferencia.png')