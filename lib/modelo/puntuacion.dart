class Puntuacion {
  final int puntos;
  final String idioma;
  final int intentos;
  final int longitud;

  Puntuacion({
    required this.idioma,
    required this.puntos,

    required this.longitud,
    required this.intentos,
  });

  String toCSV() {
    return ("$puntos,$idioma,$intentos,$longitud,\n");
  }

  int calcularPuntuacion() {
    return (100  + longitud * 10 - intentos);
  }
String getDatos(){
    String aux =   "Puntos : $puntos idioma:$idioma intentos $intentos longitud $longitud ";
  return aux;
}

}
