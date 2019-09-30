// --> VARIABLE PARA MANEJAR TEXTO
PFont myFont;

// --> VARIABLE PARA MANEJAR GRAFICOS
PGraphics pg;

// --> VARIABLE PARA LA IMAGEN ORIGINAL
PImage imagen_original;

// --> VARIABLE PARA LA IMAGEN DE GRISES
PImage imagen_grises;

void setup() {
    // --> DEFINIMSO TAMAÑO DEL CANVAS
    size(630, 350);

    // --> CONFIGURAMOS EL TEXTO
    myFont = createFont("Arial",15);

    // --> CARGAMOS LA VARIABLE (pg)
    pg = createGraphics(630, 350);

    // --> CARGAMOS LA IMAGEN ORIGINAL
    imagen_original = loadImage("car.jpg");

    // --> CARGAMOS LA IMAGEN DE GRISES
    imagen_grises = loadImage("car.jpg");
}

void draw() {

    // --> ASIGNAMONS EL TAMAÑO EN PIXELES AL TEXTO
    textFont(myFont,20);

    // --> SE LE ASINGA EL COLOR NEGRO AL TEXTO
    fill(0);

    // --> ASIGNAMOS EL TEXTO A LA IMAGEN ORIGINAL
    text("Imagen Original",100,330);            

    // --> ASIGNAMOS EL TEXTO A LA IMAGEN EN ESCALA DE GRISES
    text("Imagen Escala De Grises",370,330); 

    // ==========================================================
    // --> RENDERIZAMOS LA IMAGEN ORIGINAL
    pg.beginDraw();
    pg.image(imagen_original, 0, 0);
    pg.endDraw();
    image(imagen_original, 10, 10);
    // ==========================================================



    // ==========================================================
    // --> RENDERIZAMOS LA IMAGEN A ESCALA DE GRISES
    pg.beginDraw();

    // --> SE CARGA LA IMAGEN EN UN ARREGLO DE PIXELES
    imagen_original.loadPixels();

    for (int y = 0; y < imagen_original.height; y++) {
        for (int x = 0; x < imagen_original.width; x++) {

            // --> SE CALCULA LA POSISCION EN EL ARREGLO DE PIEXLES
            int posicion = x + y * imagen_original.width;

            // --> SE HACE EL PROMEDIO DE COLOR RGB  
            float color_gris = ( (red(imagen_original.pixels[posicion])) + (green(imagen_original.pixels[posicion])) + (blue(imagen_original.pixels[posicion])) ) / 3;   

            // --> SE ALMACENA EL PROMEDIO DEL COLOR EN EL ARREGLO
            //     DE PIXELES DE LA IMAGEN DE GRISES
            imagen_grises.pixels[posicion] = color(color_gris, color_gris, color_gris);
        }
    }

    imagen_grises.updatePixels();
    pg.image(imagen_grises, 0, 0);
    pg.endDraw();
    image(imagen_grises, 320, 10);
    // ==========================================================

}
