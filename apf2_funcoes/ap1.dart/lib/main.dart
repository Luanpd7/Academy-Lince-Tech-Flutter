import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Formas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quadrados (vermelho/verde/azul/roxo/ciano/preto): 50 x 50', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Container(
                  margin: EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  color: Colors.orange,
                ),
                   Container(
                  margin: const EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  color: Colors.purple,
                ),
                   Container(
                  margin: const EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  color: Colors.cyan,
                ),
                   Container(
                  margin: const EdgeInsets.all(8),
                  height: 50,
                  width: 50,
                  color: Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 20,),
          const Text('Retângulos (roxo/ciano): 50 x 100', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),), 
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [ 
            Container(
              margin: const EdgeInsets.all(8),
              height: 50,
              width: 100,
              color: Colors.purple,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              height: 50,
              width: 100,
              color: Colors.cyan,
            )
            ]
           ),
        
          ],
        ),
      ),
    );
  }
}