import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    Key? key,
    this.hintTitle,
    this.controller,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.onSubmitted,
    this.validator,
    this.maxLines,
    this.inputFormatters,
    this.onSaved,
    this.textInputAction,
    this.textDirection,
    this.onChanged,
    this.obscureText = false,
    this.required = false,
    this.hasHeight = true,
    this.enabled = true,
    this.fontSize,
    this.fontWeight,
    this.fontColor,
    this.autoValidateMode,
    this.suffixIcon,
  }) : super(key: key);

  final String? hintTitle;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Function(String value)? onSubmitted;
  final Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final Color? fontColor;
  final Function(String value)? onChanged;
  final bool obscureText;
  final bool hasHeight;
  final bool required;
  final bool enabled;
  final Widget? suffixIcon;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      style: TextStyle(
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: fontColor ?? AppColors.kDarkGray,
      ),
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      onSaved: onSaved,
      maxLines: maxLines,
      textDirection: textDirection,
      decoration: FormInputDecoration(
        suffixIcon: suffixIcon,
        isDense: true,
        label: Text.rich(
          TextSpan(
            text: hintTitle,
            children: [
              if (required) ...[
                const TextSpan(
                  text: '  *',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmitted,
    );
  }
}

class FormInputDecoration = InputDecoration with _FormInputDecoration;

mixin _FormInputDecoration on InputDecoration {
  @override
  bool get filled => false;

  @override
  EdgeInsetsGeometry get contentPadding {
    return const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 6,
    );
  }

  @override
  TextStyle get hintStyle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kDarkGray,
  );

  @override
  TextStyle get errorStyle => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: null,
    fontFamily: 'Alexandria',
    color: AppColors.kRed,
  );

  @override
  TextStyle get labelStyle => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kDarkGray,
  );

  @override
  int? get errorMaxLines => super.errorMaxLines ?? 6;

  @override
  InputBorder get border => UnderlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: AppColors.kLightGray,
    ),
  );

  @override
  InputBorder get enabledBorder => UnderlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: AppColors.kLightGray,
    ),
  );

  @override
  InputBorder get focusedBorder => UnderlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: Colors.black,
    ),
  );
}
