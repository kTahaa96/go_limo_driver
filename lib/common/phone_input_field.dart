import 'package:country_picker/country_picker.dart';
import 'package:dash_flags/dash_flags.dart' as flag;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/app_text_field.dart';
import 'package:golimo_driver/common/text_hepler.dart';
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
      autovalidateMode: AutovalidateMode.disabled,
      obscureText: widget.obscureText,
      onSaved: widget.onSaved,
      maxLines: widget.maxLines,
      textDirection: widget.textDirection,
      decoration: FormInputDecoration(
        errorStyle: TextStyle(fontFamily: 'Alexandria'),
        label: AppText(
          'ادخل رقم الهاتف',
          size: 15.sp,
          color: AppColors.kBlack,
          weight: FontWeight.w600,
        ),
        suffixIcon: UnconstrainedBox(child: buildSuffixIcon(context)),
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
                  return "ادخل رقم الهاتف";
                }
              }
              if (value!.isNotEmpty) {
                String val = value.replaceAll(' ', '');
                val = val.replaceAll('+', '');
                if (!val.startsWith(country.phoneCode)) {
                  return "اختر كود الدولة${country.phoneCode}";
                }
                if (val.length != (country.example.length + country.phoneCode.length)) {
                  return "ادخل رقم هاتف صحيح";
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
