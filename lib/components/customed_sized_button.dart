import 'package:flutter/material.dart';

import '../const/style.dart';

class CustomSizedButton extends StatelessWidget {
  final String title;
  final Size size;
  final TextStyle? textStyle;
  final Function() onPressed;

  const CustomSizedButton({
    super.key,
    required this.title,
    required this.size,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: size ,
          backgroundColor:ColorStyle.primaryColor ),
      child: Text(
        title,
        style: textStyle??TextStyleHelper.button16.copyWith(color: Colors.white),
      ),
    );
  }
}
