import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/constants/app_color.dart';

class ClassicTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? icon;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String hint;

  const ClassicTextFiled({
    super.key,
    required this.controller,
    this.icon,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: AppColor.gray900,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.gray100,
        hintText: hint,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
        suffixIcon: icon != null
            ? SvgPicture.asset(
                icon!,
                height: 17.h,
                width: 17.w,
                fit: BoxFit.scaleDown,
              )
            : const SizedBox(),
      ),
    );
  }
}
