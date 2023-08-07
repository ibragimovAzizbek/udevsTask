import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/constants/app_path.dart';
import '../../../../../../core/style/text_style.dart';

class ShowTaskUi extends StatelessWidget {
  final Color basicColor;
  final String title;
  final String subtitle;
  final String firstTime;
  final String secondTime;
  final String? location;
  final Color textColor;

  const ShowTaskUi({
    super.key,
    required this.basicColor,
    required this.title,
    required this.subtitle,
    required this.firstTime,
    required this.secondTime,
    required this.textColor,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 7.h),
          padding: EdgeInsets.only(left: 10.w, top: 15.h),
          width: double.infinity,
          height: 95.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: basicColor.withOpacity(0.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Watching Football',
                style: AppTextStyle.w600.copyWith(
                  fontSize: 14.sp,
                  color: textColor,
                ),
              ),
              5.verticalSpace,
              Text(
                'Manchester United vs Arsenal (Premiere League)',
                style: AppTextStyle.w400.copyWith(
                  fontSize: 8.sp,
                  color: textColor,
                ),
              ),
              20.verticalSpace,
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        IconPath.clock,
                        theme: SvgTheme(
                          currentColor: textColor,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        '17:00 - 18:30',
                        style: AppTextStyle.w500.copyWith(
                          fontSize: 10,
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                  10.horizontalSpace,
                  location != null
                      ? Row(
                          children: [
                            SvgPicture.asset(
                              IconPath.location,
                              theme: SvgTheme(currentColor: textColor),
                            ),
                            4.horizontalSpace,
                            Text(
                              'Stamford Bridge',
                              style: AppTextStyle.w500.copyWith(
                                fontSize: 10,
                                color: textColor,
                              ),
                            )
                          ],
                        )
                      : const SizedBox()
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 7.h),
          width: double.infinity,
          height: 10.h,
          decoration: BoxDecoration(
            color: basicColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
