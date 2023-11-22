import 'package:flutter/material.dart';

import '../core/consts/app_colors.dart';

class ErrorStateWidget extends StatelessWidget {
  final void Function()? onRefresh;
  final String? errorMessage;
  final Color? backgroundColor;

  const ErrorStateWidget({Key? key, this.onRefresh, this.errorMessage, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: InkWell(
            onTap: () {
              onRefresh?.call();
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                IconButton(
                    onPressed: () {
                      onRefresh?.call();
                    },
                    icon: const Icon(Icons.refresh_outlined, size: 30, color: Colors.black54)),
                const Icon(
                  Icons.error_outline_outlined,
                  color: AppColors.kPrimary,
                  size: 26,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  errorMessage ?? "please check your network connection and try again",
                  style: const TextStyle(fontSize: 18, color: Colors.black45),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
