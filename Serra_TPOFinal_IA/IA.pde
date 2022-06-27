void ia () {
  //Si ia == true
  if (ia) {
    //elige un numero automáticamente
    x = int(random(0, 3));
    y = int(random(0, 3));
    casillero[x][y] = turno;
  }
}
