import 'package:flutter/material.dart';
import 'package:sagae/core/widgets/dg_widgets/dg_limited_text.dart';

//UST: 19/02/2021 - DgSyncAlert - id:15 - 4pts - Criação
class DgSyncAlert extends StatelessWidget {
  final String msg;

  const DgSyncAlert({Key key, this.msg = 'SINCRONIZANDO'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircularProgressIndicator(
            backgroundColor: Colors.yellow,
          ),
        ),
        DgLimitedText(
          msg,
          caracteres: 15,
        ),
      ],
    );
  }
}
