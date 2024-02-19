import 'package:flutter/material.dart';
import './resposta.dart';
import './questao.dart';

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
    setState(() {
      _perguntaSelecionada++;
    });
  }

  final List<Map<String, Object>>? perguntas = [
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

  @override
  Widget build(BuildContext context) {
    String titulo = 'Perguntas';

    List<Resposta> respostas = [];

    if(perguntas != null){
      for(String textoResp in perguntas![_perguntaSelecionada]['respostas'] as List<String>){
        respostas.add(Resposta(texto: textoResp, onPress: _responder));
      }
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Questao(texto: perguntas![_perguntaSelecionada]['texto'].toString()),
              ...respostas,
            ],
          ),
        ),
      ),
    );
  }
}
