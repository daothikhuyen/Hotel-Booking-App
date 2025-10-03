import 'package:hotel_booking_app/ui/core/core.dart';
class HBTextField extends StatefulWidget {
  const HBTextField({
    required this.controller,
    required this.hintText,
    required this.color,
    this.onChanged,
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
  final ValueChanged<String>? onChanged;

  @override
  State<HBTextField> createState() => _HBTextFieldState();
}

class _HBTextFieldState extends State<HBTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onChanged: widget.onChanged,
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
        enabledBorder: border(Colors.transparent),
        focusedBorder: border(Colors.transparent),
        disabledBorder: border(Colors.transparent),
        errorBorder: border(errorColor),
        focusedErrorBorder: border(errorColor),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    widget.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: widget.onToggleObscureText,
                )
                : null,
        errorStyle: HBTextStyles.bodyRegularMedium(errorColor),
      ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPassword && widget.obscureText,
    );
  }
}
