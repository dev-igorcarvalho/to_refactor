import 'package:flutter/material.dart';

class DgCircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 25,
        child: Center(
          child: FloatingActionButton(
            backgroundColor: Colors.lightGreenAccent[100],
            onPressed: () {
              //print("Cliked");
            },
            child: Icon(
              Icons.add,
              color: Colors.grey[600],
            ),
          ),
        ));
  }
}
