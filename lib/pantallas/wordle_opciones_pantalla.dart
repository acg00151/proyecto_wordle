import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
class WordleOpcionesPantalla extends StatelessWidget {
  const WordleOpcionesPantalla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: "Opciones",
        theme: WordleTema.claro(),
        darkTheme: WordleTema.oscuro(),
        themeMode: ThemeMode.system,

        home:Scaffold(

      appBar: AppBar(
        title: const Text('Opciones'),
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
