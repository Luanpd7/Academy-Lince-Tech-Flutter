import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Mudando Formato'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Color> listaCoresAleatorias = [
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.blueGrey
  ];
  dynamic cor = Colors.blue;
  final random = Random();

  var quadrado = true;

     // Retorna o texto do botão com base no estado atual do quadrado         
  String get textoBotao =>
      quadrado ? 'Mudar para círculo' : 'Mudar para quadrado';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
             // Linha com os botões
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
                       // Botão para mudar o formato do contêiner
            ElevatedButton(
              onPressed: () {
                setState(() {
                  quadrado = !quadrado;
                });
              },
              child: Text(
                textoBotao,
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  //Ao clicar vai sortear uma cor
                  cor = listaCoresAleatorias[
                      random.nextInt(listaCoresAleatorias.length)];
                });
              },
              child: Text(
                'Cor Aleatoria',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ],
        ),
        const SizedBox(height: 30),
          // Contêiner que pode ser um quadrado ou um círculo
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: quadrado ? BoxShape.rectangle : BoxShape.circle,
                  color: cor,
                ),
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
