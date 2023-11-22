import 'package:flutter/material.dart';
/// By ICONIC.

class StateConditionalBuilder extends StatelessWidget implements PreferredSizeWidget {
  /// Condition to control what gets rendered. ===> loading
  final bool loadingCondition;

  /// Condition to control what gets rendered. ===> Error
  final bool errorCondition;

  /// Run if [condition] is true.
  final WidgetBuilder loadingBuilder;
  final WidgetBuilder errorBuilder;

  /// Run if [condition] is false and it is not null.
  final WidgetBuilder? fallback;

  const StateConditionalBuilder({
    Key? key,
    required this.loadingCondition,
    required this.errorCondition,
    required this.errorBuilder,
    required this.loadingBuilder,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => loadingCondition
      ? loadingBuilder(context)
      : errorCondition
          ? errorBuilder(context)
          : fallback != null
              ? fallback!(context)
              : const SizedBox.shrink();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


