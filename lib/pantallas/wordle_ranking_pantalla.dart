import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
import 'package:proyecto_wordle/modelo/ranking.dart';
class WordleRankingPantalla extends StatefulWidget {
  const WordleRankingPantalla({Key? key}) : super(key: key);

  @override
  State<WordleRankingPantalla> createState() => _WordleRankingPantallaState();
}

class _WordleRankingPantallaState extends State<WordleRankingPantalla> {
  Ranking r= Ranking();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ranking",
      theme: WordleTema.claro(),
      darkTheme: WordleTema.oscuro(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ranking'),
        ),
        body: Center(
          child: Table(
            border: TableBorder.all(),
            children: r.puntuaciones.map((item) {
              return TableRow(
                  children: item.getDatos().map((row) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          row.toString(),
                        ),
                      ),
                    );
                  }).toList());
            }).toList(),
          ),
        ),
      ),
    );
  }
}

