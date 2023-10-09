import 'package:flutter/material.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

import 'app_text_field.dart';
import 'input_validator.dart';

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
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.kBlack
      ),

      decoration: const FormInputDecoration(
        label: AppText(
          'ادخل البريد الاكتروني',
          size: 16,
          color: AppColors.kBlack,
          weight: FontWeight.w600,
        ),
      ),
      autofillHints: const [
        AutofillHints.email,
      ],
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textDirection: TextDirection.ltr,
      textInputAction: TextInputAction.next,
      autovalidateMode: isFirst ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'ادخل البريد الالكتروني';
        }

        if (!InputValidator.isEmail(value!)) {
          return 'ادخل بريد الكتروني صحيح';
        }
        return null;
      },
    );
  }
}
