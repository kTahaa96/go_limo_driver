import 'package:flutter/material.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? labelText;
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.visiblePassword,
      obscureText: passwordVisibility,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Enter Your Password';
            } else if (value.length < 8) {
              return 'Password Must Be More Than 8 Characters';
            }
            return null;
          },
      autofillHints: const [
        AutofillHints.password,
      ],
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.kWhite,
      ),
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
              width: 2,
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
        hintText: "Password",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.kGrayText.withOpacity(0.6),
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
