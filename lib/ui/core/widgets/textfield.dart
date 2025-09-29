import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';

class HBTextField extends StatelessWidget {
  const HBTextField({
    required this.controller,
    required this.hintText,
    required this.color,
    this.obscureText = false,
    this.validator,
    this.enabled = true,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    super.key,
    this.onToggleObscureText,
  });
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color color;
  final bool enabled;
  final bool obscureText;
  final VoidCallback? onToggleObscureText;

  @override
  Widget build(BuildContext context) {
    final textColor = context.colorScheme.onSurfaceVariant;
    final hintColor = textColor.withValues(alpha: 0.7);
    final errorColor = context.colorScheme.error;

    OutlineInputBorder border(Color color) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(color: color),
    );

    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      enabled: enabled,
      style:
          enabled
              ? HBTextStyles.bodySemiboldSmall(textColor)
              : HBTextStyles.bodySemiboldSmall(hintColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: HBTextStyles.bodySemiboldSmall(hintColor),
        filled: true,
        fillColor: color,
        border: InputBorder.none,
        enabledBorder: border(Colors.transparent),
        focusedBorder: border(Colors.transparent),
        disabledBorder: border(Colors.transparent),
        errorBorder: border(errorColor),
        focusedErrorBorder: border(errorColor),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: onToggleObscureText,
                )
                : null,
        errorStyle: HBTextStyles.bodyRegularMedium(errorColor),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: isPassword && obscureText,
    );
  }
}
