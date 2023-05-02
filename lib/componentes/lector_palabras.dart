import 'dart:async';

import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';
import 'package:proyecto_wordle/modelo/puntuacion.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/assets/ESP4.csv');
}

Future<List<String>> get _ficherosCSV async {
  //  aqui podriamos poner un bucle  uqe lo hiciera bien pero no hay tiempo
  List<String> aux = List<String>.empty(growable: true);
  aux.add('assets/csv/ESP4.csv');
  aux.add('assets/csv/ESP5.csv');
  aux.add('assets/csv/ESP6.csv');
  aux.add('assets/csv/ENG4.csv');
  aux.add('assets/csv/ENG5.csv');
  aux.add('assets/csv/ENG6.csv');
  aux.add('assets/csv/ALE4.csv');
  aux.add('assets/csv/ALE5.csv');
  aux.add('assets/csv/ALE6.csv');
  aux.add('assets/csv/FRN4.csv');
  aux.add('assets/csv/FRN5.csv');
  aux.add('assets/csv/FRN6.csv');
  return aux;
}

Future<File> GuardarPuntuacion(Puntuacion p) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString(p.toCSV());
}

Future<List<List<String>>> cargarPalabras() async {
  List<List<String>> aux2 = [];
  try {
    final List<String> file = await _ficherosCSV;

    debugPrint("Numero de Ficheros CSV " + (await file.length).toString());

    // Read the file
    for (int i = 0; i < await file.length; ++i) {
      debugPrint(
          'Leyendo el fichero CSV $i ' + await file.elementAt(i).toString());
      String contents = await rootBundle.loadString(file.elementAt(i));
      //String contents = await rootBundle.loadString(file.elementAt(i).toString());
      List<String> listaAux = contents.split('\n');
      //var listaCSV =await  CsvToListConverter().convert(contents,textDelimiter: '\n');
      // for (int j = 0; j < listaCSV.length; j++) {
      //   listaP.elementAt(i).add(listaCSV.elementAt(i).elementAt(j) as String);
      // }
      aux2.add(listaAux);

      debugPrint('Se ha llenado la lista $i con ' +
          await file.elementAt(i).toString());
    }
  } catch (e) {
    // If encountering an error, return 0
    debugPrint('ha fallado cargarPalabras');
    return aux2;
  }
  return aux2;
/*  void cargarPalabras() async {

    List<List<String>> aux = [];
    try {
      final file = await _ficherosCSV;

      // Read the file
      for (int i = 0; i < file.length; ++i) {
        String contents = await file.elementAt(i).readAsString();
        aux.add(CsvToListConverter().convert(contents).cast<String>()
        );
        debugPrint('Se ha llenado la lista con '+ file.elementAt(i).toString());
      }

      return aux;
    } catch (e) {
      // If encountering an error, return 0
      debugPrint('ha fallado cargarPalabras');
      return aux;
    }*/
}
