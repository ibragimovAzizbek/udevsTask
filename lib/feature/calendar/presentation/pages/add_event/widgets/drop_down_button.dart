import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_bloc.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/style/text_style.dart';

class SelectColor extends StatelessWidget {
  const SelectColor({super.key});

  @override
  Widget build(BuildContext context) {
    final blocW = context.watch<LocalToDoCubit>();
    final blocR = context.read<LocalToDoCubit>();
    return ValueListenableBuilder(
      valueListenable: blocW.dropDownValue,
      builder: (context, value, child) {
        return Container(
          width: 105.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColor.gray100,
          ),
          child: DropdownButton(
            borderRadius: BorderRadius.circular(8.r),
            iconDisabledColor: AppColor.blue,
            value: blocW.dropDownValue.value,
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: Text(
              'Select color',
              style: AppTextStyle.w500.copyWith(fontSize: 14.sp),
            ),
            items: AppColor.selectColorList.map((Color item) {
              return DropdownMenuItem(
                value: item,
                child: Container(
                  height: 20.h,
                  width: 20.w,
                  color: item,
                ),
              );
            }).toList(),
            onChanged: (Color? color) {
              blocR.changeColor(color!);
            },
            underline: const SizedBox(),
          ),
        );
      },
    );
  }
}
