// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:golimo_driver/common/text_hepler.dart';
// import 'package:golimo_driver/core/consts/app_colors.dart';
// import 'package:golimo_driver/feature/help_center/help_center.dart';
// import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
//
// import '../feature/notificatiton_center/notification_center.dart';
//
// class AppBarRow extends StatelessWidget {
//   final String label;
//
//   final bool? onBackground;
//
//   const AppBarRow({super.key, required this.label, this.onBackground});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SvgPicture.asset(
//           'assets/svg_icons/driver_icon.svg',
//           width: 30.w,
//           height: 30.h,
//         ),
//         AppText(
//           '$label',
//           color: onBackground == true ? AppColors.kWhite : AppColors.kBlack,
//           size: 15.sp,
//         ),
//         Row(
//           children: [
//             InkWell(
//               onTap: (){
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HelpCenter()));
//               },
//               child: SvgPicture.asset(
//                 'assets/svg_icons/doughnut_chart.svg',
//                 width: 24.w,
//                 height: 24.h,
//                 color: onBackground == true ? AppColors.kWhite : AppColors.kBlack,
//               ),
//             ),
//             8.sbW,
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => NotificationCenter()));
//               },
//               child: SvgPicture.asset(
//                 'assets/svg_icons/home_notificatoin.svg',
//                 width: 24.w,
//                 height: 24.h,
//                 color: onBackground == true ? AppColors.kWhite : AppColors.kBlack,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
