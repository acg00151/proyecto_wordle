import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';

class WordleOpcionesPantalla extends StatefulWidget {
  const WordleOpcionesPantalla({Key? key}) : super(key: key);

  @override
  State<WordleOpcionesPantalla> createState() => _WordleOpcionesPantallaState();
}

class _WordleOpcionesPantallaState extends State<WordleOpcionesPantalla> {
  static const keyLanguage = 'key-language';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Opciones",
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Opciones'),
        ),
        body: Center(
          child: ListView(
            padding: EdgeInsets.all(24),
            children: [
              SettingsGroup(
                title: 'GENERAL',
                children: <Widget>[
                  buildLanguage(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLanguage() => DropDownSettingsTile(
        title: 'Idioma de las palabras',
        settingKey: keyLanguage,
        selected: 1,
        values: <int, String>{
          1: 'Español',
          2: 'Ingles',
          3: 'Aleman',
        },
        onChange: (language) {},
      );
}
