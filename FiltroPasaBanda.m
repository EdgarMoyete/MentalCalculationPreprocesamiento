%Edgar Moises Hernandez-Gonzalez
%30/04/20-02/05/20
%Filtro pasa banda de 8-30hz
%Se filtraran todas las señales con un solo comando

clear
clc

%cambiar sujeto y sesion
load('MC15RMFH-03.mat')
fs = 512;

signals_filtradas = bandpass(union, [8 30], fs);

%cambiar sujeto y sesion
save('Filtra15RMFH-3.mat','signals_filtradas');