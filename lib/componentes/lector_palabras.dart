import 'dart:async';
import 'dart:io';

import 'package:csv/csv.dart';

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

Future<List<File>> get _ficherosCSV async {
  final path = await _localPath;
  //  aqui podriamos poner un bucle  uqe lo hiciera bien pero no hay tiempo
  List<File> aux = [];
  aux.add(File('$path/assets/csv/ESP4.csv'));
  aux.add(File('$path/assets/csv/ESP5.csv'));
  aux.add(File('$path/assets/csv/ESP6.csv'));
  aux.add(File('$path/assets/csv/ENG4.csv'));
  aux.add(File('$path/assets/csv/ENG5.csv'));
  aux.add(File('$path/assets/csv/ENG6.csv'));
  aux.add(File('$path/assets/csv/ALE4.csv'));
  aux.add(File('$path/assets/csv/ALE5.csv'));
  aux.add(File('$path/assets/csv/ALE56.csv'));
  aux.add(File('$path/assets/csv/FRN4.csv'));
  aux.add(File('$path/assets/csv/FRN5.csv'));
  aux.add(File('$path/assets/csv/FRN6.csv'));
  return aux;
}

Future<File> GuardarPuntuacion(Puntuacion p) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString(p.toCSV());
}

Future<List<List<String>>> cargarPalabras() async {
  List<List<String>> aux = [];
  try {
    final file = await _ficherosCSV;

    // Read the file
    for (int i = 0; i < file.length; ++i) {
      final contents = await file.elementAt(i).readAsString();
      aux.add(const CsvToListConverter()
          .convert(contents.toString())
          .cast<String>());
    }

    return aux;
  } catch (e) {
    // If encountering an error, return 0
    return aux;
  }
}
