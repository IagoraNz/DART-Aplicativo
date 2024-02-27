import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a capital do Brasil?',
      'respostas': [
        {'texto': 'Brasília', 'pontuacao': 10},
        {'texto': 'Rio de Janeiro', 'pontuacao': 0},
        {'texto': 'São Paulo', 'pontuacao': 0},
        {'texto': 'Salvador', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Em que ano o Brasil foi descoberto?',
      'respostas': [
        {'texto': '1498', 'pontuacao': 0},
        {'texto': '1500', 'pontuacao': 10},
        {'texto': '1502', 'pontuacao': 0},
        {'texto': '1503', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual o ano de fundação de Brasília?',
      'respostas': [
        {'texto': '1958', 'pontuacao': 0},
        {'texto': '1959', 'pontuacao': 0},
        {'texto': '1961', 'pontuacao': 0},
        {'texto': '1960', 'pontuacao': 10},
      ],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    String titulo = 'Perguntas';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : const Resultado(),
      ),
    );
  }
}
