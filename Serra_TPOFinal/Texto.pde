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
String doce;
String trece;
String catorce;
String quince;
String dieciseis;

//inicio función texto
void textoLateral() {  
  //Rectangulo sin relleno que contiene el texto
  noFill();
  stroke(255);
  rect (630, 20, 250, 560);
  //Llamo las variables y redacto
  uno = "*****";
  dos = "Ta Te Ti";
  tres = "Interactivo";
  cuatro = "***";
  cinco = "1 jugador";
  seis = "VS";
  siete = "Computadora";
  ocho = "Instrucciones";
  nueve = "- Clic para jugar.";
  diez = "- Para Ganar:";
  catorce = "completar 3";
  quince = "casilleros";
  dieciseis = "seguidos";
  
  
  
  once = "***";
  doce = "Desarrollado por";
  trece = "*****";
  fill (255);
  textSize(50);
  textAlign(CENTER);
  text(uno, 755, 50);

  text(dos, 755, 80);
  text(tres, 755, 140);

  text (cuatro, 755, 200);

  textSize(40);
  text (ocho, 755, 230);
  textSize(30);
  text (nueve, 755, 270);
  text (diez, 755, 310);
  text (catorce, 755, 340);
  text (quince, 755, 370);
  text (dieciseis, 755, 400);
  
  textSize(50);
  text(once, 755, 470);
  textSize(30);
  text(doce, 755, 500);
  textSize(50);
  text(trece, 755, 610);
}
