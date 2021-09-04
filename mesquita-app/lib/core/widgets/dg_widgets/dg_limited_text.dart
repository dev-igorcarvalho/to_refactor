import 'package:flutter/material.dart';

//UST: 10/08 - DgLimitedText - id:15 - 4pts - Criação
class DgLimitedText extends StatelessWidget {
  const DgLimitedText(this.texto, {this.caracteres, this.style});

  final String texto;
  final int caracteres;
  final TextStyle style;

  String reduzirTexto() {
    if (texto.length < caracteres) {
      return texto;
    } else {
      return '${texto.substring(0, caracteres)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      reduzirTexto(),
      style: style,
    );
  }
}
