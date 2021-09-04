//UST: 29/09 - DgLabeledOutputText - id:15 - 4pts - Criação
//UST: 04/2021 - DgLabeledOutputText - id:15 - 4pts - Edição
import 'package:flutter/material.dart';

class DgLabeledOutputText extends StatelessWidget {
  const DgLabeledOutputText({
    Key key,
    @required this.label,
    @required this.text,
    this.labelSize = 12,
    this.textSize = 16,
    this.alignment = CrossAxisAlignment.start,
    this.textColor = Colors.black,
    this.labelColor = Colors.black,
    this.padding = 8,
    this.divider = false,
  }) : super(key: key);
  final dynamic label;
  final double padding;
  final double labelSize;
  final double textSize;
  final dynamic text;
  final CrossAxisAlignment alignment;
  final Color textColor;
  final Color labelColor;
  final bool divider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toString() ?? '',
            style: TextStyle(
              fontSize: labelSize,
              color: labelColor,
            ),
          ),
          Text(
            text.toString().trimLeft() ?? '',
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
          if (divider)
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
        ],
      ),
    );
  }
}
