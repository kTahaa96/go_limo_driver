import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/consts/notification_list.dart';
import 'package:golimo_driver/core/models/home_module/notification_item.dart';
import 'package:meta/meta.dart';

part 'notification_center_state.dart';

class NotificationCenterCubit extends Cubit<NotificationCenterState> {
  NotificationCenterCubit() : super(NotificationCenterInitial());

  static NotificationCenterCubit of(context) => BlocProvider.of(context);

  List<NotificationModel> notificationList = [

  ];
}
