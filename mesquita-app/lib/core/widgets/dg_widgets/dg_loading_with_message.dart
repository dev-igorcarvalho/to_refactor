import 'package:flutter/material.dart';

//UST: 04/2021 - DgLoadingWithMessage - id:15 - 4pts - Criação
class DgLoadingWithMessage extends StatelessWidget {
  final String message;

  const DgLoadingWithMessage({this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 20,
        ),
        if (message != null) Text(message),
      ],
    );
  }
}
