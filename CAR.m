%Edgar Moises Hernandez-Gonzalez
%14/06/20-15/06/20
%CAR (common average reference)
%Graficar antes y despues del CAR
%canal C4 es el 19
%muestra 1 es calculo mental para el sujeto 10, sesion 1
%muestra 6 es descanso para el sujeto 10, sesion 1

clear
clc

%cambiar sujeto y sesion
load('MC15RMFH-03.mat');

promedio = mean(union,2);
car = union-promedio;
%cambiar sujeto y sesion
save('MC_CAR_15_3.mat','car');

% Esto es para graficar la diferencia de la senal al aplicar CAR
% c4 = union(6721:8064,19); %muestra 1=1:1344, 6=6720:8064
% plot(c4,'LineWidth',1);
% hold on
% c4_car = car(6721:8064,19); %muestra 1=1:1344, 6=6720:8064
% plot(c4_car,'LineWidth',1);
% grid;
% xlabel('Time');
% ylabel('Amplitude');
% legend('C4','C4 CAR');
% hold off