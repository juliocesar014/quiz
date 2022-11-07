import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecionado;

  Resposta(this.texto, this.onSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: onSelecionado,
      ),
    );
  }
}
