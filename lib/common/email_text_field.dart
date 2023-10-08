import 'package:flutter/material.dart';
import 'package:golimo_driver/common/app_text_field.dart';
import 'package:golimo_driver/common/input_validator.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

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
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kPrimary,
              width: 1,
              style: BorderStyle.solid,
            )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.kPrimary,
                width: 2,
                style: BorderStyle.solid,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.kRed,
                width: 1,
                style: BorderStyle.solid,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.kRed,
                width: 2,
                style: BorderStyle.solid,
              )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.kGray,
                width: 1,
                style: BorderStyle.solid,
              )),
          errorMaxLines: 2,
          focusColor: AppColors.kBlack,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.only(right: 0, left: 16, top: 12),
          hintText: "Email Address",
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.kGrayText.withOpacity(0.6),
          )),
      autofillHints: const [
        AutofillHints.email,
      ],
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhite,
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textDirection: TextDirection.ltr,
      textInputAction: TextInputAction.next,
      autovalidateMode: isFirst ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Enter Email Address';
        }

        if (!InputValidator.isEmail(value!)) {
          return 'Enter A Valid  Email Address';
        }
        return null;
      },
    );
  }
}
