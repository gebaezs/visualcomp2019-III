PGraphics pg;


void setup(){
  
  // --> ASIGNAMOS EL TAMAÑO DE NUESTRO CANVAS 
  size(700,700);

  pg = createGraphics(700,700);
}

void draw(){

    pg.beginDraw();
    
    // --> ASIGNAMOS EL FONDO BLANCO A NUESTRO DIBUJO
    pg.background(255);
    
    // --> COLOR PARA ASIGNAR A LOS RECTANGULOS
    pg.fill(0,0,0);
    
    // --> CICLO PARA LLENAR CUDRADOS 
    for(int x = 0; x <= 700; x += 50) {
        for(int y = 0; y < 750; y += 50) {
        
            // --> CREAMOS EL RECTANGULO CON CORDENADAS EN (X, Y) MOVIDAS EN 20 UNIDADES HACIA ATRAS
            pg.rect(x-20, y-20, 40, 40); 
        }
    }

    pg.endDraw();

    image(pg,0,0);
}