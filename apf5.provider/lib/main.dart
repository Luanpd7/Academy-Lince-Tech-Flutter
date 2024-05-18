

import 'package:ap1_dart/routes/app.routes.dart';
import 'package:ap1_dart/screens/addLista.dart';
import 'package:ap1_dart/screens/filterLista.dart';
import 'package:ap1_dart/screens/remove.dart';
import 'package:ap1_dart/screens/update.dart';
import 'package:ap1_dart/screens/viewList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);



void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => EstadoListaDePessoas(),
    
    child: MyApp(),)
  );
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa extends ChangeNotifier {
   Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

   String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;


  
  // todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];
   final _listaDeEncontrado = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);
  List<Pessoa> get pessoasEcontrada => List.unmodifiable(_listaDeEncontrado);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
 
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void atualizar(int index,Pessoa pessoa, String nome, String email, String telefone, String github, TipoSanguineo tipoSanguineo){
    _listaDePessoas.remove(_listaDePessoas[index!]);
    print('removeu a pessoa do indice $index');
    var pessoa = Pessoa(nome: nome, email: email, telefone: telefone, github: github, tipoSanguineo: tipoSanguineo);
    _listaDePessoas.insert(index, pessoa);
    notifyListeners();
     
  }

 void pesquisar(String name) {
  bool nomeEncontrado = false;

  for (int i = 0; i < _listaDePessoas.length; i++) {
    if (_listaDePessoas[i].nome.contains(name)) {
      nomeEncontrado = true;
      print('O nome $name foi encontrado na posição $i.');
      _listaDeEncontrado.add(_listaDePessoas[i]);
      notifyListeners();
      break; 
    }
  }

  if (!nomeEncontrado) {
    print('O nome $name não foi encontrado.');
  }


}

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: MyWidget(),
          ),
        ),
        routes: {

          AppRoute.VIEW_LIST: (context) => ViewList(),
          AppRoute.ADD_LIST: (ctx) => AddList(context.watch<EstadoListaDePessoas>()), // Passando a instância de EstadoListaDePessoas para AddList
          AppRoute.FILTER_LIST: (context) => FilterLIst(),
          AppRoute.UPDATE_LIST: (context) => Update(),
          AppRoute.REMOVE_LIST: (context) => Remove(),
        });
  }
}

class MyWidget extends StatefulWidget {
  
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
   return Column(
   
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    

        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.VIEW_LIST);
          },
          child: Text('Ver a lista de pessoas cadastrada'),
            style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 29, 100, 158),
                ),
           
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.ADD_LIST);
          },
          child: Text('Incluir Novas pessoas na lista'),
            style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 29, 100, 158),
                ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.FILTER_LIST);
          },
          child: Text('Filtrar a lista de pessoas cadastrada'),
            style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 29, 100, 158),
                ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.UPDATE_LIST);
          },
          child: Text('Alterar os dados de uma pessoa cadastrada'),
            style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 29, 100, 158),
                ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoute.REMOVE_LIST);
          },
          child: Text('Excluir pessoa cadastrada'),
            style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 29, 100, 158),
                ),
        ),
         
      ],
    );
    
  }
}
