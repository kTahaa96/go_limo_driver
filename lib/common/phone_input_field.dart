import 'package:country_picker/country_picker.dart';
import 'package:dash_flags/dash_flags.dart' as flag;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';

import '../helpers/validator/order_validators.dart';

class PhoneTextFormField extends StatefulWidget {
  const PhoneTextFormField({
    Key? key,
    this.hintTitle,
    this.controller,
    this.focusNode,
    this.textInputType = TextInputType.text,
    this.onSubmitted,
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
    this.canChangeCountry,
  }) : super(key: key);

  final String? hintTitle;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final Function(String value)? onSubmitted;
  final Function(String? value)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextDirection? textDirection;
  final Function(String value)? onChanged;
  final bool obscureText;
  final bool hasHeight;
  final bool required;
  final bool enabled;
  final bool? canChangeCountry;

  @override
  State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  late Country country;
  String eg = 'eg';

  void getCountryPhoneCode() {
    if (widget.controller!.text.isNotEmpty) {
      for (var cty in CountryService().getAll()) {
        String dialCode = cty.phoneCode;
        if (widget.controller!.text.startsWith(dialCode)) {
          country = CountryService().findByCode(cty.countryCode)!;
          return;
        } else {
          country = CountryService().findByCode(eg)!;
        }
      }
    } else {
      country = CountryService().findByCode(eg)!;
    }
  }

  @override
  void initState() {
    getCountryPhoneCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: widget.obscureText,
      onSaved: widget.onSaved,
      maxLines: widget.maxLines,
      textDirection: widget.textDirection,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.kPrimary,
              width: 1.w,
              style: BorderStyle.solid,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.kPrimary,
              width: 2.w,
              style: BorderStyle.solid,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.kRed,
              width: 1.w,
              style: BorderStyle.solid,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.kRed,
              width: 2.w,
              style: BorderStyle.solid,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.kGray,
              width: 1.w,
              style: BorderStyle.solid,
            )),
        hintText: country.countryCode.toLowerCase() == eg
            ? '01001234567'
            : '${country.phoneCode} ${country.example}',
        contentPadding: const EdgeInsets.only(right: 0, left: 16, top: 12),
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: AppColors.kGrayText.withOpacity(0.6),
        ),
        prefixIcon: UnconstrainedBox(child: buildSuffixIcon(context)),
      ),
      onChanged: (value) {
        widget.onChanged?.call(country.phoneCode);
      },
      validator: country.countryCode.toLowerCase() == eg
          ? (value) {
              return widget.required
                  ? AppValidators.phone(value)
                  : AppValidators.phoneOptional(value);
            }
          : (value) {
              if (widget.required) {
                if (value!.isEmpty) {
                  return "Enter Mobile Number";
                }
              }
              if (value!.isNotEmpty) {
                String val = value.replaceAll(' ', '');
                val = val.replaceAll('+', '');
                if (!val.startsWith(country.phoneCode)) {
                  return "Please Enter Country Code${country.phoneCode}";
                }
                if (val.length != (country.example.length + country.phoneCode.length)) {
                  return "Please Enter A valid Phone Number";
                }
              }
              return null;
            },
      onFieldSubmitted: (value) {
        widget.onSubmitted?.call(country.phoneCode);
      },
    );
  }

  Widget buildSuffixIcon(BuildContext context) {
    return InkWell(
      onTap: widget.canChangeCountry != false
          ? () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                useSafeArea: true,
                onSelect: (Country cty) => setState(() {
                  country = cty;
                }),
              );
            }
          : null,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 8,
            ),
            flag.CountryFlag(
              country: flag.Country.fromCode(
                country.countryCode.toLowerCase(),
              ),
              height: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text("(+${country.phoneCode})"),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: .5,
              height: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
