
import 'package:proyecto_wordle/modelo/puntuacion.dart';

import '../componentes/lector_puntuaciones.dart';

class Ranking {
  late List<Puntuacion> puntuaciones = [];

  Ranking(){
    creaRanking();
  }

  Future<void> creaRanking() async {
    List<List<String>> fuente = await cargarPuntuacion();

    if (fuente.isEmpty) {
      puntuaciones = <Puntuacion>[];
    } else {
      for (int i = 0; i < fuente.length; ++i) {
        puntuaciones.add(Puntuacion(
            puntos: int.parse(fuente.elementAt(i).elementAt(0)),
            idioma: fuente.elementAt(i).elementAt(1),
            intentos: int.parse(fuente.elementAt(i).elementAt(2)),
            pistas: int.parse(fuente.elementAt(i).elementAt(3)),
            longitud: int.parse(fuente.elementAt(i).elementAt(4))));
      }
    }
  }

  void addPuntuacion(Puntuacion p) {
    if (p.puntos > puntuaciones.elementAt(0).puntos) {
      puntuaciones.add(puntuaciones.last);
      for (int i = puntuaciones.length ; i < 1; --i) {
        puntuaciones.insert(i, puntuaciones.elementAt(i - 1));
      }
      puntuaciones.insert(0, p);
    }
    for (int i = 1; i < puntuaciones.length; ++i) {
      if (p.puntos > puntuaciones.elementAt(i).puntos &&
          p.puntos < puntuaciones.elementAt(i - 1).puntos) {
        puntuaciones.add(puntuaciones.last);
        for (int j = puntuaciones.length - 1; j < 1; --j) {
          puntuaciones.insert(i, puntuaciones.elementAt(i - 1));
        }
        puntuaciones.insert(i, p);
        return;
      }
    }
    puntuaciones.add(p);
  }
}
