import 'package:flutter/material.dart';
//import 'package:get/get_connect/http/src/utils/utils.dart';

class Custom_Textformfield extends StatelessWidget {
  const Custom_Textformfield({
    super.key,
    this.title,
    this.text,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.showCursor,
    this.maxLine,
    this.minLine,
    this.textColor,
    this.fillColor,
    this.btnColor,
    this.sufixIcon,
    this.prefixIcon,
    this.onPress,
    this.focusNode,
    this.validator,
  });
  final String? title;
  final String? text;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final bool? showCursor;
  final int? maxLine;
  final int? minLine;
  final Color? textColor;
  final Color? fillColor;
  final Color? btnColor;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onPress;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 335,
      child: TextFormField(
        onTap: onPress,
        focusNode: focusNode,
        keyboardType: keyboardType,
        showCursor: showCursor,
        controller: controller,
        validator: validator,
        obscureText: false,
        readOnly: false,
        decoration: InputDecoration(
          fillColor: fillColor,
          hintMaxLines: maxLine,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: sufixIcon,
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.4),
          ),
        ),
      ),
    );
  }
}
