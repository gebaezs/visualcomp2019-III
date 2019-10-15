void setup(){
  
  // -->> CONFIGURAMOS EL TAMAÑO DEL CANVAS PARA NUESTRA CUADRICULA
  size(400,400);
  background(255);
  
  // --> VARIABLE PARA INTERCALAR COLORES EN DIFERENTE FILA DE LA CUADRICULA
  int colorInicial= 0;
  
  // --> CICLO PARA RECORRER LA CUADRICULA
  for(int y = 0; y < 80; y++){
  
    //=> VARIABLE PARA LLENAR COLOR EN CADA CUADRADO 
    int col = colorInicial;
    
    for(int x = 0; x < 80; x++){
   
        if(col == 0){
            // --> PINTAMOS DE AZUL SI EL COLOR ES 0
            fill(0, 0, 255); 
        }else{
            // --> PINTAMOS DE AMARILLO SI EL COLOR ES 1
            fill(255, 255, 0);
        }

        noStroke();
        
        // --> CREAMOS EL RECTANGULO CON EL COLOR ASIGNADO
        rect(x*5, y*5, 5, 5);
        
        // --> ACTUALIZAMOS VARIABLE PARA INTERCALAR COLOR EN LA FILA Y EN LA POSICION X DE LA CUADRICULA
        col = (col + 1) % 2; 
    }
    
    // --> ACTUALIZAMOS VARIABLE PARA INTERCALAR COLOR EN LA SIGUIENTE FILA Y DE LA CUADRICULA
    colorInicial = (colorInicial + 1) % 2; 
  }
}
