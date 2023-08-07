import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/core/constants/app_color.dart';
import 'package:todoapp/core/constants/app_path.dart';
import 'package:todoapp/core/style/text_style.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_bloc.dart';

class EditPage extends StatelessWidget {
  final Map<String, dynamic> data;
  const EditPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final blocR = context.read<LocalToDoCubit>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 248.h,
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: CircleAvatar(
                        backgroundColor: AppColor.white,
                        child: SvgPicture.asset(IconPath.left),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        blocR.checkStatus(data['id']);
                        Navigator.pushNamed(
                          context,
                          '/editevent',
                          arguments: data['id'],
                        );
                      },
                      icon: SvgPicture.asset(IconPath.edit2),
                      label: Text(
                        'Edit',
                        style:
                            AppTextStyle.w500.copyWith(color: AppColor.white),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Text(
                  data['title'],
                  style: AppTextStyle.w600
                      .copyWith(fontSize: 26.sp, color: AppColor.white),
                ),
                Text(
                  data['description'],
                  style: AppTextStyle.w400
                      .copyWith(fontSize: 8.sp, color: AppColor.white),
                ),
                12.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      IconPath.clock,
                      color: AppColor.white,
                    ),
                    4.horizontalSpace,
                    Text(
                      data['reminderTime'],
                      style: AppTextStyle.w500.copyWith(
                        fontSize: 10,
                        color: AppColor.white,
                      ),
                    )
                  ],
                ),
                12.verticalSpace,
                Row(
                  children: [
                    SvgPicture.asset(
                      IconPath.location,
                      color: AppColor.white,
                    ),
                    4.horizontalSpace,
                    Text(
                      data['location'],
                      style: AppTextStyle.w500.copyWith(
                        fontSize: 10,
                        color: AppColor.white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          28.verticalSpace,
          titleText('Reminder'),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 10.h, bottom: 22.h),
            child: Text(
              '15 minutes befor',
              style: AppTextStyle.w600
                  .copyWith(color: AppColor.c7C7B7B, fontSize: 16.sp),
            ),
          ),
          titleText('Description'),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 10.h),
            child: Text(
              data['description'],
              style: AppTextStyle.w400.copyWith(
                fontSize: 10.sp,
                color: AppColor.c999999,
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.fEE8E9,
            fixedSize: Size(
              MediaQuery.of(context).size.width,
              54.h,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          onPressed: () async {
            await context.read<LocalToDoCubit>().removeEvent(data['id']).then(
                  (value) => Navigator.pop(context),
                );
          },
          icon: SvgPicture.asset(
            IconPath.delete,
            color: AppColor.red,
          ),
          label: Text(
            'Delete Event',
            style: AppTextStyle.w600.copyWith(
              fontSize: 14.sp,
              color: AppColor.c292929,
            ),
          ),
        ),
      ),
    );
  }

  Padding titleText(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w),
      child: Text(
        title,
        style: AppTextStyle.w600.copyWith(color: Colors.black, fontSize: 16.sp),
      ),
    );
  }
}
