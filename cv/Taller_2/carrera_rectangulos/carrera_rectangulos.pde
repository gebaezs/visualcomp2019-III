float movimiento;

void setup() {
    size(800, 250);
    background(255);
}

void draw() {

    // --> ESTABLECE EL FONDO CUANDO ESTA CORRIENDO LA APLICACION
    background(255);
    
    // --> SE PINTA LA GRILLA EN LA VENTANA
    for (int i = 0; i < 30; i++) {
        noStroke();
        fill(0);
        rect(i * 30, 0, 15, height);
    }

    // --> MIENTRAS SE MANTENGA EL CLICK PRESIONADO, LA GRILLA DESAPARECE PARA VER EL EFECTO
    if (mousePressed == true) {
        background(255);
    }


    // --> PINTA LOS RECTANGULOS
    for (int i = 0; i < 2 ; i++) {

        // --> SE ESTABLECE EL COLOR ROJO
        if(i % 3 == 0) {
            fill(255, 0, 0);
        }
        // --> SE ESTABLECE EL COLOR VERGE
        if(i % 3 == 1) {
            fill(0, 0, 0);
        }

        // --> SE PINTA EL PRIMER RECTANGULO, EL COLOR DEPENDE DE LOS (IF)
        rect(movimiento, i*80 + 30, 60, 25);
    }

    // --> AQUI SE GENERA EL MOVIMIENTO DE LOS RECTANGULOS Y TAMBIEN
    //     DEPENDE DE LA VELOCIDAD
    movimiento += 1.0;

    // --> CUANDO LOS CUADRADOS LLEGAN AL FINAL DE LA VENTANA (IZQ -> DER)
    //     VUELVEN AL PRINCIPIO
    if (movimiento > width + 10) {
        movimiento = 0;
    }

   

}
