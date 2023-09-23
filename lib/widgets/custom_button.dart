import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.btnColor,
      this.loading = false,
      this.onPress,
      this.icon});
  final String text;
  final Color btnColor;
  final Color textColor;
  final VoidCallback? onPress;
  final Icon? icon;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(8)),
        height: 40,
        width: 100,
        child: Align(
            alignment: Alignment.center,
            child: loading
                ? CircularProgressIndicator()
                : Text(
                    text,
                    style: TextStyle(
                        color: textColor,
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2(
      {super.key, this.icon, this.height, this.width, this.color, this.radius});
  final Icon? icon;
  final double? height;
  final double? width;
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Center(child: icon));
  }
}
