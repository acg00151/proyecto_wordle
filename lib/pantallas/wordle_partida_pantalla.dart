import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';

class WordlePartidaPantalla extends StatelessWidget {
  const WordlePartidaPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Partida ",
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Partida'),
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
