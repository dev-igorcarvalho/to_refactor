import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//UST: 31/08 - DgHeaderDivider - id:15 - 4pts - Criação
class DgHeaderDivider extends StatelessWidget {
  const DgHeaderDivider(
      {@required this.title,
      this.fontSize = 16,
      this.paddingTop = 30,
      this.paddingBottom = 10,
      this.divider = true,
      this.crossAxisAlignment = CrossAxisAlignment.center});

  final String title;
  final double fontSize;
  final double paddingTop;
  final double paddingBottom;
  final bool divider;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        SizedBox(
          height: paddingTop,
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        if (divider)
          Divider(
            color: Colors.grey[600],
            thickness: 1,
          ),
        SizedBox(
          height: paddingBottom,
        ),
      ],
    );
  }
}
