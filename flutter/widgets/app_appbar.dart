import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    required this.label,
    this.backHandler,
    super.key,
  }) : preferredSize = const Size.fromHeight(56.0);

  @override
  final Size preferredSize;

  final String label;
  final void Function()? backHandler;

  void _goBack() {
    if (backHandler != null) {
      backHandler!();
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(
        icon: const Icon(
          Icons.chevron_left_rounded,
          size: 16.0,
        ),
        onPressed: _goBack,
      ),
      title: AppText(
        text: label,
      ),
    );
  }
}
