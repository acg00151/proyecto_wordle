import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordleOpcionesPantalla extends StatefulWidget {
  const WordleOpcionesPantalla({Key? key}) : super(key: key);

  @override
  State<WordleOpcionesPantalla> createState() => _WordleOpcionesPantallaState();
}

class _WordleOpcionesPantallaState extends State<WordleOpcionesPantalla> {
  static const keyLanguage = 'key-language';
  static const keyTemaOscuro = 'key-Tema-Oscuro';
  static const keyLongitud = '4';


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
                  buildLongitud(),
                ],
              ),
              SettingsGroup(
                title: 'Tema ',
                children: <Widget>[
                  buildTemaOscuro(),
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
          4: 'Frances',
        },
        onChange: (language) async {
          debugPrint('Se ha cambiado el idioma a: $language');
          final prefs = await SharedPreferences.getInstance();
          prefs.setInt('idioma', language);
        },
      );

  Widget buildLongitud() => SliderSettingsTile(
        title: 'Longitud de las palabras',
        settingKey: keyLongitud,
        defaultValue: 4,
        min: 4,
        max: 6,
        step: 1,
        onChange: (value) async {
          debugPrint('Se ha cambiado la longitud a: $value');
          final prefs = await SharedPreferences.getInstance();
          prefs.setInt('longitud', value.round());
        },
      );

  Widget buildTemaOscuro() => SwitchSettingsTile(
        title: 'Tema Oscuro',
        settingKey: keyTemaOscuro,
        onChange: (value) async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('TemaOscuro', value);
        },
      );
}
