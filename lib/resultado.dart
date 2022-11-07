import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int? pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao! < 8) {
      return 'Parabéns!';
    } else if (pontuacao! < 12) {
      return 'Você é bom!';
    } else if (pontuacao! < 16) {
      return 'Impressionante';
    } else {
      return 'Nível Extraordinário';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
