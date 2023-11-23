import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/app_text_field.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? labelText;
  final bool isFirst;

  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Function(String value)? onSubmitted;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.labelText,
    this.validator,
    this.textInputAction,
    this.onSubmitted,
    required this.isFirst,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppColors.kBlack),
      autovalidateMode:
          widget.isFirst ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: passwordVisibility,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'ادخل كلمة المرور';
            } else if (value.length < 8) {
              return 'كلمة المرور يجب ان لا تقل عن ٨ حروف او ارقام';
            }
            return null;
          },
      autofillHints: const [
        AutofillHints.password,
      ],
      decoration: FormInputDecoration(
        errorStyle: TextStyle(fontFamily: 'Alexandria'),

        label: AppText(
          'ادخل كلمة المرور',
          size: 16.sp,
          color: AppColors.kBlack,
          weight: FontWeight.w600,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            passwordVisibility ? Icons.visibility_off : Icons.visibility,
            size: 16,
            color: AppColors.kDarkGray,
          ),
          onPressed: () => setState(() {
            passwordVisibility = !passwordVisibility;
          }),
        ),
      ),
      onFieldSubmitted: widget.onSubmitted,
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
