import 'package:flutter/material.dart';

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

  void _goBack(BuildContext context) {
    if (backHandler != null) {
      backHandler!();
    } else {
      Navigator.of(context).pop();
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
        onPressed: () => _goBack(context),
      ),
      title: AppText(
        text: label,
      ),
    );
  }
}
