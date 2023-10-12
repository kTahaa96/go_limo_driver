import 'package:flutter/material.dart';
import 'package:golimo_driver/common/app_bar_row.dart';
import 'package:golimo_driver/helpers/ui_helpers/extentions.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            32.sbH,
            AppBarRow(label: 'مساعدة'),
            16.sbH,

          ],
        ),
      ),
    );
  }
}
