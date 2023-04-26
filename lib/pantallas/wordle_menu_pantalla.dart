import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
import 'package:proyecto_wordle/pantallas/pantallas.dart';
import 'package:proyecto_wordle/componentes/iconos.dart';

class WordleMenuPrincipal extends StatelessWidget {
  const WordleMenuPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titulo = 'Wordle';

    return MaterialApp(
      title: titulo,
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        body: Container(

          width: double.infinity,
          height: 600,
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Image.asset("assets/image-name"),
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                height: 80,
                width: 350,
                child: ElevatedButton(

                  child: Text('Iniciar partida'),
                  onPressed: () {
                    // Respond to button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WordlePartidaPantalla()),
                    );
                  },
                ),
              ),
              ElevatedButton(
                child: Text('Opciones'),
                onPressed: () {
                  // Respond to button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WordleOpcionesPantalla()),
                  );
                },
              ),
              ElevatedButton(
                child: Text('Rankings'),
                onPressed: () {
                  // Respond to button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WordleRankingPantalla()),
                  );
                },
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
