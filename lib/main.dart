import 'package:flutter/material.dart';
import 'package:quiz/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?', // 0
      'respostas': [
        {'texto': 'Preto', 'pontuacao': '10'},
        {'texto': 'Amarelo', 'pontuacao': '9'},
        {'texto': 'Verde', 'pontuacao': '8'},
        {'texto': 'Azul', 'pontuacao': '1'},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?', // 1
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': '10'},
        {'texto': 'Gato', 'pontuacao': '9'},
        {'texto': 'Cavalo', 'pontuacao': '8'},
        {'texto': 'Elefante', 'pontuacao': '1'},
      ],
    },
    {
      'texto': 'Qual é o seu professor favorito?', // 2
      'respostas': [
        {'texto': 'Leo', 'pontuacao': '10'},
        {'texto': 'Ana', 'pontuacao': '9'},
        {'texto': 'Maria', 'pontuacao': '8'},
        {'texto': 'Joao', 'pontuacao': '1'},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
      print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    //   print(textoResp);
    // }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Perguntas',
        ),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder,
            )
          : Resultado(
              _pontuacaoTotal,
              _reiniciarQuestionario,
            ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
