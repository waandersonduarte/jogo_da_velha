import 'package:flutter/material.dart';
import '../testemunho/constantes.dart';
import '../testemunho/tema_app.dart';
import '../paginas/pagina_jogo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: GAME_TITLE,
      theme: themeApp,
      home: GamePage(),
    );
  }
}
