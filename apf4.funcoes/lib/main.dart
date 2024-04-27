import 'package:apf1_dart/tela2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        Tela2.nomeRota: (context) => Tela2(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Exercitando'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navegandoTela(Color? corDoBotao) {
    Navigator.pushNamed(context, Tela2.nomeRota, arguments: corDoBotao);
  }

  Widget botoes(Color corDoBotao, String nomeBotaoCor) {
    return ElevatedButton(
      onPressed: () {
        navegandoTela(corDoBotao);
      },
      child: Text(nomeBotaoCor),
      style: ElevatedButton.styleFrom(
          primary: corDoBotao,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ), //deixando quadrado
          padding: EdgeInsets.all(40)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              botoes(Colors.blue, 'Azul'),
              botoes(Colors.red, 'Vermelho'),
              botoes(Colors.yellow, 'Amarelo'),
              botoes(Colors.black, 'Preto'),
              botoes(Colors.brown, 'Marron'),
              botoes(Colors.grey, 'Cinza'),
            ]),
      ),
    );
  }
}
