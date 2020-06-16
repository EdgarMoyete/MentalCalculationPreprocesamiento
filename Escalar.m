%Edgar Moises Hernandez-Gonzalez
%15/06/20
%Escalar (restar la media y dividir entre la desviacion estandar)
%Graficar antes y despues de escalado
%canal C4 es el 19
%muestra 1 es calculo mental para el sujeto 10, sesion 1
%muestra 6 es descanso para el sujeto 10, sesion 1

clear
clc

%cambiar sujeto y sesion
load('MC_CAR_15_3.mat');

%std(car,1) el 1 es porque la std es de poblacion y no de muestra
escalar = (car-mean(car))./std(car,1);

%cambiar sujeto y sesion
save('MC_escalado_15_3.mat','escalar');

% Esto es para graficar la diferencia de la senal
% c4 = car(6721:8064,19); %muestra 1=1:1344, 6=6720:8064
% plot(c4,'LineWidth',1);
% hold on
% c4_escalar = escalar(6721:8064,19); %muestra 1=1:1344, 6=6720:8064
% plot(c4_escalar,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4 CAR','C4 Escalado');
% hold off