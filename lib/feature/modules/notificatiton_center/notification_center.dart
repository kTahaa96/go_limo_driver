import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/app_bar_row.dart';
import 'package:golimo_driver/feature/modules/home/widgets/notification_item.dart';
import 'package:golimo_driver/feature/modules/notificatiton_center/cubit/notification_center_cubit.dart';
import 'package:golimo_driver/helpers/di/di.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class NotificationCenter extends StatefulWidget {
  const NotificationCenter({super.key});

  @override
  State<NotificationCenter> createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => di<NotificationCenterCubit>(),
        child: BlocBuilder<NotificationCenterCubit, NotificationCenterState>(
          builder: (context, state) {
            final cubit = NotificationCenterCubit.of(context);
            return SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [

                  ListView.separated(
                      padding: EdgeInsets.only(top: 61.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NotificationItem(
                          model: cubit.notificationList[index],
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: cubit.notificationList.length)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
