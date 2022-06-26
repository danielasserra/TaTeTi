// Ta Te Ti Interactivo
// Desarrolladora: Daniela Serra

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
int [][] casillero;
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

//Contador para empate
int cnt;

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
  //Contador para empate
  cnt = 0;
  //Estado de los casilleros
  casillero = new int [][] {
    {0, 0, 0},
    {0, 0, 0},
    {0, 0, 0}
  };
  //Tamaño de la ficha X
  textSize (200);
}

void draw() {
  if (modo == 1) {
    //Función para iniciar una partida, dibuja el tablero
    dibujarTablero();

    //Función para establecer las fichas del tablero
    fichasTablero();

    //Función para establecer el estado de los casilleros del juego
    estadoJuego();
  }
}

//Creo una función que dibuja el tablero basado Array 2D
void dibujarTablero() {
  //imagen de fondo
  background(fondo);
  //color de línea
  stroke(255);
  //Tablero:
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
      if (casillero [x][y]== 1) {
        //Ficha Círculo
        fill(255, 99);
        noStroke();
        ellipse((x*200)+100, (y*200)+100, 150, 150);

        //Si es el turno del jugador 2
      } else if (casillero [x][y] == 2) {
        //Ficha Cruz
        fill(255, 99);
        text("X", (x*200)+30, (y*200)+175);
      }
    }
  }
}

//Función para establecer el estado de los casilleros del juego
void estadoJuego() {
  //Loop que revisa las columnas
  for (x = 0; x <= 2; x++) {
    //Loop que revisa las filas
    for (y = 0; y <= 2; y++) {

      if
        //si la columna tiene la misma ficha en sus tres casilleros
        (casillero [x][0] == casillero [x][1] && casillero [x][0] == casillero [x][2] && casillero [x][0]!= 0) {
        //Finalizar juego
        gameOver = true;
        modo = 2; //modo no jugable
        ganador = casillero[x][0];
      } else if
        //si la fila tiene la misma ficha en sus tres casilleros
        (casillero [0][y] == casillero [1][y] && casillero [0][y] == casillero [2][y] && casillero [0][y]!= 0) {
        //Finalizar juego
        gameOver = true;
        modo = 2; //modo no jugable
        ganador = casillero [0][y];
      } else if
        //si la diagonal tiene la misma ficha en sus tres casilleros
        (casillero [0][0] == casillero [1][1] && casillero [1][1] == casillero [2][2] && casillero [1][1]!= 0) {
        //Finalizar juego
        gameOver = true;
        modo = 2; //modo no jugable
        ganador = casillero [0][0];
      } else if
        //si la otra diagonal tiene la misma ficha en sus tres casilleros
        (casillero [2][0] == casillero [1][1] && casillero [1][1] == casillero [0][2] && casillero [1][1]!= 0) {
        //Finalizar juego
        gameOver = true;
        modo = 2; //modo no jugable
        ganador = casillero[0][2];

        //código para el empate https://www.youtube.com/watch?v=sXu48OOm1ac
      } else if
        (casillero[x][y] == 0) {
        cnt++;
      }
      if (modo == 2) {
        pantallaFinal();
      }
    }
  }
  if (cnt == 0 && ganador == 0) {
    ganador = 1;
  }
}


void pantallaFinal() {
  //empate
  if (ganador == 1) {
    textSize (50);
    text ("Fin del juego, Empate", 15, 320);
    fill(0, 50);
    rect(100, 430, 310, 210);
    fill(255);
    text ("Volver a Jugar", 100, 500);
    //reiniciarJuego();
    //gana X
  } else if (turno == 1) {
    textSize (50);
    text ("Fin del juego, 'X' Gana", 15, 320);
    fill(0, 50);
    rect(100, 430, 310, 210);
    fill(255);
    text ("Volver a Jugar", 100, 500);
    //reiniciarJuego();
    //gana O
  } else if (turno == 2) {
    textSize (50);
    text ("Fin del juego, 'O' Gana", 100, 320);
    fill(0, 50);
    rect(100, 430, 310, 210);
    fill(255);
    text ("Volver a Jugar", 100, 500);
    //reiniciarJuego();
  }
}

void reiniciarJuego() {
    reset();
}

void mousePressed() {
  /*Al hacer clic devuelve dos numeros entre 0 y 2.
   Con estos datos se define la posición de las fichas.
   */
  println (mouseX/200, mouseY/200);
  if (modo == 1) {
    //Los clics fuera del tablero no dan error
    if (mouseX<600) {
      //Sólo coloca ficha si el espacio está vacío
      if (casillero [mouseX/200][mouseY/200] == 0) {
        //Cambia de jugador por turno
        casillero [mouseX/200][mouseY/200] = turno;
        if (turno == 1) {
          turno = 2;
        } else if (turno == 2) {
          turno = 1;
        }
      }
    }
  } else if (modo == 2) {
    if (mouseX > 100 && mouseX<400 && mouseY>400 && mouseY<600) {
      reiniciarJuego();
    }
  }
}
