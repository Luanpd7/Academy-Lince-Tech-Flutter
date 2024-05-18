
import 'package:ap1_dart/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateView extends StatelessWidget {
 
  Pessoa pessoa;

  UpdateView({required this.pessoa, required this.index});
  
    late final _nomeController =  TextEditingController(text: pessoa.nome);
  late final _emailController = TextEditingController(text: pessoa.email);
    late final _telefoneController = TextEditingController(text: pessoa.telefone);
       late final _githubController = TextEditingController(text: pessoa.github);
      

     late  final String nome;
     late   final String email;
     late    final String telefone;
     late     final String git;
     late TipoSanguineo  tipoSanguineoController;

   final int index;

 final List<TipoSanguineo> _listaDeValores = TipoSanguineo.values.toList();
    


   
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Visualizando Dados')),
      ),
      body: Consumer<EstadoListaDePessoas>(
        builder: (context, estadoLista, _) {
          if (index >= estadoLista.pessoas.length) {
            return Center(
              child: Text('Erro: Índice fora do intervalo.'),
            );
          }

          final pessoa = estadoLista.pessoas[index];
          return Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
              ),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(
                  labelText: 'Telefone',
                ),
              ),
              TextFormField(
                controller: _githubController,
                decoration: InputDecoration(
                  labelText: 'Github',
                ),
              ),
              DropdownButtonFormField<Object>(
            items: TipoSanguineo.values.map((TipoSanguineo tipo) {
              return DropdownMenuItem<TipoSanguineo>(
                value: tipo,
                
                child: Text(tipo.toString().split('.')[1]), // Extraindo o nome do enum
              );
            }).toList(),
            onChanged: (dynamic novoTipo) {
              tipoSanguineoController = novoTipo;
            },
            decoration: InputDecoration(
              labelText: 'Tipo Sanguíneo',
            ),
          ),
              ElevatedButton(
                onPressed: () {
                  nome = _nomeController.text;
                  email = _emailController.text;
                  telefone = _telefoneController.text;
                  git = _githubController.text;
                  final tipo = tipoSanguineoController;

                  // Atualizar a pessoa no estado
                  estadoLista.atualizar(
                    index,
                    pessoa,
                    nome,
                    email,
                    telefone,
                    git,
                    tipo,
                  );

                  

                  Navigator.pop(context); // Voltar para a tela anterior
                },
                child: Text('Atualizar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}