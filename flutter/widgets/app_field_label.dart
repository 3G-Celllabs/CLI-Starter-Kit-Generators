import 'package:flutter/material.dart';

class AppFieldLabel extends StatelessWidget {
  const AppFieldLabel({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildContent(context),
    );
  }

  List<Widget> _buildContent(BuildContext context) {
    List<Widget> widgets = [const SizedBox()];

    if (label.isNotEmpty) {
      widgets = [
        AppText.subHeading16(
          context,
          text: label,
          color: Theme.of(context).colorScheme.onTertiary,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ];
    }
    return widgets;
  }
}
