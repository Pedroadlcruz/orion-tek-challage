import 'package:flutter/material.dart';

class AppBtn extends StatelessWidget {
  const AppBtn({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    required this.label,
  }) : super(key: key);
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(310.0, 53.0),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
  }
}
