class Puntuacion {
  final int puntos;

  final String idioma;
  final int intentos;
  final int pistas;
  final int longitud;

  Puntuacion({
    required this.idioma,
    required this.puntos,
    required this.pistas,
    required this.longitud,
    required this.intentos,
  });

  String toCSV() {
    return ("$puntos,$idioma,$intentos,$pistas,$longitud,\n");
  }

  int calcularPuntuacion() {
    return (100 - pistas * 10 + longitud * 10 - intentos);
  }
List<String> getDatos(){
  List<String> aux =   ["$puntos","$idioma","$intentos","$pistas","$longitud"];
  return aux;
}

}
