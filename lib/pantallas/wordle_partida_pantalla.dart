import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:proyecto_wordle/componentes/lista_palabras.dart';
import 'package:proyecto_wordle/componentes/lector_puntuaciones.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
import 'package:proyecto_wordle/modelo/puntuacion.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordlePartida extends StatefulWidget {
  @override
  _WordlePartidaState createState() => _WordlePartidaState();
}

class _WordlePartidaState extends State<WordlePartida> {
  ListaPalabras p = ListaPalabras();
  String palabraAdivinar = "";

  List<Color> colores = [
    Color.fromARGB(255, 98, 0, 238),
    Color.fromARGB(255, 3, 218, 198),
    Colors.grey,
    Colors.white
  ];

  String tema = "oscuro";

  int intentos = 5;
  int intentosUsados = 0;
  int intentosRestantes = 0;
  String palabraIntroducida = "";
  List<int> bufferColores = [];
  List<String> bufferLetras = [];
  bool victoria = false;
  bool derrota = false;

  final _textController = TextEditingController();
  String _inputText = '';

  Stopwatch stopwatch = Stopwatch();
  String elapsedTime = '';

  int puntuacion = 0;
  String idioma = "";

  final myTextStyle = TextStyle(
  //  color: Colors.black,
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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('¿Abandonas la partida?'),
            content: Text('Esto eliminará todo el progreso'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Sí'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: inicio(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se puede conectar con el servidor'),
            );
          } else {
            intentosRestantes = intentos - intentosUsados;

            if (victoria) {
              stopwatch.stop();
              calculoTiempo();
              calculoPuntuacion();
              GuardarPuntuacion(Puntuacion(
                  idioma: idioma,
                  puntos: puntuacion,
                  longitud: palabraAdivinar.length,
                  intentos: intentos));
              return MaterialApp(
                  title: "Victoria",
                  theme: WordleTema.claro(),
                  darkTheme: WordleTema.oscuro(),
                  themeMode: ThemeMode.system,
                  home: Scaffold(
                      appBar: AppBar(
                        title: const Text(''),
                      ),
                      body: Center(
                        //color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("¡HAS GANADO!", style: myTextStyle),
                            Text("La palabra era: $palabraAdivinar",
                                style: myTextStyle
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Has tardado $elapsedTime segundos",
                                style: myTextStyle),
                            Text("Puntuacion: $puntuacion", style: myTextStyle),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Volver'),
                            )
                          ],
                        ),
                      )));
            }
            if (derrota) {
              stopwatch.stop();
              return MaterialApp(
                  title: "Derrota",
                  theme: WordleTema.claro(),
                  darkTheme: WordleTema.oscuro(),
                  themeMode: ThemeMode.system,
                  home: Scaffold(
                      appBar: AppBar(
                        title: const Text(''),
                      ),
                      body: Center(
                        //color: Colors.white,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Has perdido", style: myTextStyle),
                            Text("La palabra era: $palabraAdivinar",
                                style: myTextStyle),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Volver'),
                            )
                          ],
                        ),
                      )));
            }

            return MaterialApp(
                title: "Partida",
                theme: WordleTema.claro(),
                darkTheme: WordleTema.oscuro(),
                themeMode: ThemeMode.system,
                home: Scaffold(
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      WillPopScope(child: Column(), onWillPop: _onWillPop),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _inputText = _textController.text;
                              intento();
                            });
                          },
                          child: Text('Intentos: $intentosRestantes'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.count(
                            crossAxisCount: palabraAdivinar.length,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            padding: EdgeInsets.all(8.0),
                            children: List.generate(
                              bufferLetras.length,
                              (index) => Container(
                                decoration: BoxDecoration(
                                  color: colores[bufferColores[index]],
                                  border: Border.all(
                                    //              color: Colors.black,
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
                        child: TextField(
                          controller: _textController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Palabra',
                          ),
                        ),
                      ),
                    ],
                  ),
                ));
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<void> inicio() async {
    await p.llenarLista();
    Random random = new Random();
    if (intentosUsados == 0) {
      final prefs = await SharedPreferences.getInstance();
      intentos = prefs.getInt('intentos') ?? 5;
      idioma = prefs.getString('idiomaString') ?? 'ESP';
      palabraAdivinar = await p.generarPalabra();
      debugPrint("La palabra generada es $palabraAdivinar");
      List<String> aux = [];
      for (int i = 0; i < palabraAdivinar.length; i++) {
        aux.add("");
      }
      for (int i = 0; i < 2; i++) {
        int r = random.nextInt(palabraAdivinar.length);
        aux[r] = palabraAdivinar[r];
      }
      bufferLetras.addAll(aux);
      for (int i = 0; i < palabraAdivinar.length; i++) {
        bufferColores.add(3);
      }
    }
    stopwatch.start();
  }

  void intento() {
    intentosUsados++;
    if (_inputText.length == palabraAdivinar.length) {
      print("Palabra introducida: $_inputText");
      print("Intentos usados: $intentosUsados");
      List<String> sp = [];
      sp = _inputText.split("");
      for (int i = 0; i < sp.length; i++) {
        print(sp[i]);
        if (sp[i] == palabraAdivinar[i]) {
          bufferColores.add(0);
        } else {
          if (palabraAdivinar.contains(sp[i])) {
            bufferColores.add(1);
          } else {
            bufferColores.add(2);
          }
        }
      }
      bufferLetras.addAll(sp);
    }
    if (intentosUsados == intentos) {
      derrota = true;
    }
    if (_inputText == palabraAdivinar) {
      victoria = true;
    }
  }

  void calculoTiempo() {
    elapsedTime = stopwatch.elapsed.inSeconds.toString();
  }

  void calculoPuntuacion() {
    puntuacion = (intentosRestantes /
            stopwatch.elapsed.inSeconds *
            palabraAdivinar.length *
            1000)
        .toInt();
  }
}
