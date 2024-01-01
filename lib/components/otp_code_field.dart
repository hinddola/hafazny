import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPCodeField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const OTPCodeField(
      {super.key, this.validator, required this.controller});

  @override
  State<OTPCodeField> createState() => _OTPCodeFieldState();
}

class _OTPCodeFieldState extends State<OTPCodeField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.r),
      width:50.w,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).previousFocus();
          }
        },
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        style: const TextStyle(
          locale: Locale('en', 'US'),
          fontSize: 30,
          height: 1.7,
        ),
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        cursorRadius: const Radius.circular(16),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: 8.r, /* horizontal: 32.r */
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4.0.r))),
        ),
      ),
    );
  }
}