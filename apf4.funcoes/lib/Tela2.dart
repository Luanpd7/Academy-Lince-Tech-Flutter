import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  static const nomeRota = '/tela2';


  @override
  Widget build(BuildContext context) {
      //Declarando a rota para passar a informações das cores
         final corRecebida = ModalRoute.of(context)?.settings.arguments as Color?;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Tela 2'),
        
      ),
       backgroundColor: corRecebida,  //colocar o argumento
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          ElevatedButton(onPressed: () {
            Navigator.pop(context);
          }, 
          child: Text('Voltar')),
        ],
      ) ,
    );
    
  }
}