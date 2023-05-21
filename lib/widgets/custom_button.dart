import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.function,
      required this.childWidget})
      : super(key: key);
  final double buttonWidth;
  final double buttonHeight;
  final Function function;
  final Widget childWidget;

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        child: Center(
          child: childWidget,
        ),
      ),
    );
  }
}
