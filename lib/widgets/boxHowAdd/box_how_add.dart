import 'package:flutter/material.dart';

class BoxHowAdd extends StatelessWidget {
  const BoxHowAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: 200,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(5)),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Adicione uma nova anotação, basta clicar no botão com o simbolo de "+" na direita.',
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
