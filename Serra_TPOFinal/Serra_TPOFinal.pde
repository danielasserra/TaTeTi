//Imagen de fondo
PImage fondo;

//Tablero
int lineaX; //lineas verticales
int lineaY; //lineas horizontales

// Estado de cada casillero
// 0 = vacío
// 1 = círculo
// 2 = cruz

/*
//filas
 //Arriba
 int arribaIzq;
 int arribaMed;
 int arribaDer;
 
 //Medio
 int medioIzq;
 int medioMed;
 int medioDer;
 
 //Abajo
 int abajoIzq;
 int abajoMed;
 int abajoDer;
 
 
 //turno
 int turno = 1; // nos permite saber a qué jugador le toca jugar.
 */

//Estado de cada casillero
int [][] estadoCasillero = {{2, 2, 2}, {2, 2, 2}, {2, 2, 2}};
int x;
int y;
//Ficha Cruz:
int lL = 190; //largo de línea
int v = 45; //distancia de x e y (0,0).
int h = 600/4; //alto del tablero /4

//configuración de pantalla
void settings () {
  fondo = loadImage("fondo.jpg");
  size(fondo.width, fondo.height);
}

void setup () {
  image (fondo, 0, 0);  //muestra imagen de fondo
  println(fondo.width, fondo.height);
}

void draw() {
  //Función para iniciar una partida, dibuja el tablero
  dibujarTablero();

  //Cambio de estado de casilleros
  for (int y = 0; y <= 2; y++) {
    for (int x = 0; x <=2; x++) {
      if (estadoCasillero [x][y]== 1) {
        //Ficha Círculo
       fill(255, 30);
       ellipse((x*200)+119, (y*200)+119, 150, 150);
      } else if (estadoCasillero [x][y] == 2) {
        //Ficha Cruz
        line ( (x*200)+v, (y*200)+v, (x*200)+lL, (y*200)+lL);
        line ( (x*200)+h, (y*200)-h, (x*200)-h, (y*200)+h);
      }        
        
    }
        
  }
      /*
  //Izquierda-Arriba
       if (arribaIzq == 1) {
       //Ficha Círculo
       fill(255, 30);
       ellipse(119, 119, 150, 150);
       } else if (arribaIzq == 2) {
       //Ficha Cruz
       line(49, 49, 189, 189);
       line(49, 189, 189, 49);
       }
       */
    }

    //Creo una función que dibuja el tablero
    void dibujarTablero() {
      //imagen de fondo para limpiar pantalla al iniciar partida nueva
      background(fondo);
      stroke(255);
      //tablero
      for (int lineaY = 19; lineaY <= 619; lineaY +=200) {
        for (int lineaX= 19; lineaX <= 619; lineaX += 200) {
          line (19, lineaY, 619, lineaY);
          line(lineaX, 19, lineaX, 619);
        }
      }
    }

    void mousePressed() {
      //informa en qué sector de la pantalla se hace clic.
      //con estos datos se define la posición de la ficha.
      println (mouseX, mouseY);
      /*
  //posicionar ficha al hacer clic
       //si el jugador cliquea en el casillero de arriba a la izquierda
       //posicionará su ficha en ese lugar.
       if ((mouseX > 19 && mouseX < 219) && (mouseY > 19 && mouseY < 219)){
       arribaIzq = turno;
       }    */
    }
