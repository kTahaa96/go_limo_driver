import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golimo_driver/core/consts/notification_list.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit of(context) => BlocProvider.of(context);

  List<NotificationModel> notificationList = [
    NotificationModel(
        title: 'أمر شغل #8732 (سفر) ',
        desc: 'من القاهرة إلي الأسكندرية',
        dateAgo: 'منذ ٢ ساعة',
        status: 0),
    NotificationModel(
        title: 'السيارة خارج المسار ',
        desc: 'أنتبه! أنت تقود خارج المسار المحدد للرحلة',
        dateAgo: 'منذ ٢ ساعة',
        status: 1),
    NotificationModel(
        title: 'السيارة توقفت أثناء الرحلة',
        desc: 'قم بإبداء السبب حالاً',
        dateAgo: 'منذ ٢ ساعة',
        status: 2),
    NotificationModel(
        title: 'إضافة ساعات إضافية #9832',
        desc: 'فم بتحصيل مبلغ 2300 جنيه من العميل',
        dateAgo: 'منذ ٢ ساعة',
        status: 3),
    NotificationModel(
        title: 'الرحلة أنتهت ',
        desc: 'أمر شغل #23489',
        dateAgo: 'منذ ٢ ساعة',
        status: 4),
    NotificationModel(
        title: 'باقي ٣٠ دقيقة علي بداية أمر الشغل #48943',
        desc: 'تأكد من وجودك في مكان العميل قبل الموعد بخمس دقائق',
        dateAgo: 'منذ ٢ ساعة',
        status: 5),
  ];
}
