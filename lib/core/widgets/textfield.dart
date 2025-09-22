import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';

class HBTexField extends StatefulWidget {
  const HBTexField({
    required this.controller,
    required this.hintText,
    required this.color,
    this.validator,
    this.enabled = true,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    super.key,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color color;
  final bool enabled;

  @override
  State<HBTexField> createState() => _HBTexFieldState();
}

class _HBTexFieldState extends State<HBTexField> {
  bool _obscureText = true;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(13),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    final textColor = context.colorScheme.onSurfaceVariant;
    final hintColor = textColor.withValues(alpha: 0.7);
    final errorColor = context.colorScheme.error;

    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      enabled: widget.enabled,
      style:
          widget.enabled
              ? HBTextStyles.bodySemiboldSmall(textColor)
              : HBTextStyles.bodySemiboldSmall(hintColor),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: HBTextStyles.bodySemiboldSmall(hintColor),
        filled: true,
        fillColor: widget.color,
        border: InputBorder.none,
        enabledBorder: _border(Colors.transparent),
        focusedBorder: _border(Colors.transparent),
        disabledBorder: _border(Colors.transparent),
        errorBorder: _border(errorColor),
        focusedErrorBorder: _border(errorColor),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                )
                : null,
        errorStyle: HBTextStyles.bodyRegularMedium(errorColor),
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword && _obscureText,
    );
  }
}
