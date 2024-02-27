import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  const Resultado({Key? key, required this.pontuacao}) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 20) {
      return 'Parabéns!';
    } else if (pontuacao == 20) {
      return 'Você é bom!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        fraseResultado,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
