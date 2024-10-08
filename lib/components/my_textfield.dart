import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final bool obscureText;
  final bool readOnly, isFilled;
  final Color color, borderColor;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.prefixIcon,
      this.onChanged,
      this.validator,
      this.maxLines = 1,
      this.isFilled = true,
      this.readOnly = false, 
      this.color = Colors.grey, 
     this.borderColor=Colors.transparent
     });

  @override
  Widget build(BuildContext context) {
    
    var theme=Theme.of(context);
    return TextFormField(
      readOnly: readOnly,
      textAlignVertical: TextAlignVertical.top,
      maxLines: maxLines,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          fillColor: color,
          filled: isFilled,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color:borderColor)),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: theme.colorScheme.tertiary)),
    );
  }
}
