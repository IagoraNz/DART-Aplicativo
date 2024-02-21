import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';
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
      'respostas': ['Brasília', 'Rio de Janeiro', 'São Paulo', 'Salvador'],
    },
    {
      'texto': 'Em que ano o Brasil foi descoberto?',
      'respostas': ['1498', '1500', '1502', '1503'],
    },
    {
      'texto': 'Qual o ano de fundação de Brasília?',
      'respostas': ['1958', '1959', '1961', '1960'],
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    String titulo = 'Perguntas';

    List<String>? respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]['respostas'] as List<String>?
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Center(
                child: Column(
                  children: <Widget>[
                    Questao(texto: _perguntas[_perguntaSelecionada]['texto'].toString()),
                    if (respostas != null)
                    ...respostas.map((textoResposta) => Resposta(
                      texto: textoResposta,
                      onPress: _responder,
                    )).toList(),
                  ],
                ),
              )
            : const Resultado(),
      ),
    );
  }
}
