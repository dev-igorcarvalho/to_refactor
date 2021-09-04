import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//UST: 31/08 - DgHeaderSeparator - id:15 - 4pts - Criação
class DgSeparator extends StatelessWidget {
  const DgSeparator({@required this.spacing, this.line = false});

  final double spacing;
  final bool line;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: spacing / 2,
        ),
        if (line)
          Divider(
            color: Colors.grey[600],
            thickness: 1,
          ),
        SizedBox(
          height: spacing / 2,
        ),
      ],
    );
  }
}
