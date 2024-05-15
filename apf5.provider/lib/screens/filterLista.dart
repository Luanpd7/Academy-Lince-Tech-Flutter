import 'package:ap1_dart/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ap1_dart/components/viewItens.dart';

class FilterLIst extends StatelessWidget{
 late  String nome;
 
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Filtrando da lista'),
      ),
      body: Expanded( // Envolve o ListView.builder com Expanded
          child: Consumer<EstadoListaDePessoas>(
         
            builder: (context, estadoLista, _) {
              // Verifica se há pessoas na lista
              //final pessoa = estadoLista.pessoasEcontrada[0];
               return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    TextField(
      decoration: InputDecoration(labelText: 'Pesquisar'),
      onChanged: (value) => nome = value,
    ),
    IconButton(
      onPressed: () {
        estadoLista.pesquisar(nome);
      },
      icon: Icon(Icons.search),
    ),
     if (estadoLista.pessoasEcontrada.isEmpty)
      Center(
        child: Text('Nenhuma pessoa encontrada'),
      ) else
      Container(
        
        height: 200,
        width: 500,
       
        child: Column (
             
          children: [
            ViewItens(item: 'Nome', valor: 'nome', pessoa: estadoLista.pessoasEcontrada[0]),

           ViewItens(item: 'E-mail', valor: 'email', pessoa: estadoLista.pessoasEcontrada[0]),
          ViewItens(item: 'Telefone', valor: 'telefone', pessoa: estadoLista.pessoasEcontrada[0]),
           ViewItens(item: 'Git', valor: 'github', pessoa: estadoLista.pessoasEcontrada[0]),
           ViewItens(item: 'Tipo sanguíneo', valor: 'tipoSanguineo', pessoa: estadoLista.pessoasEcontrada[0]),
           
          
        ],),
      )
      
    
    
    /*if (estadoLista.pessoas.isEmpty)
      Center(
        child: Text('Nenhuma pessoa encontrada'),
      )
    else
      Expanded(
        child: ListView.builder(
          itemCount: estadoLista.pessoasEcontrada.length,
          itemBuilder: (context, index) {
            final pessoa = estadoLista.pessoasEcontrada[index];
            return ListTile(
              title: Text(pessoa.nome),
              subtitle: Text(pessoa.email),
              leading: Text(index.toString()),
             
            );
          },
        ),
      ),*/
  ],
);

                

             
            },
          ),
        ),
    );
  }
}