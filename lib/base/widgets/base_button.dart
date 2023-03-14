import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.color,
    this.borderRadius,
    this.textPadding,
  }) : super(key: key);

  final Function() onPressed;
  final Text? label;
  final Color? color;
  final double? borderRadius;
  final double? textPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: onPressed,
        child: label,
        style: ElevatedButton.styleFrom(
            primary: color,
            fixedSize: Size(MediaQuery.of(context).size.width, textPadding == null ? 0 : textPadding!),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius == null ? 0 : borderRadius!),
            )),
      ),
    );
  }
}
