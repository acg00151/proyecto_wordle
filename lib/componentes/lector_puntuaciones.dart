import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_wordle/modelo/puntuacion.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/assets/fichero');
}

Future<File> GuardarPuntuacion(Puntuacion p) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString(p.toCSV());
}

Future<String> cargarPuntuacion() async {
  try {
    final file = await _localFile;

    // Read the file
    final contents = await file.readAsString();

    return contents.toString();
  } catch (e) {
    // If encountering an error, return 0
    return "";
  }
}