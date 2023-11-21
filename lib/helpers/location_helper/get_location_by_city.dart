// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:golimo_driver/common/app_text_field.dart';
// import 'package:golimo_driver/common/conditional_builder.dart';
// import 'package:golimo_driver/common/delay_callback_timer.dart';
// import 'package:golimo_driver/common/loader/app_loader.dart';
// import 'package:golimo_driver/common/text_hepler.dart';
// import 'package:golimo_driver/core/consts/app_colors.dart';
// import 'package:golimo_driver/core/consts/strings.dart';
// import 'package:golimo_driver/core/models/trip_info/address_model/address_model.dart';
// import 'package:golimo_driver/core/models/trip_info/cities/city_model.dart';
// import 'package:golimo_driver/helpers/di/di.dart';
// import 'package:golimo_driver/helpers/location_helper/cubit/location_cubit.dart';
// import 'package:golimo_driver/helpers/navigator/named-navigator_impl.dart';
// import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
//
// class GetLocationByCity extends StatefulWidget {
//   final bool isPickUp;
//
//   final ServiceTypes serviceTypes;
//   final CityModel cityModel;
//
//   final Function(AddressModel) onPlaceSelect;
//
//   const GetLocationByCity({
//     super.key,
//     required this.isPickUp,
//     required this.serviceTypes,
//     required this.cityModel,
//     required this.onPlaceSelect,
//     // this.onCityChange,
//   });
//
//   @override
//   State<GetLocationByCity> createState() => _GetLocationByCityState();
// }
//
// class _GetLocationByCityState extends State<GetLocationByCity> {
//   final timerCallBackAction = TimerCallback(milliseconds: 350);
//   FocusNode searchFocusNode = FocusNode();
//   TextEditingController textEditingController = TextEditingController();
//
//   @override
//   void dispose() {
//     searchFocusNode.dispose();
//     textEditingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//
//         title: AppText("${widget.isPickUp ? "Pick Up" : "Drop Off"} Information"),
//       ),
//       body: BlocProvider(
//         create: (context) => di<LocationCubit>()..getPolygons(cityId: widget.cityModel.id),
//         child: BlocConsumer<LocationCubit, LocationState>(
//           listener: (context, state) {
//             if (state is SuccessLocationSelect) {
//               widget.onPlaceSelect(state.addressModel);
//               log('${state.addressModel.toJson()}');
//               NamedNavigatorImpl.pop();
//             }
//           },
//           builder: (context, state) {
//             final cubit = LocationCubit.of(context);
//             return ListView(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(16.h),
//                   child: AppTextFormField(
//                     controller: textEditingController,
//                     focusNode: searchFocusNode,
//                     suffixIcon: state is LoadingLocationSearchState
//                         ? Container(
//                             padding: EdgeInsets.all(16.w),
//                             width: 20,
//                             height: 20,
//                             child: const AppLoader())
//                         : const SizedBox(),
//                     hintTitle: "Enter ${widget.isPickUp ? "Pick Up" : "Drop Off"} Information",
//                     onChanged: (value) {
//                       timerCallBackAction.run(() {
//                         cubit.getPlaces(value, widget.cityModel);
//                       });
//                     },
//                   ),
//                 ),
//                 12.sbH,
//                 const Divider(
//                   color: AppColors.kLightGray,
//                   thickness: 12,
//                 ),
//                 12.sbH,
//                 ConditionalBuilder(
//                   condition: state is EmptyLocationSearchState,
//                   builder: (context) {
//                     return const SizedBox();
//                   },
//                   fallback: (context) {
//                     return ListView.separated(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: cubit.searchResults.length,
//                         separatorBuilder: (context, index) => const Divider(color: AppColors.kGray),
//                         itemBuilder: (context, index) => InkWell(
//                               onTap: () {
//                                 cubit.onSelectAddress(placeId: cubit.searchResults[index].placeId!);
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.all(4),
//                                       decoration: const BoxDecoration(
//                                           color: AppColors.kPrimary, shape: BoxShape.circle),
//                                       child: const Icon(
//                                         Icons.location_on,
//                                         color: AppColors.kWhite,
//                                         size: 16,
//                                       ),
//                                     ),
//                                     8.sbW,
//                                     SizedBox(
//                                       width: 350.w,
//                                       child: AppText(
//                                         "${cubit.searchResults[index].description}",
//                                         color: AppColors.kGrayText,
//                                         weight: FontWeight.w600,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ));
//                   },
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
