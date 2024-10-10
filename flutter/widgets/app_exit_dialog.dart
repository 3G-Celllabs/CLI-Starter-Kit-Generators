import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
        backgroundColor: kWhite,
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
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline,
          ),
          SizedBox(
            height: 48.0,
            child: GestureDetector(
              onTap: handleYes,
              child: Center(
                child: Text(
                  yesLabel,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                ),
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.outline,
          ),
          SizedBox(
            height: 48.0,
            child: GestureDetector(
              onTap: _handleNo,
              child: Center(
                child: Text(
                  noLabel,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSecondary,
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
