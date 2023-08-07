import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/constants/app_color.dart';
import 'package:todoapp/core/constants/app_path.dart';
import 'package:todoapp/core/style/text_style.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_bloc.dart';
import 'package:todoapp/feature/calendar/presentation/pages/add_event/widgets/classic_text_filed.dart';
import 'package:todoapp/feature/calendar/presentation/pages/add_event/widgets/drop_down_button.dart';
import 'package:todoapp/feature/calendar/presentation/pages/add_event/widgets/input_desctioption.dart';

class AddEvenetPage extends StatelessWidget {
  const AddEvenetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocW = context.watch<LocalToDoBloc>();
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.white),
      body: Padding(
        padding: mediaQuery.viewInsets,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 13.w, right: 19.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                titleName('Event name'),
                4.verticalSpace,
                ClassicTextFiled(
                  controller: blocW.eventName,
                ),
                16.verticalSpace,
                titleName('Event description'),
                4.verticalSpace,
                const InputDescription(),
                16.verticalSpace,
                titleName('Event local'),
                4.verticalSpace,
                ClassicTextFiled(
                  controller: blocW.eventLocation,
                  icon: IconPath.location,
                ),
                16.verticalSpace,
                titleName('Priority color'),
                4.verticalSpace,
                const SelectColor(),
                16.verticalSpace,
                titleName('Event time'),
                4.verticalSpace,
                ClassicTextFiled(
                  controller: blocW.eventTime,
                  textInputAction: TextInputAction.done,
                  hint: 'Example: 17:30 - 18:00',
                )
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blue,
            fixedSize: Size(MediaQuery.of(context).size.width, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Add',
            style: AppTextStyle.w400.copyWith(
              fontSize: 16.sp,
              color: AppColor.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Text titleName(String title) {
    return Text(
      title,
      style: AppTextStyle.w600.copyWith(
        fontSize: 14.sp,
        color: AppColor.gray900,
      ),
    );
  }
}
