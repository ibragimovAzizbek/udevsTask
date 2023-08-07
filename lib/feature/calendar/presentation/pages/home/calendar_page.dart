import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/core/constants/app_color.dart';
import 'package:todoapp/core/constants/app_path.dart';
import 'package:todoapp/core/style/text_style.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_bloc.dart';
import 'package:todoapp/feature/calendar/presentation/pages/home/widgets/add_event_button.dart';
import 'package:todoapp/feature/calendar/presentation/pages/home/widgets/show_task_ui_widget.dart';

import '../../../../../core/func/month_func.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocR = context.read<LocalToDoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Sunday',
              style: AppTextStyle.w600.copyWith(
                fontSize: 14.sp,
                color: AppColor.c292929,
              ),
            ),
            Text(
              '${DateTime.now().day} ${identifyTheMoon(DateTime.now())} ${DateTime.now().year}',
              style: AppTextStyle.w400.copyWith(
                fontSize: 10.sp,
                color: AppColor.c292929,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              IconPath.notification,
              height: 28,
              width: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(2950),
                currentDate: DateTime.now(),
                onDateChanged: (time) {
                  blocR.changeTime(time);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Schedule',
                    style: AppTextStyle.w600.copyWith(
                      color: AppColor.c292929,
                      fontSize: 14.sp,
                    ),
                  ),
                  const AddEvenetButton(),
                ],
              ),
              8.verticalSpace,
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ShowTaskUi(
                    basicColor: index == 1 ? AppColor.red : AppColor.blue,
                    title: 'Watching Football',
                    subtitle: 'Manchester United vs Arsenal (Premiere League)',
                    firstTime: '17:00',
                    secondTime: '18:30',
                    textColor: index == 1 ? AppColor.bF2200 : AppColor.c056EA1,
                    location: index == 1 ? null : 'Stamford Bridge',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
