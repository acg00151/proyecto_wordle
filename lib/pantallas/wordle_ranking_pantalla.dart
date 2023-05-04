import 'package:flutter/material.dart';
import 'package:proyecto_wordle/componentes/wordle_tema.dart';
import 'package:proyecto_wordle/modelo/ranking.dart';

class WordleRankingPantalla extends StatefulWidget {
  const WordleRankingPantalla({Key? key}) : super(key: key);

  @override
  State<WordleRankingPantalla> createState() => _WordleRankingPantallaState();
}

class _WordleRankingPantallaState extends State<WordleRankingPantalla> {
  Ranking r = Ranking();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: r.creaRanking(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se puede conectar con el servidor'),
            );
          } else {
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
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      columnWidths: {
                        0: FixedColumnWidth(300)
                      },
                      children: [
                        for (var aux in r.puntuaciones)
                          TableRow(children: [
                            TableCell(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  new Text(aux.getDatos()),
                                ],
                              ),
                            )
                          ])
                      ]),
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
