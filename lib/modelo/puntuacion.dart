



class Puntuacion {
  final int puntos;
  final String idioma;
  final int intentos;
  final int pistas;

  Puntuacion({
    required this.puntos,
    required this.idioma,
    required this.intentos,
    required this.pistas,
  });

  String toCSV(){
    return(this.puntos.toString() +";" +
        this.idioma.toString() +";" +
        this.intentos.toString() +";" +
        this.pistas.toString() +";" +
        "\n");
  }


}
