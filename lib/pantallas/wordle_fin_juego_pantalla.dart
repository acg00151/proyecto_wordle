import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
class WordleFinJuegoPantalla extends StatelessWidget {
  const WordleFinJuegoPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Fin de Partida",
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,

      home:Scaffold(

        appBar: AppBar(
          title: const Text('Fin de Partida'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),

          ),
        ),
      ),
    );
  }
}
