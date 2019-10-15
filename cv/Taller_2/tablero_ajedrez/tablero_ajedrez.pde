// --> VARIABLE PARA PODER OBSERVAR EL EFECTO
boolean efecto = true;

// --> VARIABLE PARA EL GROSOR DE LOS CUADROS DEL TABLERO
int ancho = 71;

// --> VARIABLE PARA EL ANCHO DE LOS CUAROS PEQUEñOS QUE GENERAN EL EFECTO
int cuad_efec = 15;

// --> ESPACIO ENTRE LOS BORDES DEL CUADRADO QUE CONTIENE LOS CUADRADOS PEQUEñOS DE LOS EFECTOS
int marg_cua_peq = 2;

// --> MOVER UN PIXEL
int er_pxl = 1;

// --> COLOR BLANCO EN RGB
int color_blanco = 255;

// --> COLOR NEGRO EN RGB
int color_negro = 0;

// --> SE CREA LA VENTANA DE LA APLICACION
void setup() {

    // --> SE CONFIGURA EL FONDO
    background(255);

    // --> DE DEFINE EL TAMA#O DE LA VENTANA
    size(923, 923);
}


// --> FUNCION QUE AL HACER CLICK SOBRE LA IMAGEN ACTIVA O DESCTIVA EL EFECTO
void mouseClicked() {

    if ( efecto ) {
        // --> SI EL EFECTO ESTA ACTIVADO LO QUITA AL HACER CLICK
        efecto = false;
    } else {
        // --> SI EL EFECTO NO ESTA ACTIVADO LO ACTIVA AL HACER CLICK
        efecto = true;
    }
}


// --> FUNCION QUE SE ENCARGA DE DIBUJAR LA IMAEGN EN LA VENTANA
void draw() {


    // --> PINTA EL TABLERO INICIAL SIN EFECTOS
    // --> (height) = GUARDA LA ALTURA DE LA VENTANA
    for (int i = 0; i < height; i += ancho) {
        for (int j = 0; j < height; j += ancho) {
            fill( color_negro );
            if(i % 2 == 0) {
                // PINTA LOS CUADRADOS NEGROS EN LAS FILAS PARES
                rect(j * 2, i, ancho, ancho);
            } else {
                // PINTA LOS CUADRADOS NEGROS EN LAS FILAS IMPARES
                 rect(j * 2 + ancho, i, ancho, ancho);
            }
        }
    }


    // PINTA EL EFECTO DE LOS CUADRADOS INTERNOS
    if ( efecto ) {
        
        for (int i = 0; i < height; i += ancho) {
            for (int j = 0; j < height; j += ancho) {
                mini_cuadrados(i, j, color_blanco, color_negro);
            }
        }
    } else {
        for (int i = 0; i < height; i += ancho) {
            for (int j = 0; j < height; j += ancho) {
                mini_cuadrados(i, j, color_negro, color_blanco);
            }
        }
    }
}


// --> PINTAR LOS EFECTOS DE LOS CIRCULOS PEQUEñOS
void mini_cuadrados(int pos_x, int pos_y, int color_1, int color_2) {

    noStroke();

    if ((pos_x + pos_y) % 2 == 0) {
        fill( color_1 );
    } else {
        fill( color_2 );
    }

    // noStroke();
    
    // --> COLOCA LOS CUADRADOS EN EFECTO = (/)
    if (((pos_x < (height / 2) - ancho) && (pos_y < (height / 2) - ancho)) || (pos_x > (height / 2)) && (pos_y > (height / 2))) {
        rect(pos_x + ancho - (cuad_efec + marg_cua_peq), pos_y + marg_cua_peq + er_pxl, cuad_efec, cuad_efec);
        rect(pos_x + marg_cua_peq + er_pxl, pos_y + ancho - (cuad_efec + marg_cua_peq), cuad_efec, cuad_efec);
    }


    // --> COLOCA LOS CUADRADOS EN EFECTO = (\)
    if (((pos_x < (height / 2) - ancho) && (pos_y > (height / 2))) || (pos_x > (height / 2)) && (pos_y < (height / 2) - ancho)) {
        rect(pos_x + marg_cua_peq + er_pxl, pos_y + marg_cua_peq + er_pxl, cuad_efec, cuad_efec);
        rect(pos_x + ancho - (cuad_efec + marg_cua_peq), pos_y + ancho - (cuad_efec + marg_cua_peq), cuad_efec, cuad_efec);
    }

    // --> COLOCA LOS CUADRADOS EN EFECTO = (-|) DE LA PARTE DERECHA E INFERIOR DE CUADRANTE (I) 
    if ((pos_x  == (height / 2) - (ancho / 2) ) && (pos_y < (height / 2) - ancho)) {
        rect(pos_y + ( ancho - cuad_efec - marg_cua_peq), pos_x + marg_cua_peq + er_pxl, cuad_efec, cuad_efec);
        rect(pos_y + ( ancho - cuad_efec - marg_cua_peq), pos_x + (ancho - cuad_efec - marg_cua_peq), cuad_efec, cuad_efec);
        rect(pos_x + marg_cua_peq + er_pxl, pos_y + (ancho - cuad_efec - marg_cua_peq), cuad_efec, cuad_efec);
        rect(pos_x + (ancho - cuad_efec - marg_cua_peq), pos_y + (ancho - cuad_efec - marg_cua_peq), cuad_efec, cuad_efec);
    }

    // --> COLOCA LOS CUADRADOS EN EFECTO = (|-) DE LA PARTE IZQUIERDA Y SUPERIOR DEL CUADRANTE (IV)
    if ((pos_x  > (height / 2) ) && (pos_y == (height / 2) - (ancho / 2))) {       
        rect(pos_y + marg_cua_peq + er_pxl, pos_x + marg_cua_peq + er_pxl, cuad_efec, cuad_efec);
        rect(pos_y + (ancho - cuad_efec - marg_cua_peq), pos_x + marg_cua_peq + er_pxl, cuad_efec, cuad_efec);
        rect(pos_x + marg_cua_peq + er_pxl, pos_y + marg_cua_peq + er_pxl, cuad_efec, cuad_efec);
        rect(pos_x + marg_cua_peq + er_pxl, pos_y + (ancho - cuad_efec - marg_cua_peq), cuad_efec, cuad_efec);
    }
    
}