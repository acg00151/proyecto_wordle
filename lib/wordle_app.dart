import 'package:flutter/material.dart';
import 'package:proyecto_wordle/pantallas/wordle_menu_pantalla.dart';

class WordleApp extends StatelessWidget {
  const WordleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: WordleMenuPrincipal(),
      );
}
