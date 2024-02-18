import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final VoidCallback onPress;

  const Resposta({Key? key, required this.texto, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: const TextStyle(color: Colors.blue),
        ),
        onPressed: onPress,
        child: Text(texto),
      ),
    );
  }
}
