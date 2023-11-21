import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

import 'app_text_field.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.isFirst,
    this.label,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isFirst;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.kBlack),

      decoration: const FormInputDecoration(
        label: AppText(
          'رقم الهاتف',
          size: 16,
          color: AppColors.kBlack,
          weight: FontWeight.w600,
        ),
      ),

      autocorrect: false,
      keyboardType: TextInputType.phone,
      textDirection: TextDirection.rtl,
      textInputAction: TextInputAction.next,
      autovalidateMode: isFirst ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'ادخل رقم الهاتف';
        }
        if (value!.length < 10) {
          return 'ادخل رقم هاتف صحيح';
        }
        return null;
      },
    );
  }
}
