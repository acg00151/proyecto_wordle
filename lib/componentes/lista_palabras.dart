import 'dart:math';

import 'lector_palabras.dart';

class ListaPalabras {
  List<List<String>> listaP = [];

  void llenarLista() async {
    listaP = await cargarPalabras();
  }

  String generarPalabra() {
    return listaP
        .elementAt(0)  //TODO cambiar por la variable de Idioma y logitud
        .elementAt(Random().nextInt(listaP.elementAt(0).length));  //TODO cambiar por la variable de Idioma y logitud
  }


}
