import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'package:proyecto_wordle/modelo/puntuacion.dart';
import 'package:proyecto_wordle/modelo/ranking.dart';

String ficheroCSV() {
  return ('assets/records.csv');
}

Future<File> get _localFile async {
  return File(ficheroCSV());
}

Future<File> GuardarPuntuacion(Puntuacion p) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString(p.toCSV());
}

Future<File> GuardarPuntuaciones(Ranking r) async {
  final file = await _localFile;

  // Write the file
  for (int i = 0; i < r.puntuaciones.length; ++i) {
    file.writeAsString("\n" + r.puntuaciones.elementAt(i).toCSV());
  }
  return file;
}

Future<List<List<String>>> cargarPuntuacion() async {
  List<List<String>> aux2 = [];
  try {
    // Read the file

    debugPrint('Leyendo el fichero CSV  de puntuaciones');
    String contents = await rootBundle.loadString(ficheroCSV());
    List<String> listaAux = contents.split('\n');

    for (int i = 0; i < listaAux.length-1; ++i) {
      aux2.add(listaAux.elementAt(i).split(','));
    }
  } catch (e) {
    // If encountering an error, return 0
    return aux2;
  }
  return aux2;
}
