import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: const EdgeInsets.fromLTRB(20,10,20,10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: child,
    );
  }
}
