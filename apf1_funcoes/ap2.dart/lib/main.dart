import 'dart:math';

import 'package:ap2dart/resposta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  //cores do botões padrões
  Color? corBotao1 = Colors.white;
  Color? corBotao2 = Colors.white;
  Color? corBotao3 = Colors.white;

  int contador = 0;
  bool mostrarBackgroundVermelho = false;
  bool mostrarBackgroundVerde = false;

  int gerandoAleatorio() { //quando chamado vai gerar numero de até 3
    return Random().nextInt(3);
  }

    //Este metodo ira retornar uma cor, vai houver condições  para que no final a cor seja necessaria da conclussão
  Color botaoCorreto(int botao, int aleatorio, int contador) {
    if (botao != aleatorio) {
      if (botao != aleatorio && contador == 1) {
        mostrarBackgroundVermelho = true;
      }
      return Colors.red;
    } else if (botao == aleatorio) {
      mostrarBackgroundVerde = true;

      return Colors.green;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget respostaWidget; //Vai armazenar um widget

    //Essa condição verifica se é verdadeira, se for passara por parametros da classe retornara um widget
    if (mostrarBackgroundVermelho) {
      respostaWidget = AnalisandoResposta(
          'Você Errou!', Colors.red, const Color.fromARGB(255, 126, 8, 8));
    } else if (mostrarBackgroundVerde) {
      respostaWidget = AnalisandoResposta('Você Acertou!', Colors.green,
          const Color.fromARGB(255, 128, 255, 82));
    } else {
      respostaWidget = SizedBox();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          width: 500, // Definindo largura
          height: 800, //Definindo tamnanho
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //botao1
              ElevatedButton(
                //Ao pressionar tal botao, estarei guardando o retorno do metodo que retornara se é certo ou errado
                onPressed: () {
                  setState(() {
                    //estarei recebendo como retorno a cor verde ou vermelho que automaticamente ira para estilização da cor do botão
                    corBotao1 = botaoCorreto(0, gerandoAleatorio(), contador);
                    //automaticamente tambem apos pressionar o botão, o os outros botões voltarão a ter sua cor padrão
                    corBotao2;
                    corBotao3;

                    //Se o botão for errado(vermelho) ira acrementar no contador
                    if (corBotao1 == Colors.red) {
                      contador++;
                    }
                  });
                },
                child: Text('Botão 1'),
                style: ElevatedButton.styleFrom(primary: corBotao1),
              ),

              //botao2
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    corBotao2 = botaoCorreto(1, gerandoAleatorio(), contador);
                    corBotao1 = Colors.white;
                    corBotao3 = Colors.white;

                    if (corBotao2 == Colors.red) {
                      contador++;
                    }
                  });
                },
                child: Text('Botão 2'),
                style: ElevatedButton.styleFrom(primary: corBotao2),
              ),

              //botao3
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    corBotao3 = botaoCorreto(2, gerandoAleatorio(), contador);
                    corBotao1 = Colors.white;
                    corBotao2 = Colors.white;

                    if (corBotao3 == Colors.red) {
                      contador++;
                    }
                  });
                },
                child: Text('Botão 3'),
                style: ElevatedButton.styleFrom(primary: corBotao3),
              ),
              respostaWidget,
            ],
          ),
        ),
      ),
    );
  }
}
