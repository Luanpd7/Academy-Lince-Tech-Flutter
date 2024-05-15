
import 'package:ap1_dart/main.dart';
import 'package:ap1_dart/screens/screenViewItens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewList extends StatelessWidget{

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Visualizar a lista'),
      ),
      body: Expanded( // Envolve o ListView.builder com Expanded
          child: Consumer<EstadoListaDePessoas>(
            builder: (context, estadoLista, _) {
              // Verifica se há pessoas na lista
              if (estadoLista.pessoas.isEmpty) {
                return Center(
                  child: Text('Nenhuma pessoa cadastrada'),
                );
              } else {
                // Exibe a lista de pessoas
                return ListView.builder(
                  itemCount: estadoLista.pessoas.length,
                  itemBuilder: (context, index) {
                    final pessoa = estadoLista.pessoas[index];
                    
                    return ListTile(

                     title: Text(pessoa.nome),
                      subtitle: Text(pessoa.email),
                      leading: Text(index.toString()),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => ScreenViewItens(pessoa: pessoa))));
                      },
                     
                      
                      
                      // Mais informações da pessoa...
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