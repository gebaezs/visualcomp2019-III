 // --> NUEMRO DE RAYASCON CON PUNTOS
int numero_rayas_puntos;

// --> 
int movimiento;

// --> 
float espacio;

//--> 
boolean mostrar_ocultar_truco = false;

// --> TWO_PI = CONSTANTE MATEMATICA CON EL VALOR 6.2831855

void setup() {

    // --> TAMAñO DE LA VENTANA
    size(600, 600);

    // --> NUMERO DE FOTOGRAMAS POR SEGUNTO
    // frameRate(60);

    // --> SE INICIALIZAN LAS VARIABLES
    numero_rayas_puntos = 32;
    movimiento = 0;
    espacio = 1;
    
    // --> QUITA LOS BORDES 
    noStroke();

    // --> 
    colorMode(HSB, 360, 255, 255);
}

void draw() {
    // --> ESTABLECE EL FONDE DEL CANVAS
    background(0, 0, 0);

    // --> GUARDA EL SISTEMA DE COORDENAS ACTUAL DE LA PILA
    pushMatrix();
    
    // --> DESPLAZA OBJETOS DENTRO DE LA VENTANA (IZQ -> DER)
    translate(width / 2, height / 2); 
    
    // --> MUESTRA O OCULTA EL TRUCO
    if ( mostrar_ocultar_truco ) {
        truco();
    }

    // -->
    for (int i = 0; i < numero_rayas_puntos; ++i) {

        // --> GIRA LA CANTIDAD ESPECIFICADA EN EL PARAMETRO (ENTRE 0 Y TWO_PI)
        rotate(TWO_PI / numero_rayas_puntos);

        // -->
        fill(255);

        // --> DIBUJA UNA UN CIRCULO EM CADA UNA DE LAS LINEAS QUE TIEND E ANCHO Y ALTO 10 PIXELES
        //     LA POSICION DONDE SE DIBUJA EL CIRCULO CAMBIA DEPENDIENDO (i) Y (movimiento) 
        ellipse(( 50 * (1.1 + espacio * cos(0.075 * movimiento + PI * 6 * i / numero_rayas_puntos)) ), 0, 10, 10);
    }
    
    // --> 
    popMatrix();

    // -->
    movimiento++;
}

void truco() {

    // --> COLOCA LOS BORDES
    stroke(100);

    // --> 
    for (int i = 0; i < numero_rayas_puntos ; i++) {
        
        // --> GIRA LA CANTIDAD ESPECIFICADA EN EL PARAMETRO (ENTRE 0 Y TWO_PI)
        rotate(TWO_PI /  numero_rayas_puntos);

        // --> DIBUJA UNA LINEA (CAMINO  ENTRE DOS PUNTOS)
        //    X1  Y1  X2  Y2
        line(120,  0,  10,  0);    
    }
}

// --> AL HACER CLICK MUESTRA LAS LINEAS Y MUESTRA COMO SE MUEVEN LOS PUNTOS EN LA LINEA
void mousePressed() {
    mostrar_ocultar_truco =! mostrar_ocultar_truco;
}