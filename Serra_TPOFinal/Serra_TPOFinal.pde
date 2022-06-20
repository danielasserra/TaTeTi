//Imagen de fondo
PImage fondo;

//Tablero
int lineaX; //lineas verticales
int lineaY; //lineas horizontales

//turno
int turno; // nos permite saber a qué jugador le toca jugar.

// Estado de cada casillero
// 0 = vacío
// 1 = círculo
// 2 = cruz

//Estado de cada casillero
int [][] estadoCasillero;
int x;
int y;

//Ficha Cruz:
PFont font;

//Modo de juego
// 1 - jugable
// 2 - game over.
int modo;

//Fin del juego
boolean gameOver;

//Ganador
int ganador;

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
  reset();
}

void reset() {
  //Define a qué jugador le toca jugar.
  turno = 1;
  //Modo de juego
  modo = 1;
  //Fin del juego
  gameOver = false;
  //Ganador
  ganador = 0;
  //Estado de los casilleros
  estadoCasillero = new int [][] {
    {0, 0, 0},
    {0, 0, 0},
    {0, 0, 0}
  };
}

void draw() {
  if (modo == 1) {
    //Función para iniciar una partida, dibuja el tablero
    dibujarTablero();

    //Función para establecer las fichas del tablero
    fichasTablero();

    //Función para establecer el estado de los casilleros del juego
    estadoJuego();

    //Función que determina al ganador del juego.
    winner();
    println(ganador);
  } else if (modo == 2) {
    pantallaFinal();
    if (mousePressed) {
      reset();
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
  //Loop que revisa las filas
  for (int y = 0; y <= 2; y++) {
    //Loop que revisa las columnas
    for (int x = 0; x <=2; x++) {
      //Si es el turno del jugador 1
      if (estadoCasillero [x][y]== 1) {
        //Ficha Círculo
        fill(255, 99);
        noStroke();
        //text("O", (x*200)+30, (y*200)+170);
        ellipse((x*200)+100, (y*200)+100, 150, 150);
        //Si es el turno del jugador 2
      } else if (estadoCasillero [x][y] == 2) {
        //Ficha Cruz
        fill(255, 99);
        text("X", (x*200)+30, (y*200)+175);
      }
    }
  }
}

//Función para establecer el estado de los casilleros del juego
void estadoJuego() {
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
        modo = 2;
      } else if (modo == 2) {
        pantallaFinal();
      }
    }
  }
}

//Función que determina al ganador del juego
void winner() {
  if (gameOver) {
    if (turno == 1) {
      ganador = 1;
    } else if (turno == 2) {
      ganador = 2;
    }
  }
}
void pantallaFinal() {
  if (ganador == 1) {
    textSize (50);
    text ("Fin del juego, 'X' Gana", 15, 320);
  } else if (ganador == 2) {
    textSize (50);
    text ("Fin del juego, 'O' Gana", 15, 320);
    //} else {
    //  textSize (50);
    //  text ("Fin del juego, Empate", 15, 320);
  }
}

void mousePressed() {
  /*Al hacer clic devuelve dos numeros entre 0 y 2.
   Con estos datos se define la posición de las fichas.
   */
  println (mouseX/200, mouseY/200);
  //Los clics fuera del tablero no dan error
  if (mouseX<600) {
    //Sólo coloca ficha si el espacio está vacío
    if (estadoCasillero [mouseX/200][mouseY/200] == 0) {
      //Cambia de jugador por turno
      estadoCasillero [mouseX/200][mouseY/200] = turno;
      if (turno == 1) {
        turno = 2;
      } else if (turno == 2) {
        turno = 1;
      }
    }
  }
}
