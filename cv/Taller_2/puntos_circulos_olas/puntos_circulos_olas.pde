// --> VELOCIDAD DE LA ANIMACION
float movimiento  =  10.0f;

// --> SE ESTABLECE EL RADIO DEL CIRCULO EL CUAL ES QUE DA EL EFECTO
float size_circulo_efecto = 80.0f;

// --> COLOR PERSONALIZADO
int color_personalizado = 255;
// int color_personalizado_r = 0;
// int color_personalizado_g = 0;
// int color_personalizado_b = 0;

// --> VARIABLE PARA SABER SI MOSTRAR O NO EL EFECTO DEL CIRCULO
boolean truco_circulo = false;

void setup() {

    // --> ESTABLECE EL TAMAñO DE LA VENTANA
    size(800, 800);
}

void draw() {

    // --> SE INTREMENTA EN 0.1 EL MOVIMEINTO 
    movimiento += 0.1f;

    // --> SE ESTABLECE EL FONDE DEL CANVAS
    background(0);

    // --> SE DIBUJAN LOS CIRULOS QUE DAN LOS EFECTOS
    for (int x = 0; x < (width / size_circulo_efecto * 2.0 + 1); x++) {
        for (int y = 0; y < (height / size_circulo_efecto * 2.0 + 1); y++) {
            
            // --> 
            pushMatrix();
            
            // --> SE COPIAN LOS CIRCULOS DE LOS EFECTOS
            translate(x * size_circulo_efecto / 2, y * size_circulo_efecto / 2);

            // --> AL HACER CLICK DIBUJA EL CIRCULO EN EL CUAL SE MUEVEN LOS PUNTOS
            if (truco_circulo) {

                // --> DESHABILIDA EL RELLENO DE LA FIGURA EN ESTE CASO DEL CIRCULO
                noFill();

                // --> A LA LINEA DEL CIRCULO DEL EFECTO SE LE COLOCA EL COLOR PERSONALIZADO
                // stroke(color_personalizado_r, color_personalizado_g, color_personalizado_b);
                stroke(color_personalizado);


                // --> DIBUJA LA CIRCUNFERENCIA
                ellipse(0, 0, size_circulo_efecto / 2, size_circulo_efecto / 2);                
            }

            rotate((x/size_circulo_efecto * TWO_PI * 10) + movimiento + (y/size_circulo_efecto * size_circulo_efecto));

            translate(size_circulo_efecto / 4.0, 0);

            // --> SE LE COLOCA EL COLOR DEL RELLENO DEL CIRCULITO QUE SE MUEVE
            fill(color_personalizado);

            // --> DIBUJA EL CIRCULITO QUE SE MUEVE POR LA CIRCUNFENCIA QUE DA EL EFECTO DE OLA 
            ellipse(0, 0, size_circulo_efecto / 8, size_circulo_efecto / 8);

            popMatrix();
        }
    }

}

void mousePressed() {
    if (truco_circulo) {
        truco_circulo = false;
    } else {
        truco_circulo = true;
    }
}
