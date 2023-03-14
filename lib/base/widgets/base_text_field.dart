import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  BaseTextField({
    Key? key,
    this.onChange,
    this.controller,
    this.width,
    this.height,
    this.enable,
    this.obscureText,
    this.initialValue,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.listFormatter,
    this.maxLength,
    this.label,
    this.hint,
    this.inputType,
    this.validator,
    this.onSaved,
    this.fillColor,
    this.labelColor,
    required this.outlineColor,
    this.cursorColor,
    this.floatingLabelColor,
    this.outlineWidth,
    this.borderRadius,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final bool? enable;
  final bool? obscureText;
  final String? initialValue;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? listFormatter;
  final int? maxLength;
  final Color? fillColor;
  final Color? labelColor;
  final Color outlineColor;
  final Color? floatingLabelColor;
  final Color? cursorColor;
  final double? outlineWidth;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: labelColor),
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: fillColor,
          floatingLabelStyle: TextStyle(color: floatingLabelColor),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: outlineColor, width: outlineWidth == null ? 0 : outlineWidth!),
            borderRadius: BorderRadius.circular(borderRadius == null ? 0 : borderRadius!),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius == null ? 0 : borderRadius!),
          ),
        ),
        autofocus: false,
        cursorColor: cursorColor,
        keyboardType: inputType,
        validator: validator,
        onSaved: onSaved,
        obscureText: obscureText!,
        onChanged: onChange,
      ),
    );
  }
}
