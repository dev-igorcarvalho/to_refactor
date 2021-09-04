import 'package:flutter/material.dart';

//UST: 02/10 - DgNotFound - id:15 - 4pts - Criação
class DgNotFound extends StatelessWidget {
  const DgNotFound({
    Key key,
    this.mensagem,
  }) : super(key: key);
  final String mensagem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(mensagem),
    );
  }
}
