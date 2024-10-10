import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.align = TextAlign.start,
    required this.controller,
    this.errorText,
    this.hintText = '',
    this.isPassword = false,
    this.keyBoardType = TextInputType.text,
    required this.label,
    this.onChanged,
    super.key,
  });

  final TextAlign align;
  final TextEditingController controller;
  final String? errorText;
  final String hintText;
  final bool isPassword;
  final TextInputType keyBoardType;
  final String label;
  final Function? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isActive = false;
  bool isPasswordVisible = false;

  _handleFocusChange(bool value) {
    if (!value) {
      _updateIsActive(false);
    }
  }

  _updateIsActive(bool newValue) {
    setState(() {
      isActive = newValue;
    });
  }

  _togglePasswordVisible() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _evaluateWidgetHeight(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFieldLabel(label: widget.label),
          Focus(
            onFocusChange: _handleFocusChange,
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                errorText: widget.errorText,
                hintText: widget.hintText,
                suffixIcon: _buildSuffixIcon(),
              ),
              keyboardType: widget.keyBoardType,
              obscureText: widget.isPassword && !isPasswordVisible,
              onChanged: (value) =>
                  widget.onChanged != null ? widget.onChanged!(value) : () {},
              onFieldSubmitted: (value) => _handleFocusChange(false),
              onTap: () => _handleFocusChange(true),
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: widget.align,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    Widget? myWidget;
    if (widget.isPassword) {
      myWidget = IconButton(
        onPressed: _togglePasswordVisible,
        icon: isPasswordVisible
            ? const Icon(
                Icons.visibility_off_rounded,
                size: 20,
              )
            : const Icon(
                Icons.visibility,
                size: 20,
              ),
      );
    }
    return myWidget;
  }

  double _evaluateWidgetHeight() {
    double height = 52.0;

    if (widget.label.isNotEmpty) {
      height = 84.0;
    }
    if (widget.errorText != null) {
      height = height + 22.0;
    }
    return height;
  }
}
