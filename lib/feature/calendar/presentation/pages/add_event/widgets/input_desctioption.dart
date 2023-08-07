import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_bloc.dart';

import '../../../../../../core/constants/app_color.dart';

class InputDescription extends StatelessWidget {
  const InputDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final blocW = context.watch<LocalToDoCubit>();
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 5.h, left: 10.w),
      height: 110.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColor.gray100,
      ),
      child: TextField(
        controller: blocW.eventDescription,
        maxLines: null,
        cursorColor: AppColor.gray900,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
