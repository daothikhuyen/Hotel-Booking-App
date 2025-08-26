import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:readmore/readmore.dart';

class ReadMore extends StatefulWidget {
  const ReadMore({required this.text, super.key, this.trimLines = 3});

  final String text;
  final int trimLines;

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text,
      style: TextStyle(color: context.colorScheme.tertiary),
      trimMode: TrimMode.Line,
      trimLines: widget.trimLines,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Read less',
      moreStyle: HBTextStyles.bodySemiboldSmall(context.colorScheme.primary),
      lessStyle:HBTextStyles.bodySemiboldSmall(context.colorScheme.primary),
    );
  }
}
