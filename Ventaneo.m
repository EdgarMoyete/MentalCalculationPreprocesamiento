%Edgar Moises Hernandez-Gonzalez
%23/05/20
%Ventanas de 2 seg superpuestas al 95% (0.1 seg)
%Input shape: n_muestras x (1344*32=43008) = n_muestras x 43008
%Output shape (7 x n_muestras) x (1024*32=32768) = (7 x n_muestras) x 32768

clear
clc

%cambiar sujeto y sesion
load('MeCa_car_03_3.mat');
[f, c] = size(nuevo);

signals = zeros(7*f, 32768);
c = 1;
for i=1:f %muestras
    a = 1;
    b = 1;
    for j=1:32 %canales
        una_muestra = nuevo(i, a:a+1343);
        signals(c:c+6, b:b+1023) = ventaneo(una_muestra);
        a = a + 1344; %tamano de la senal original
        b = b + 1024; %tamano de la senal con ventaneo
    end
    c = c + 7; %el numero de ventanas por muestra
end

%cambiar sujeto y sesion
csvwrite('VentaneoMeCa_car_03_3.csv',signals);

function ventaneadas = ventaneo(una_muestra)
    ventaneadas = zeros(7, 1024);
    contador = 1;
    for i=1:7
        ventaneadas(i, :) = una_muestra(contador:contador + 1023);
        contador = contador + 52;
    end
end