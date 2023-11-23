import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golimo_driver/common/custom_button.dart';
import 'package:golimo_driver/common/text_hepler.dart';
import 'package:golimo_driver/core/consts/app_colors.dart';
import 'package:golimo_driver/feature/modules/fuel/cubit/fuel_cubit.dart';
import 'package:golimo_driver/helpers/ui_helpers/bottom_sheet_helper.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
import 'package:golimo_driver/helpers/ui_helpers/image_picker_helper.dart';
import 'package:image_picker/image_picker.dart';

class FinalFuelView extends StatefulWidget {
  const FinalFuelView({super.key});

  @override
  State<FinalFuelView> createState() => _FinalFuelViewState();
}

class _FinalFuelViewState extends State<FinalFuelView> {
  // File? _image;
  final picker = ImagePicker();
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FuelCubit, FuelState>(
      builder: (context, state) {
        final cubit = FuelCubit.of(context);

        return Column(
          children: [
            SvgPicture.asset(
              'assets/svg_icons/recipt.svg',
              width: 124.w,
              height: 76.h,
            ),
            20.sbH,
            const AppText(
              'قم بتصوير الفاتورة بوضوح',
              size: 13,
              color: AppColors.kGrayText,
              weight: FontWeight.w500,
            ),
            16.sbH,
            cubit.receipt != null
                ? InkWell(
                    child: InkWell(
                      onTap: () {
                        showSheet(
                            image: cubit.receipt!,
                            onRetakeImage: (image) {
                              cubit.updateImage(image: image!);
                            });
                      },
                      child: Container(
                        width: 388.w,
                        height: 276.h,
                        alignment: Alignment.topRight,
                        decoration: BoxDecoration(
                          color: AppColors.kLightGray,
                          image: DecorationImage(image: FileImage(cubit.receipt!)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: InkWell(
                          onTap: () {
                            cubit.resetImage();
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
                    onTap: () {
                      ImagePickerHelper.openCamera(onGet: (image) {
                        cubit.updateImage(image: image!);
                      });
                    },
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppText(
                      'كم لتر وقود',
                      size: 14,
                      color: AppColors.kBlack,
                      weight: FontWeight.w600,
                    ),
                    16.sbH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 98.w,
                          height: 70.h,
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              controller: controller,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF5F5F5),
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: AppColors.kPrimary,
                                      width: 1,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Color(0xffF5F5F5),
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
                                      color: Color(0xffF5F5F5),
                                      width: 1,
                                    )),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'مطلوب';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        12.sbW,
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.updateFuelType(1);
                              },
                              child: Container(
                                width: 130.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36.r),
                                    border: Border.all(
                                      color: cubit.fuelType != 1
                                          ? AppColors.kLightGray
                                          : AppColors.kPrimary,
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: cubit.fuelType != 1
                                          ? AppColors.kLightGray
                                          : AppColors.kPrimary,
                                      size: 10,
                                    ),
                                    5.sbW,
                                    AppText(
                                      'وقود 92',
                                      color: cubit.fuelType != 1
                                          ? AppColors.kLightGray
                                          : AppColors.kPrimary,
                                      size: 16.sp,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            6.sbW,
                            InkWell(
                              onTap: () {
                                cubit.updateFuelType(2);
                              },
                              child: Container(
                                width: 130.w,
                                height: 42.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(36.r),
                                    border: Border.all(
                                      color: cubit.fuelType == 1
                                          ? AppColors.kLightGray
                                          : AppColors.kPrimary,
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: cubit.fuelType == 1
                                          ? AppColors.kLightGray
                                          : AppColors.kPrimary,
                                      size: 10,
                                    ),
                                    5.sbW,
                                    AppText(
                                      'وقود 95',
                                      color: cubit.fuelType == 1
                                          ? AppColors.kLightGray
                                          : AppColors.kPrimary,
                                      size: 16.sp,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            47.sbH,
            CustomButton(
              buttonText: 'تأكيد عداد الكيلومترات',
              onBtnTap: () {
                formKey.currentState!.save();
                if (!formKey.currentState!.validate()) return;
                log("AADDDD");
              },
            )
          ],
        );
      },
    );
  }

  void showSheet({File? image, required Function(File?) onRetakeImage}) {
    BottomSheetHelper.gShowModalBottomSheet(
        context: context,
        maxHeight: 447.h,
        content: ListView(
          padding: EdgeInsets.all(16.r),
          children: [
            Image.file(
              image!,
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
                      image = null;
                      onRetakeImage(image);
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
}
