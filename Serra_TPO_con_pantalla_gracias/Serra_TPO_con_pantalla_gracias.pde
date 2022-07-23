/*///////////////////////////////////////////////////////////////////
                         TPO Final Obra
                     "Ta Te Ti Interactivo"
           Programación Orientada al Arte Multimedial I
                       Universidad de Quilmes
                    Profesor Mauricio Gutierrez
                      Alumna Daniela Serra
                        1er Período 2022
//////////////////////////////////////////////////////////////////*/


//Imagen de fondo
PImage fondo;

//Tablero
int lineaX; //lineas verticales
int lineaY; //lineas horizontales

//turno
int turno; // nos permite saber a qué jugador le toca jugar.

//Movimientos en el juego de la IA
boolean ia;

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
boolean ganador;

//Empate
boolean empate;

//Contador para empate
int cnt;

//configuración de pantalla
void settings () {
  fondo = loadImage("fondo.jpg");
  size(fondo.width, fondo.height);
}

void setup () {

  //imagen de fondo
  image (fondo, 0, 0);
  println(fondo.width, fondo.height);

  //fuente para texto del juego
  font = loadFont("ArialMT-200.vlw");
  textFont(font);

  //Movimiento de la IA
  ia = true;

  //reiniciar
  reset();
}

void reset() {
  //Define a qué jugador le toca jugar.
  turno = 1;
  //Movimiento de la IA
  ia = true;
  //Modo de juego
  modo = 1;
  //Fin del juego
  gameOver = false;
  //Ganador
  ganador = false;
  //Empate
  empate = false;
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
    if ((turno==2)&&(modo==1)) {
      ia();
      turno=1;
    }
  }
}

//Creo una función que dibuja el tablero basado Array 2D
void dibujarTablero() {
  

  //imagen de fondo
  background(fondo);
 

  //Texto lateral
  textoLateral();

  //boton link
  boton();

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
        textSize(200);
        textAlign(LEFT);
        text("X", (x*200)+30, (y*200)+175);
      }
    }
  }
}

//Función para establecer el estado de los casilleros del juego
void estadoJuego() {
  //Contador para el empate
  //Loop que revisa las columnas
  for (x = 0; x <= 2; x++) {
    //Loop que revisa las filas
    for (y = 0; y <= 2; y++) {
      if (casillero[x][y] != 0) {
        cnt++;
      }
    }
  }
  //Loop que revisa las columnas
  for (x = 0; x <= 2; x++) {
    //Loop que revisa las filas
    for (y = 0; y <= 2; y++) {
      //si la columna tiene la misma ficha en sus tres casilleros
      if ((casillero [x][0] == casillero [x][1] && casillero [x][1] == casillero [x][2] && casillero [x][1]!= 0)
        //si la fila tiene la misma ficha en sus tres casilleros
        || (casillero [0][y] == casillero [1][y] && casillero [1][y] == casillero [2][y] && casillero [1][y]!= 0)
        //si la diagonal tiene la misma ficha en sus tres casilleros
        || (casillero [0][0] == casillero [1][1] && casillero [1][1] == casillero [2][2] && casillero [1][1]!= 0)
        //si la otra diagonal tiene la misma ficha en sus tres casilleros
        || (casillero [2][0] == casillero [1][1] && casillero [1][1] == casillero [0][2] && casillero [1][1]!= 0)) {

        //Ganador
        ganador = true;

        //Finalizar juego
        gameOver = true;

        //modo no jugable
        modo = 2;
      }
      //Mostrar pantalla fin del juego
      if (modo == 2) {
        pantallaFinal();
      }
    }
  }
  if (cnt == 9 && ganador == false) {
    empate = true;
    modo = 2;
    empate();
    println("entre al empate");
  }
  cnt=0;
}


void pantallaFinal() {
  //gana X
  if (turno == 1) {
    textSize (100);
    fill(80);
    textAlign(CENTER);
    text ("Ganó X", 300, 250);
    textSize(50);    
    text("Fin del juego", 300, 350); 
    text ("Volver a Jugar", 300, 530);
    
    //gana O
  } else if (turno == 2) {
    textSize (100);
    fill(80);
    textAlign(CENTER);
    text ("Ganó O", 300, 250);
    textSize(50);
    text("Fin del juego", 300, 350); 
    text ("Clic para", 300, 480);
    text ("Volver a Jugar", 300, 530);
  }
}

void empate() {
  if (empate) {
    textSize (100);
    fill(80);
    textAlign(CENTER);
    text ("Empate", 300, 250);
    textSize(50);
    
    text("Fin del juego", 300, 350); 
    text ("Clic para", 300, 480);
    text ("Volver a Jugar", 300, 530);

  }
}

void reiniciarJuego() {
  reset();
}

void mousePressed() {
  /*Al hacer clic devuelve dos numeros entre 0 y 2.
   Con estos datos se define la posición de las fichas.
   println (mouseX/200, mouseY/200);
   */
  println (mouseX, mouseY);
  if (boton) {
    link("http://www.instagram.com/da.sa.se");
  }

  //modalidad de juego 1. jugable
  if (modo == 1) {
    //Los clics fuera del tablero no dan error
    if (mouseX<600) {
      //Sólo coloca ficha si el espacio está vacío
      if (casillero [mouseX/200][mouseY/200] == 0) {
        //Cambia de jugador por turno
        casillero [mouseX/200][mouseY/200] = turno;
        if (turno == 1) {
          //cuando termina el turno 1, pasa al 2
          turno = 2;
         
        }
      }
    }

    //Modalidad de juego 2. Game over
  } else if (modo == 2) {
    boton();
    reiniciarJuego();
    
  }
}
