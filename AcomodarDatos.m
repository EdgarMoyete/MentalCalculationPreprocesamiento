%Edgar Moises Hernandez-Gonzalez
%30/04/20-02/05/20
%Acomodar los datos para que queden concatenados los canales
%Input shape: (1344*n_muestras) x n_canales = (1344*n_muestras) x 32
%Output shape: n_muestras x (1344*32=43008) = n_muestras x 43008

clear
clc

%cambiar sujeto y sesion
load('Filtra15RMFH-3.mat');
n_muestras = length(signals_filtradas) / 1344;

nuevo = zeros(n_muestras, 43008);
contador2 = 1;
for i=1:n_muestras
    contador1=1;
    for j=1:32
        nuevo(i, contador1:contador1+1343)...
            = signals_filtradas(contador2:contador2+1343, j);
        contador1 = contador1 + 1344;
    end
    contador2 = contador2 + 1344;
end

%cambiar sujeto y sesion
csvwrite('MeCa15RMFH-3.csv',nuevo);
save('MeCa15RMFH-3.mat','nuevo');