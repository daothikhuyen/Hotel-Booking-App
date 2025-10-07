import 'package:hotel_booking_app/ui/core/core.dart';

class RemmenberCheckbox extends StatefulWidget {
  const RemmenberCheckbox({
    required this.size,
    required this.isTicked,
    super.key,
  });

  final double? size;
  final bool isTicked;

  @override
  State<RemmenberCheckbox> createState() => _RemmenberCheckboxState();
}

class _RemmenberCheckboxState extends State<RemmenberCheckbox> {
  bool _isTicked = false;

  @override
  void initState() {
    super.initState();
    _isTicked = widget.isTicked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTicked = !_isTicked;
        });
      },
      child:
          _isTicked
              ? Icon(
                Icons.check_circle,
                size: widget.size ?? 25.h,
                color: Theme.of(context).colorScheme.primary,
              )
              : Icon(
                Icons.circle_outlined,
                size: widget.size ?? 25.h,
                color: context.colorScheme.secondary,
              ),
    );
  }
}
