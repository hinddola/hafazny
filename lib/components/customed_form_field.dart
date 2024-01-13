import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/style.dart';

class CustomFormField extends StatefulWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isAuth;
  final Color? fillColor;
  final String icon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? iconWidget;
  final Color? hintColor;
  final String labelText;
  final bool isSearch;
  final customSuffixIconButton;
  final customPreffixIconButton;
  final bool? isLabeled;
  final bool? isWidget;
  final bool? isReadOnly;

  const CustomFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
    required this.controller,
    this.icon = '',
    this.validator,
    this.isAuth = true,
    this.fillColor,
    this.iconWidget,
    this.hintColor,
    this.labelText = '',
    this.isSearch = false,
    this.customSuffixIconButton,
    this.customPreffixIconButton,
    this.isLabeled,
    this.isWidget,
    this.isReadOnly,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool passwordVisible = true;
  FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          widget.isSearch
              ? const SizedBox()
              : Text(
            widget.labelText,
            style: TextStyleHelper.body15
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.next,
            cursorColor: ColorStyle.primaryColor,
            cursorHeight: 25.h,
            cursorWidth: 5.w,
            textAlign: TextAlign.end,
            obscureText: widget.isPassword ? passwordVisible : false,
            controller: widget.controller,
            enabled: true,
            style: TextStyleHelper.button13.copyWith(
                height: 1.h,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder( borderSide: BorderSide(
                  color: ColorStyle.lightNavyColor.withOpacity(0.2), // Set default border color
                  width: 1.0,
                ),),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorStyle.primaryColor, width: 2.0),
              ),
              errorBorder:  OutlineInputBorder(
    borderSide: BorderSide(color: ColorStyle.redColor, width: 2.0),
    ),
              errorStyle: TextStyleHelper.caption11,
              fillColor: widget.fillColor ??
                  Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(.02),
              filled: true,
              prefixIcon: widget.isSearch
                  ? const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(Icons.filter_alt_outlined,
                    color: ColorStyle.primaryColor),
              )
                  : widget.isAuth
                  ? widget.isPassword
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  }
                  );
                },
                icon: passwordVisible
                    ? SvgPicture.asset(
                  'assets/svg/invisible_password.svg',
                  height: 5.h,
                )
                    : SvgPicture.asset(
                  'assets/svg/visible_password.svg',
                  height: 5.h,
                ),
              )
                  : const SizedBox()
                  : Padding(
                padding: EdgeInsets.all(12.0.r),
                child: widget.iconWidget,
              ),
              suffixIcon: widget.isSearch
                  ? Padding(
                padding: EdgeInsets.all(12.0.r),
                child: const Icon(Icons.search_rounded,
                    color: ColorStyle.primaryColor),
              )
                  : widget.isAuth
                  ? Padding(
                padding: EdgeInsets.all(12.0.r),
                child: SvgPicture.asset(
                  widget.icon,
                  height: 2.h,
                ),
              )
                  : SvgPicture.asset(
                widget.icon,
                height: 2.h,
              ),
              hintStyle: TextStyleHelper.button13.copyWith(
                  color: widget.hintColor ??
                      ColorStyle.backArrowColor.withOpacity(.5),
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp),
              hintText: widget.hintText,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
