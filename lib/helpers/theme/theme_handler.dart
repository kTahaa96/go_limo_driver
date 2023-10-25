// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:golimo_driver/helpers/theme/theme_cubit.dart';
//
// class ThemeHandler extends StatelessWidget with TickerProviderStateMixin {
//   final Widget child;
//
//   const ThemeHandler({Key? key, required this.child}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<ThemeCubit>(
//       create: (context) => ThemeCubit(this),
//       child: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 500),
//         child: child,
//       ),
//     );
//   }
// }