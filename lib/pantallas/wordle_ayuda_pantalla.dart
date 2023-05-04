import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';

class WordleAyudaPantalla extends StatelessWidget {
  const WordleAyudaPantalla({Key? key}) : super(key: key);
  static const textStyle = TextStyle(
    color: Colors.black,
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.5,
    wordSpacing: 3.0,
    shadows: [
      Shadow(
        color: Colors.grey,
        blurRadius: 2.0,
        offset: Offset(1.0, 1.0),
      ),
    ],
  );
  static const tittleStyle = TextStyle(
    color: Colors.black,
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.5,
    wordSpacing: 3.0,
    shadows: [
      Shadow(
        color: Colors.grey,
        blurRadius: 2.0,
        offset: Offset(1.0, 1.0),
      ),
    ],
  );

  static const List<String> bufferLetras = ["y", "o", "g", "u", "r", "t"];

  @override
  Widget build(BuildContext context) {

    const List<Color> coloresClaro = [
      Colors.white,
      Color.fromARGB(255, 3, 218, 198),
      Colors.white,
      Color.fromARGB(255, 98, 0, 238),
      Colors.white,
      Colors.grey,
    ];
    const List<Color> coloresOscuro = [
      Colors.white,
      Color.fromARGB(255, 3, 218, 198),
      Colors.white,
      //Color.fromARGB(255, 186, 134, 252),
      Color.fromARGB(255, 186, 134, 0),
      Colors.white,
      Colors.grey,
    ];

    List<Color> colores = [];
    if(ThemeMode.system == WordleTema.claro()){
      colores.addAll(coloresClaro);
    }else {
      colores.addAll(coloresOscuro);
    }

    /*const String tema = "oscuro";
    List<Color> colores = [];
    if (tema == "claro") {
      colores.addAll(coloresClaro);
    } else {
      colores.addAll(coloresOscuro);
    }*/


    return MaterialApp(
      title: "Ayuda",
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Como jugar'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Reglas: ",
                  style: tittleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Adivina la palabra\n A elegir en el menu de opciones:\n * Palabras entre 4 y 6 letras\n * Entre 5 y 8 intentos",
                  style: textStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ejemplo: ",
                  style: tittleStyle,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 6,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    padding: EdgeInsets.all(8.0),
                    children: List.generate(
                      bufferLetras.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: colores[index],
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: Center(
                          child: Text(bufferLetras[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "* La u (violeta) esta en la palabra y esta en su sitio\n* La o (turquesa) esta en la palabra pero en otra posición\n* La t (gris) no esta en la palabra",
                  style: textStyle,
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Volver'),
                ),
              ),
            ],
          )),
    );
  }
}
