import 'package:flutter/material.dart';

//UST: 06/10 - BgColor - id:7 - 0,5pts - Criação
enum BgColor { WARNING, DANGER, SUCCESS, INFO, DEFAULT }

//UST: 06/10  - DgHeaderDivider - id:15 - 4pts - Criação
class DgAlertDialog extends StatelessWidget {
  final double margin;
  final String message;
  final BgColor type;

  const DgAlertDialog(
      {Key key,
      this.margin = 7.5,
      @required this.message,
      this.type = BgColor.DEFAULT})
      : super(key: key);

  Color _typeToColor(BgColor type) {
    switch (type) {
      case BgColor.DANGER:
        {
          return Colors.red[200];
        }
        break;
      case BgColor.INFO:
        {
          return Colors.blue[200];
        }
        break;
      case BgColor.SUCCESS:
        {
          return Colors.green[200];
        }
        break;
      case BgColor.WARNING:
        {
          return Colors.orange[200];
        }
        break;
      default:
        {
          return Colors.grey[200];
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 2,
        color: _typeToColor(type),
        margin: EdgeInsets.symmetric(vertical: margin),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
