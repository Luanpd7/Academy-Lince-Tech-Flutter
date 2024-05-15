import 'package:ap1_dart/main.dart';
import 'package:flutter/material.dart';

class ViewItens extends StatelessWidget {
  String item;
  String valor;
  Pessoa pessoa;
  ViewItens({required this.item, required this.valor, required this.pessoa });

   

  @override
  Widget build(BuildContext context)
 {
   String valueToDisplay = '';
    switch (valor) {
      case 'nome':
        valueToDisplay = pessoa.nome;
        break;
      case 'email':
        valueToDisplay = pessoa.email;
        break;
      case 'telefone':
        valueToDisplay = pessoa.telefone;
        break;
      case 'github':
        valueToDisplay = pessoa.github;
        break;
      case 'tipoSanguineo':
        valueToDisplay = pessoa.tipoSanguineo.toString().split('.')[1];
        break;
      default:
        valueToDisplay = '';
    }
    return Row(
   
     children: [
       Text('$item :', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold  ),),
        SizedBox(width: 5),
              Text(valueToDisplay, style: TextStyle(fontSize: 15),)
              
     ],
    );
  }
}