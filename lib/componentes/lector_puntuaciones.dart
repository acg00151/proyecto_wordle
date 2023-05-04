import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import 'package:proyecto_wordle/modelo/puntuacion.dart';
import 'package:proyecto_wordle/modelo/ranking.dart';

String ficheroCSV() {
  return ('assets/records.csv');
}
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/' + ficheroCSV());
}

Future<File> GuardarPuntuacion(Puntuacion p) async {
  final file = File(ficheroCSV());

  // Write the file
  return file.writeAsString(p.toCSV());
}

Future<File> GuardarPuntuaciones(Ranking r) async {
  final file = File('assets/records.csv');

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

    String contents = await rootBundle.loadString(ficheroCSV());
    debugPrint('Leyendo el fichero CSV  de puntuaciones');
    List<String> listaAux = contents.split('\n');

    for (int i = 0; i < listaAux.length; ++i) {
      aux2.add(listaAux.elementAt(i).split(','));
    }
  } catch (e) {
    // If encountering an error, return 0
    return aux2;
  }
  return aux2;
}
