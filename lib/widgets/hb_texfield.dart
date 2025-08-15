import 'package:flutter/material.dart';
import 'package:hotel_booking_app/extensions/theme_context_extention.dart';

class HBTexField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const HBTexField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

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
      style: context.textTheme.labelLarge!.copyWith(color: textColor),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: context.textTheme.labelLarge!.copyWith(color: hintColor),
        filled: true,
        fillColor: context.colorScheme.onTertiary,
        border: InputBorder.none,
        enabledBorder: _border(Colors.transparent),
        focusedBorder: _border(Colors.transparent),
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
        errorStyle: context.textTheme.bodyMedium!.copyWith(color: errorColor),
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword && _obscureText,
    );
  }
}
