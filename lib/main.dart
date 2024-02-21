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

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a capital do Brasil?',
      'respostas': [
        {'texto': 'Brasília', 'nota': 10},
        {'texto': 'Rio de Janeiro', 'nota': 0},
        {'texto': 'São Paulo', 'nota': 0},
        {'texto': 'Salvador', 'nota': 0},
      ],
    },
    {
      'texto': 'Em que ano o Brasil foi descoberto?',
      'respostas': [
        {'texto': '1498', 'nota': 0},
        {'texto': '1500', 'nota': 10},
        {'texto': '1502', 'nota': 0},
        {'texto': '1503', 'nota': 0},
      ],
    },
    {
      'texto': 'Qual o ano de fundação de Brasília?',
      'respostas': [
        {'texto': '1958', 'nota': 0},
        {'texto': '1959', 'nota': 0},
        {'texto': '1961', 'nota': 0},
        {'texto': '1960', 'nota': 10},
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
