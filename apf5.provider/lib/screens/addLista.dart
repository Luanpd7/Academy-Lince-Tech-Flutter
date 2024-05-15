

import 'package:ap1_dart/main.dart';
import 'package:flutter/material.dart';


class AddList extends StatelessWidget {
  final EstadoListaDePessoas estadoLista; // Recebe a instância de EstadoListaDePessoas como argumento

  AddList(this.estadoLista);

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _githubController = TextEditingController();
  late TipoSanguineo _tipoSanguineoController;

  final List<TipoSanguineo> _listaDeValores = TipoSanguineo.values.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionando a lista'),
      ),
      body: Column(
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Telefone',
            ),
          ),
          TextFormField(
            controller: _githubController,
            decoration: InputDecoration(
              labelText: 'Link do Github',
            ),
          ),
          DropdownButtonFormField<Object>(
            items: _listaDeValores.map((TipoSanguineo tipo) {
              return DropdownMenuItem<TipoSanguineo>(
                value: tipo,
                child: Text(tipo.toString().split('.')[1]), // Extraindo o nome do enum
              );
            }).toList(),
            onChanged: (dynamic novoTipo) {
              _tipoSanguineoController = novoTipo;
            },
            decoration: InputDecoration(
              labelText: 'Tipo Sanguíneo',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final nome = _nomeController.text;
              final email = _emailController.text;
              final telefone = _telefoneController.text;
              final github = _githubController.text;
              final tipo = _tipoSanguineoController;

              var pessoa = Pessoa(
                nome: nome,
                email: email,
                telefone: telefone,
                github: github,
                tipoSanguineo: tipo,
              );

              estadoLista.incluir(pessoa); // Adicionando pessoa à lista existente

              _nomeController.clear();
              _emailController.clear();
              _githubController.clear();
              _telefoneController.clear();
            },
            child: Text('Enviar'),
          )
        ],
      ),
    );
  }
}