import 'package:flutter/widgets.dart';

//UST: 10/08 - BotaoEmpaer - id:15 - 4pts - Criação
class BotaoEmpaer extends StatelessWidget {
  const BotaoEmpaer(this._img,
      {this.route,
      this.paddingVertical = 10,
      this.paddingHorizontal = 50,
      this.popPush = false,
      this.args});

  final String _img;
  final double paddingVertical;
  final double paddingHorizontal;
  final String route;
  final bool popPush;
  final dynamic args;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (popPush) {
          Navigator.popAndPushNamed(context, route);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal, vertical: paddingVertical),
          child: Image.asset(
            _img,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
