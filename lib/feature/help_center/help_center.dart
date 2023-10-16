import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golimo_driver/common/app_bar_row.dart';
import 'package:golimo_driver/feature/help_center/widgets/question_item.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            32.sbH,
            AppBarRow(label: 'مساعدة'),
            16.sbH,
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => QuestionRowItem(
                      index: index,
                    ))
          ],
        ),
      ),
    );
  }
}
