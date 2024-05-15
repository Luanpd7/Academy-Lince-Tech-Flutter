import 'package:ap1_dart/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Remove extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Removendo da lista'),
      ),
      body: Expanded( 
          child: Consumer<EstadoListaDePessoas>(
            builder: (context, estadoLista, _) {
      
              if (estadoLista.pessoas.isEmpty) {
                return Center(
                  child: Text('Nenhuma pessoa cadastrada'),
                );
              } else {
          
                return ListView.builder(
                  itemCount: estadoLista.pessoas.length,
                  itemBuilder: (context, index) {
                    final pessoa = estadoLista.pessoas[index];
                    
                    return ListTile(
                     title: Text(pessoa.nome),
                      subtitle: Text(pessoa.email),
                      leading: Text(index.toString()),
                      trailing: IconButton(onPressed: () { 
                        estadoLista.excluir(pessoa);
                      }, icon: const Icon(Icons.delete)),
                    );
                  },
                );
              }
            },
          ),
        ),
    );
  }
}