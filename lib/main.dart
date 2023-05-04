import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:proyecto_wordle/wordle_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Settings.init(cacheProvider: SharePreferenceCache());
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const WordleApp());
}

Future<void> comprobarPreferencias() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString('TemaOscuro') != null) {
    prefs.setString('TemaOscuro', 'ThemeMode.system');
  }
}
