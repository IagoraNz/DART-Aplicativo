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
  void log(Object? message) {
    print(message);
  }

  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    var mensagem = 'Pergunta respondida';
    log(mensagem);
  }

  final List<String> perguntas = [
    'Qual é a sua cor favorita?',
    'Qual é o seu animal favorito?',
  ];

  @override
  Widget build(BuildContext context) {
    String titulo = 'Perguntas';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Questao(texto: perguntas[_perguntaSelecionada]), // Fornecer o argumento obrigatório texto
              Resposta(texto: 'Resposta 1', onPress: _responder),
              Resposta(texto: 'Resposta 2', onPress: _responder),
              Resposta(texto: 'Resposta 3', onPress: _responder),
              Resposta(texto: 'Resposta 4', onPress: _responder)
            ],
          ),
        ),
      ),
    );
  }
}