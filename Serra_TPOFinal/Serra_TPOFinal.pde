//Imagen de fondo
PImage fondo;

//Tablero
int lineaX; //lineas verticales
int lineaY; //lineas horizontales

//turno
int turno = 1; // nos permite saber a qué jugador le toca jugar.

// Estado de cada casillero
// 0 = vacío
// 1 = círculo
// 2 = cruz

//Estado de cada casillero
int [][] estadoCasillero = {{0, 0, 0}, {0, 0, 0}, {0, 0, 0}};
int x;
int y;

//Ficha Cruz:
PFont font;

//Fin del juego
boolean gameOver = false;


//configuración de pantalla
void settings () {
  fondo = loadImage("fondo.jpg");
  size(fondo.width, fondo.height);
}

void setup () {
  image (fondo, 0, 0);  //muestra imagen de fondo
  println(fondo.width, fondo.height);
  font = loadFont("ArialMT-200.vlw");
  textFont(font);
}

void draw() {

  //Función para iniciar una partida, dibuja el tablero
  dibujarTablero();

  //Función para establecer las fichas del tablero
  fichasTablero();

  //estado de los casilleros del juego

  for (x = 0; x <= 2; x++) {
    for (y = 0; y <= 2; y++) {
      //si la columna tiene la misma ficha en sus tres casilleros
      if ((estadoCasillero [x][0] == estadoCasillero [x][1] && estadoCasillero [x][1] == estadoCasillero [x][2] && estadoCasillero [x][1]!= 0)
        //si la fila tiene la misma ficha en sus tres casilleros
        || (estadoCasillero [0][y] == estadoCasillero [1][y] && estadoCasillero [1][y] == estadoCasillero [2][y] && estadoCasillero [1][y]!= 0)
        //si la diagonal tiene la misma ficha en sus tres casilleros
        || (estadoCasillero [0][0] == estadoCasillero [1][1] && estadoCasillero [1][1] == estadoCasillero [2][2] && estadoCasillero [1][1]!= 0)
        //si la otra diagonal tiene la misma ficha en sus tres casilleros
        || (estadoCasillero [2][0] == estadoCasillero [1][1] && estadoCasillero [1][1] == estadoCasillero [0][2] && estadoCasillero [1][1]!= 0)) {

        //Finalizar juego
        gameOver = true;
      }
    }
  }

  //Pantalla final del juego: Ganador.
  if (gameOver) {
    if (turno == 1) {
      fill (0, 99);
      rect(0, 0, fondo.width, fondo.height);
      noFill();
      textSize (50);
      text ("Fin del juego, 'X' Gana", 15, 320);
    } else if (turno == 2) {
      fill (0, 99);
      rect(0, 0, fondo.width, fondo.height);
      noFill();
      textSize (50);
      text ("Fin del juego, 'O' Gana", 15, 320);
    }
  }
}



//Creo una función que dibuja el tablero
//basado en una lista
void dibujarTablero() {
  //imagen de fondo para limpiar pantalla al iniciar partida nueva
  background(fondo);
  stroke(255);
  //tablero
  //Loop de filas
  for (int lineaY = 200; lineaY <= 599; lineaY +=200) {
    //Loop de columnas
    for (int lineaX= 200; lineaX <= 599; lineaX += 200) {
      line (10, lineaY, 590, lineaY);
      line(lineaX, 10, lineaX, 590);
    }
  }
}

//Creo una funcion que establece las fichas del tablero
void fichasTablero() {
  for (int y = 0; y <= 2; y++) {
    for (int x = 0; x <=2; x++) {
      if (estadoCasillero [x][y]== 1) {
        //Ficha Círculo
        fill(255, 99);
        noStroke();
        //text("O", (x*200)+30, (y*200)+170);
        ellipse((x*200)+100, (y*200)+100, 150, 150);
      } else if (estadoCasillero [x][y] == 2) {
        //Ficha Cruz
        fill(255, 99);
        text("X", (x*200)+30, (y*200)+175);
      }
    }
  }
}

void mousePressed() {
  /*Al hacer clic devuelve dos numeros entre 0 y 2.
   Con estos datos se define la posición de las fichas.
   */
  println (mouseX/200, mouseY/200);
  if (estadoCasillero [mouseX/200][mouseY/200] == 0) {
    estadoCasillero [mouseX/200][mouseY/200] = turno;
    if (turno == 1) {
      turno = 2;
    } else if (turno == 2) {
      turno = 1;
    }
  }
}
