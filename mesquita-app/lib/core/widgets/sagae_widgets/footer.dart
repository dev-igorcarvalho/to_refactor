import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sagae/core/constants/style_constants.dart';

//UST: 10/08 - Footer - id:15 - 4pts - Criação
class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int easterEgg;

  int randomizer() {
    final random = Random();
    return random.nextInt(101);
  }

  @override
  void initState() {
    // TODO: implement initState
    easterEgg = randomizer();
    if (easterEgg <= 50) {
      print(easterEgg);
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          easterEgg = 100;
          print(easterEgg);
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightGreen,
      child: Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        color: primaryColor,
        width: double.maxFinite,
        height: 60,
        child: easterEgg <= 50
            ? Image.asset(
                'assets/images/logo_dg.png',
                fit: BoxFit.fitHeight,
              )
            : SizedBox(
                height: 0,
              ),
      ),
    );
  }
}
