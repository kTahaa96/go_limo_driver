import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/core/consts/trip_setting_item_model.dart';
import 'package:golimo_driver/feature/booking_details/widgets/trip_settting_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class CheckTripSettingView extends StatefulWidget {
  final VoidCallback callback;

  final List<TripSettingItemModel> settingList;

  const CheckTripSettingView({super.key, required this.callback, required this.settingList});

  @override
  State<CheckTripSettingView> createState() => _CheckTripSettingViewState();
}

class _CheckTripSettingViewState extends State<CheckTripSettingView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          'قم بتأكيد التالي قبل بداية الرحلة',
          size: 13.sp,
          weight: FontWeight.w600,
        ),
        14.sbH,
        AppText(
          'علم علي الآتي ثم أضغط زر التأكيد',
          size: 13.sp,
          weight: FontWeight.w400,
          color: AppColors.kLightGray,
        ),
        ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 1),
          padding: EdgeInsets.symmetric(vertical: 24.h),
          itemCount: widget.settingList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => TripSettingItem(
            label: widget.settingList[index].label,
            onClick: () {
              setState(() {
                widget.settingList[index].isSelected = !widget.settingList[index].isSelected;
              });
            },
            value: widget.settingList[index].isSelected,
          ),
        ),
        100.sbH,
        CustomButton(
            buttonText: 'تأكيد بداية الرحلة',
            onBtnTap: () {
              widget.callback();
            })
      ],
    );
  }
}
