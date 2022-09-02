import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final bool isCircular;
  final EdgeInsets margin;

  const GradientButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.isCircular = false,
      this.margin = EdgeInsets.zero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isCircular ? 33 : 10)),
        ),
        onPressed: () => onPressed(),
        child: Ink(
          decoration: BoxDecoration(
              gradient: kPrimaryGradientColor,
              borderRadius: BorderRadius.circular(isCircular ? 33 : 10)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
