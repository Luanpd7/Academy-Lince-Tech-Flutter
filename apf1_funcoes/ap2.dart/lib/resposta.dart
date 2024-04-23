import 'package:flutter/material.dart';

class AnalisandoResposta extends StatelessWidget {
   String texto;
   Color cor;
  Color corTexto;

   AnalisandoResposta(this.texto, this.corTexto, this.cor);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: cor,
      child: Center(
        child: Text(
          texto,
          style: TextStyle(
            color: corTexto,
          ),
        ),
      ),
    );
  }
}
