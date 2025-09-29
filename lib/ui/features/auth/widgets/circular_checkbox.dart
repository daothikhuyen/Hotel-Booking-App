import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';

class CircularCheckbox extends StatefulWidget {
  const CircularCheckbox({
    required this.size,
    required this.isCheckbox,
    super.key,
  });

  final double? size;
  final bool isCheckbox;

  @override
  State<CircularCheckbox> createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  bool _isCheckbox = false;

  @override
  void initState() {
    super.initState();
    _isCheckbox = widget.isCheckbox;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isCheckbox = !_isCheckbox;
        });
      },
      child:
          _isCheckbox
              ? Icon(
                Icons.check_circle,
                size: widget.size ?? 25.0,
                color: Theme.of(context).colorScheme.primary,
              )
              : Icon(
                Icons.circle_outlined,
                size: widget.size ?? 25.0,
                color: context.colorScheme.secondary,
              ),
    );
  }
}
