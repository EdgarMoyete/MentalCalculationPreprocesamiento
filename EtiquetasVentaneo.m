%Edgar Moises Hernandez-Gonzalez
%23/05/20
%Etiquetas para el ventaneo

clear
clc

%cambiar sujeto y sesion
classlabel = csvread('EtiquetasMeCa15RMFH-03.csv');
n = length(classlabel);

etiquetas = zeros(n*7,1);
contador = 1;
for i=1:n
    etiquetas(contador:contador+6) = classlabel(i);
    contador = contador + 7;
end

%cambiar sujeto y sesion
csvwrite('EtiquetasVenta-15-3.csv',etiquetas);