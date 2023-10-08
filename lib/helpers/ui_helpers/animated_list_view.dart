import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListView extends StatelessWidget {
  final List<Widget> children;

  final double? verticalOffset;
  final double? padding;

  final double? horizontalOffset;

  const AnimatedListView({
    super.key,
    required this.children,
    this.verticalOffset,
    this.horizontalOffset,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(padding ?? 0),
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: verticalOffset,
              horizontalOffset: horizontalOffset,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: children,
          ),
        ),
      ),
    );
  }
}
