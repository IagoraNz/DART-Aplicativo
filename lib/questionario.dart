import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario(
      {Key? key,
      required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder})
      : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas'] as List<Map<String, Object>>?
        : null;

    return Center(
      child: Column(
        children: <Widget>[
          Questao(texto: perguntas[perguntaSelecionada]['texto'].toString()),
          if (respostas != null)
            ...respostas
                .map((resposta) => Resposta(
                      texto: resposta['texto'].toString(),
                      onPress: () => responder(int.parse(resposta['pontuacao'].toString())),
                    //.parse converte o valor para inteiro em .toString()
                    ))
                .toList(),
        ],
      ),
    );
  }
}
