import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
import 'package:proyecto_wordle/pantallas/pantallas.dart';
import 'package:proyecto_wordle/componentes/iconos.dart';

class WordleMenuPrincipal extends StatelessWidget {
  const WordleMenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titulo = 'Wordle';
    final double anchoBotones = 350;
    final double altoBotones = 40;
    final double altoSeparacion = 20;

    return MaterialApp(
      title: titulo,
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Transform.translate(
                  offset: Offset(0, -50),
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Image.asset('assets/Wordle.png'),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: anchoBotones,
                    height: altoBotones,
                    child: ElevatedButton(
                      child: Text('Iniciar partida'),
                      onPressed: () {
                        // Respond to button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WordleRankingPantalla()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: altoSeparacion),
                  SizedBox(
                    width: anchoBotones,
                    height: altoBotones,
                    child: ElevatedButton(
                      child: Text('Puntuaciones'),
                      onPressed: () {
                        // Respond to button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WordleRankingPantalla()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: altoSeparacion),
                  SizedBox(
                    width: anchoBotones,
                    height: altoBotones,
                    child: ElevatedButton(
                      child: Text('Opciones'),
                      onPressed: () {
                        // Respond to button press
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WordleOpcionesPantalla()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const WordleAyudaPantalla()),
            );
          },
          child: Icon(Iconos.help),
        ),
      ),
    );
  }
}
