import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
class WordleAyudaPantalla extends StatelessWidget {
  const WordleAyudaPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Ayuda",
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,

      home:Scaffold(

        appBar: AppBar(
          title: const Text('Ayuda'),
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