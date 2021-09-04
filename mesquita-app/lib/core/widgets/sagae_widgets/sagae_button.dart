import 'package:flutter/material.dart';
import 'package:sagae/core/constants/style_constants.dart';

//UST: 31/08 - SagaeButton - id:15 - 4pts - Criação
class SagaeButton extends StatelessWidget {
  const SagaeButton(
      {@required this.execute,
      this.title = '',
      this.icon,
      this.padding = 30,
      this.color,
      this.disabledHint = '',
      this.disabled = false});

  final Color color;
  final Function execute;
  final String title;
  final double padding;
  final bool disabled;
  final String disabledHint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: Column(
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: primaryColor,
              textColor: Colors.white,
              onPressed: () {
                execute();
              },
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
            if (disabled)
              Text(
                disabledHint,
                style: const TextStyle(
                    color: Color.fromRGBO(200, 0, 0, 1), fontSize: 16),
              ),
          ],
        ));
  }
}
