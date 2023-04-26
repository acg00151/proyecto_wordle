import 'package:flutter/material.dart';
import 'package:proyecto_wordle/modelo/puntuacion.dart';

class Ranking {
  late List<Puntuacion> puntuaciones;

  Ranking(String fuente) {
    if (fuente.isEmpty) {
      puntuaciones = <Puntuacion>[];
    } else {
      final splitted = fuente.split(';');
      while (splitted.isNotEmpty) {
        puntuaciones.add(Puntuacion(
            puntos: int.parse(splitted[0]),
            idioma: splitted[1],
            intentos: int.parse(splitted[2]),
            pistas: int.parse(splitted[3])));
      }
    }
  }
}
