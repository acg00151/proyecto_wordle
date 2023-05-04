import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'lector_palabras.dart';

class ListaPalabras {

  ListaPalabras(){
    //llenarLista();
  }


  List<List<String>> listaP =
      []; //new List<List<String>>.filled(11,List<String>.filled(0, 'a',growable: true));

  Future<void> llenarLista() async {
    List<List<String>> aux2 = await cargarPalabras();
    for (int i = 0; i < aux2.length; ++i) {
      listaP.add(aux2.elementAt(i));
    }
  }

  Future<String> generarPalabra() async {
    //llenarLista();
    final prefs = await SharedPreferences.getInstance();

    int aux =
        (prefs.getInt('idioma') ?? 0) * 3 + (prefs.getInt('longitud') ?? 4) - 4;
    return listaP
        .elementAt(aux)
        .elementAt(Random().nextInt(listaP.elementAt(aux).length));
  }
}
