import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListViewBuilder extends StatelessWidget {
  final Widget listItem;

  final int itemCount;

  final bool? scrollable;

  final bool? shrinkWrap;

  const AnimatedListViewBuilder(
      {super.key,
      required this.listItem,
      required this.itemCount,
      this.scrollable,
      this.shrinkWrap});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: shrinkWrap ?? false,
        physics: scrollable == false ? const NeverScrollableScrollPhysics() : null,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: listItem,
              ),
            ),
          );
        },
      ),
    );
  }
}
