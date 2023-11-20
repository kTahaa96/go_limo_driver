// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:golimo_driver/common/text_hepler.dart';
// import 'package:golimo_driver/core/consts/app_colors.dart';
// import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';
//
// class EmptyView extends StatelessWidget {
//   final String text ;
//   final VoidCallback onRefresh ;
//   const EmptyView({super.key, required this.text, required this.onRefresh});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.h),
//       child: Column(
//         children: [
//           const AppText(
//             'لا توجد اوامر شغل حتي الان',
//             color: AppColors.kWhite,
//           ),
//           18.sbH,
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const AppText(
//                 'تحديث',
//                 color: AppColors.kWhite,
//               ),
//               4.sbW,
//               const Icon(
//                 Icons.refresh,
//                 color: AppColors.kWhite,
//                 size: 16,
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
