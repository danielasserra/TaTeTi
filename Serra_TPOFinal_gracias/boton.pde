//Código basado en:
//https://processing.org/examples/embeddedlinks.html

//Boton on-off
boolean boton = false;

//Texto del boton
String ig = "Daniela Serra";

//Función botón
void boton() {
  //Si botón on: rellenar 
  if (boton == true) {
    fill(255,99);
  } else {
    noFill();
  }
  //rectángulo y texto del boton
  rect(640, 510, 230, 50);
  textSize(35);
  textAlign(CENTER);
  fill(205, 92, 92);
  text (ig, 755, 548);
}

//al pasar el mouse x encima: rellenar
void mouseMoved() {
  checkButtons();
}
//al hacer clic
void mouseDragged() {
  checkButtons();
}

//el boton sólo funciona en las coordenadas indicadas
void checkButtons() {
  if (mouseX > 640 && mouseX < 870 && mouseY > 510 && mouseY <560) {
    boton = true;
  } else {
    boton = false;
  }
}
