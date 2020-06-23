# Mental Calculation Preprocesamiento
## El preprocesamiento es el siguiente:
Subconjuntos.m --> Unir.m --> CAR.m --> FiltroPasaBanda.m --> AcomodarDatos.m

### Subconjuntos.m
Se obtienen para cada archivo de cada una de las tres sesiones de cada sujeto, fs=512Hz, por lo tanto en 2.625seg son 1344 datos

* Input: ejecutar ejemplo_de_carga.m
* Output: Subaabbbb-c-d.mat, EtiMCaabbbb-c-d.mat
* Input shape: signal registrada
* Output shape: (n_muestrasx1344)x32, n_muestras<=140

### Unir.m
Unir subconjuntos para que quede uno por sesion

* Input: Subaabbbb-c-d.mat, EtiMCaabbbb-c-d.mat
* Output: MCaabbbb-c.mat, EtiquetasMeCaaabbbb-c.csv
* Input shape: (n_muestrasx1344)x32 (n_muestras<=140)
* Output shape: (n_muestrasx1344)x32

### CAR.m
Aplicar CAR (common average reference)

* Input: MCaabbbb-c.mat
* Output: MC_CAR_aa_c.mat
* Input shape: (n_muestrasx1344)x32
* Output shape: (n_muestrasx1344)x32

### FiltroPasaBanda.m
Filtro pasa banda de 8-30hz
* Input: MC_CAR_aa_c.mat
* Output: Filtradas_car_aa_c.mat
* Input shape: (n_muestrasx1344)x32
* Output shape: (n_muestrasx1344)x32

### AcomodarDatos.m
Acomodar los datos para que queden concatenados los canales
* Input: Filtradas_car_aa_c.mat
* Output: MeCa_car_aa_c.mat
* Input shape: (1344xn_muestras) x n_canales = (1344xn_muestras) x 32
* Output shape: n_muestras x (1344x32=43008) = n_muestras x 43008

### CentraParie.m
Obtener los canales centrales y parietales
* Input: MeCa_car_aa_c.mat
* Output: MeCa_car_CP_aa_c.csv
* Input shape: n_muestras x (1344x32=43008) = n_muestras x 43008
* Output shape: n_muestras x (1344x12=16128) = n_muestras x 16128

### Ventaneo.m
Ventanas de 2 seg superpuestas al 95% (0.1 seg)
* Input: MeCa_car_aa_c.mat
* Output: VentaneoMeCa_car_aa_c.csv
* Input shape: n_muestras x (1344x32=43008) = n_muestras x 43008
* Output shape: (7 x n_muestras) x (1024x32=32768) = (7 x n_muestras) x 32768

### EtiquetasVentaneo.m
Etiquetas para el ventaneo
* Input: EtiquetasMeCaaabbbb-c.csv
* Output: EtiquetasVenta-aa-c.csv
* Input shape: n_muestras
* Output shape: (7xn_muestras)