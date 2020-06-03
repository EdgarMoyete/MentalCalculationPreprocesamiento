%Edgar Moises Hernandez-Gonzalez
%20/05/20
%Obtener los canales centrales y parietales
%Input shape: n_muestras x (1344*32=43008) = n_muestras x 43008
%Output shape: n_muestras x (1344*12=16128) = n_muestras x 16128

clear
clc

%cambiar sujeto y sesion
load('MeCa15RMFH-3.mat');
[f, c] = size(nuevo);

centr_parie = zeros(f, 16128);

for i=1:f
    centr_parie(i,1:1344) = nuevo(i,21505:22848);
    centr_parie(i,1345:2688) = nuevo(i,22849:24192);
    centr_parie(i,2689:4032) = nuevo(i,24193:25536);
    centr_parie(i,4033:5376) = nuevo(i,26881:28224);
    centr_parie(i,5377:6720) = nuevo(i,28225:29568);
    centr_parie(i,6721:8064) = nuevo(i,29569:30912);
    centr_parie(i,8065:9408) = nuevo(i,30913:32256);
    centr_parie(i,9409:10752) = nuevo(i,32257:33600);
    centr_parie(i,10753:12096) = nuevo(i,33601:34944);
    centr_parie(i,12097:13440) = nuevo(i,34945:36288);
    centr_parie(i,13441:14784) = nuevo(i,36289:37632);
    centr_parie(i,14785:16128) = nuevo(i,37633:38976);
end

%cambiar sujeto y sesion
csvwrite('MeCaCenPar15RMFH-3.csv', centr_parie);