import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/helpers/ui_helpers/bottom_sheet_helper.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
import 'package:image_picker/image_picker.dart';

class ConfirmFuelView extends StatefulWidget {
  final VoidCallback onClickDone;

  const ConfirmFuelView({super.key, required this.onClickDone});

  @override
  State<ConfirmFuelView> createState() => _ConfirmFuelViewState();
}

class _ConfirmFuelViewState extends State<ConfirmFuelView> {
  File? _image;
  final picker = ImagePicker();
  GlobalKey<FormState> formkey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg_icons/order_acce.svg',
          width: 124.w,
          height: 76.h,
        ),
        20.sbH,
        const AppText(
          'قم بتصوير عداد الكيلومتر بوضوح',
          size: 13,
          centerText: true,
          color: AppColors.kGrayText,
          weight: FontWeight.w500,
        ),
        16.sbH,
        _image != null
            ? InkWell(
                child: InkWell(
                  onTap: () {
                    showSheet(image: _image!);
                  },
                  child: Container(
                    width: 388.w,
                    height: 276.h,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                      color: AppColors.kLightGray,
                      image: DecorationImage(image: FileImage(_image!)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _image = null;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: AppColors.kGray,
                      ),
                    ),
                  ),
                ),
              )
            : InkWell(
                onTap: getImage,
                child: Container(
                  width: 388.w,
                  height: 276.h,
                  margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppColors.kLightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.insert_photo_rounded,
                    color: AppColors.kGray,
                    size: 50,
                  ),
                ),
              ),
        12.sbH,
        Row(
          children: [
            Column(
              children: [
                AppText(
                  'إدخل الكيلومترات المتبقية',
                  size: 14,
                  color: AppColors.kBlack,
                  weight: FontWeight.w600,
                ),
                16.sbH,
                Form(
                  key: formkey,
                  child: Container(
                    width: 205.w,
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5), borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'إدخل الكيلومترات المتبقية';
                        }
                        return null ;
                      },
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        24.sbH,
        CustomButton(
          buttonText: 'تأكيد بداية الرحلة',
          color: _image == null ? AppColors.kDarkGray : null,
          onBtnTap: (){
            if(!formkey.currentState!.validate()){
              log('AAA');

              return ;
            }else{
              log('EEE');
              widget.onClickDone();
            }
          },
        )
      ],
    );
  }

  void showSheet({required File image}) {
    BottomSheetHelper.gShowModalBottomSheet(
        context: context,
        maxHeight: 447.h,
        content: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            Image.file(
              _image!,
              width: 388.w,
              height: 276.h,
            ),
            32.sbH,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      _image = null;
                      getImage();
                    },
                    child: const AppText(
                      'إعادة الصورة',
                      color: AppColors.kPrimary,
                    ),
                  ),
                  CustomButton(
                      buttonText: 'تأكيد',
                      width: 162.w,
                      onBtnTap: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ],
        ));
  }


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    showSheet(image: _image!);
  }

}
