import 'package:ap1_dart/components/viewItens.dart';
import 'package:ap1_dart/main.dart';
import 'package:flutter/material.dart';

class ScreenViewItens extends StatelessWidget {
 
  Pessoa pessoa;

  ScreenViewItens({required this.pessoa});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Visualizando Dados'),),
      ),
       body:  Center(
         child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 2, )),
           child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
                ViewItens(item: 'Nome', valor: 'nome', pessoa: pessoa),
                ViewItens(item: 'Emai-l', valor: 'email', pessoa: pessoa),
                ViewItens(item: 'Telefone', valor: 'telefone', pessoa: pessoa),
                ViewItens(item: 'Git', valor: 'github', pessoa: pessoa),
                ViewItens(item: 'Tipo Sanguíneo', valor: 'tipoSanguineo', pessoa: pessoa),
             ],
           ),
         ),
       ),
     );
  }
}