import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.hideText,
      required this.action,
      required this.valid,
      required this.sufIcon,
      required this.controller})
      : super(key: key);
  final Icon icon;
  final IconButton sufIcon;
  final String hint;
  final bool hideText;
  final TextInputAction action;
  final Function valid;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      height: 70,
      width: 340,
      child: Center(
        child: TextFormField(
          controller: controller,
          validator: (value) => valid(value),
          textInputAction: action,
          obscureText: hideText,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 70),
            fillColor: Colors.grey[200],
            prefixIcon: icon,
            suffix: sufIcon,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
