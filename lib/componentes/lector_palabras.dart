import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Future<List<String>> get _ficherosCSV async {
  //  aqui podriamos poner un mapa  que lo hiciera mejor pero no hay tiempo
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

Future<List<List<String>>> cargarPalabras() async {
  List<List<String>> aux2 = [];
  try {
    final List<String> file = await _ficherosCSV;

    debugPrint("Numero de Ficheros CSV " + ( file.length).toString());

    // Read the file
    for (int i = 0; i <  file.length; ++i) {
      debugPrint(
          'Leyendo el fichero CSV $i ' +  file.elementAt(i).toString());
      String contents = await rootBundle.loadString(file.elementAt(i));
      List<String> listaAux = contents.split('\n');

      aux2.add(listaAux);

      debugPrint('Se ha llenado la lista $i con ' +
           file.elementAt(i).toString());
    }
  } catch (e) {
    // If encountering an error, return 0
    debugPrint('ha fallado cargarPalabras');
    return aux2;
  }
  return aux2;
}
