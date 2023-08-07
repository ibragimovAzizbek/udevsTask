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
    final blocR = context.read<LocalToDoCubit>();
    final blocW = context.watch<LocalToDoCubit>();
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
              ValueListenableBuilder(
                valueListenable: blocW.eventList,
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: blocW.eventList.value.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = blocW.eventList.value[index];
                      return InkWell(
                        child: ShowTaskUi(
                          basicColor: AppColor.blue,
                          title: data['title'],
                          subtitle: data['description'],
                          firstTime: '17:00',
                          secondTime: '18:30',
                          textColor: AppColor.c056EA1,
                          location: data['location'],
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/edit',
                            arguments: data,
                          );
                        },
                      );
                    },
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
