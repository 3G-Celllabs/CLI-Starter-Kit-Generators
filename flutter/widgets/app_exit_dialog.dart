import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppExitDialog extends StatelessWidget {
  const AppExitDialog({
    super.key,
    required this.heading,
    required this.yesLabel,
    this.noLabel = 'Cancel',
    required this.handleYes,
    this.handleNo,
  });

  final String heading;
  final String yesLabel;
  final String noLabel;
  final void Function() handleYes;
  final void Function()? handleNo;

  void _handleNo() {
    if (handleNo != null) {
      handleNo!();
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.72,
      child: SimpleDialog(
        backgroundColor: AppThemeColors.white,
        insetPadding:
            const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 40.0,
            ),
            child: Center(
              child: Text(
                heading,
                style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppThemeColors.textPrimaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Divider(color: AppThemeColors.dividerColor),
          SizedBox(
            height: 48.0,
            child: GestureDetector(
              onTap: handleYes,
              child: Center(
                child: Text(
                  yesLabel,
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppThemeColors.textErrorColor,
                      ),
                ),
              ),
            ),
          ),
          const Divider(color: AppThemeColors.dividerColor),
          SizedBox(
            height: 48.0,
            child: GestureDetector(
              onTap: handleNo,
              child: Center(
                child: Text(
                  noLabel,
                  style: Theme.of(Get.context!).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppThemeColors.textSecondaryColor,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
