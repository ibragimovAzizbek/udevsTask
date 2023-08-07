import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_color.dart';
import '../../../../../../core/style/text_style.dart';

class AddEvenetButton extends StatelessWidget {
  const AddEvenetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        '+ Add Evenet',
        style: AppTextStyle.w600.copyWith(
          fontSize: 10.sp,
          color: AppColor.white,
        ),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/addevent');
      },
    );
  }
}
