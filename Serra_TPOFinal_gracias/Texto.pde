//declaro variables de texto
String uno;
String dos;
String tres;
String cuatro;
String cinco;
String seis;
String siete;
String ocho;
String nueve;
String diez;
String once;

//inicio función texto
void textoLateral() {  
  //Rectangulo sin relleno que contiene el texto
  noFill();
  stroke(255);
  rect (630, 20, 250, 560);
  //Llamo las variables y redacto
  uno = "*****";
  dos = "¡Gracias";
  tres = "por jugar!";
  cuatro = "UwU";
  cinco = "***";
  seis = "Ta Te Ti";
  siete = "Interactivo";
  ocho = "***";
  nueve = "Desarrollado por";
  once = "*****";
  fill (255);
  textSize(50);
  textAlign(CENTER);
  text(uno, 755, 50);
  text(dos, 755, 100);
  text(tres, 755, 160);
  text (cuatro, 755, 230);
  text (cinco, 755, 300);
  text (seis, 755, 340);
  text (siete, 755, 400);
  text (ocho, 755, 460);
  textSize(30);
  text (nueve, 755, 490);
  textSize(50);
  text(once, 755, 610);
}
