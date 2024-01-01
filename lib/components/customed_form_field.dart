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
            textAlign: TextAlign.end,
            obscureText: widget.isPassword ? passwordVisible : false,
            controller: widget.controller,
            enabled: true,
            style: TextStyleHelper.button13.copyWith(
                height: 1.h,
                fontWeight: FontWeight
                    .normal) /* TextStyle(
              height: 1.1.h,
              fontSize: 16.sp,
            ) */
            ,
            decoration: InputDecoration(
              errorStyle: TextStyleHelper.caption11,
              fillColor: widget.fillColor ??
                  Theme.of(context).colorScheme.background.withOpacity(.02),
              filled: true,
              prefixIcon: widget.isSearch
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/svg/search_icon.svg',
                        //height: MediaQueryHelper.height * .03,
                      ),
                    )
                  : widget.isAuth
                      ? widget.isPassword
                          ? IconButton(
                              onPressed: () {
                                passwordVisible = !passwordVisible;
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
                      child: SvgPicture.asset(
                        'assets/svg/filter_icon.svg',
                        //height: 10.h,
                      ),
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
                color:
                    widget.hintColor ?? ColorStyle.backArrowColor.withOpacity(.5),
                fontWeight: FontWeight.normal,
              ),
              hintText: widget.hintText,
              border: OutlineInputBorder(
                //  borderSide: BorderSide(
                //   style: BorderStyle.solid,
                //   color: Colors.green,
                // ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0.r),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: ColorStyle.lightNavyColor.withOpacity(.1),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
