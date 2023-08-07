import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/constants/app_color.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme:  IconThemeData(
      color: AppColor.c292929,
    ),
    titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 14.sp),
  );
}
