import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado({Key? key, required this.pontuacao, required this.reiniciarQuestionario}) : super(key: key);

  String get fraseResultado {
    if (pontuacao < 20) {
      return 'Parabéns!';
    } 
    else if (pontuacao == 20) {
      return 'Você é bom!';
    } 
    else {
      return 'Nível Jedi!';
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
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            //foregroundColor serve para definir a cor do texto do botão
            //MaterialStateProperty.all<Color>(Colors.blue) é um objeto que define a cor do texto do botão
            //.all é um método que define a cor do texto do botão para todos os estados possíveis
          ),
          child: const Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
