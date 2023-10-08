import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.hint,
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

  final String? hint;
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
        color: fontColor ?? AppColors.kWhite,
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
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kPrimary,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kPrimary,
              width: 2,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kRed,
              width: 1,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kRed,
              width: 2,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.kGray,
              width: 1,
            )),
        hintText: "$hint",
        contentPadding: const EdgeInsets.only(right: 0, left: 16, top: 12),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.kGrayText.withOpacity(0.6),
        ),
        suffixIcon: suffixIcon,
        errorStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.kRed,
        ), // isDense: true,
        // labelStyle: const TextStyle(fontSize: 14 , fontWeight: FontWeight.w500 , color: Colors.blue),
        // label: Text.rich(
        //   TextSpan(
        //     text: hint,
        //     children: [
        //       if (required) ...[
        //         const TextSpan(
        //           text: '  *',
        //           style: TextStyle(
        //             fontSize: 18,
        //             color: Colors.red,
        //           ),
        //         ),
        //       ],
        //     ],
        //   ),
        // ),
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
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        height: null,
        color: AppColors.kDarkGray,
      );

  @override
  TextStyle get errorStyle => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: null,
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
