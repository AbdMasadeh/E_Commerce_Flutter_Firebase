import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.text,
      required this.function})
      : super(key: key);
  final double buttonWidth;
  final double buttonHeight;
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, ),
            ),
          )),
    );
  }
}
