import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/theme/data/style.dart';

@widgetbook.UseCase(name: 'Default', type: Text)
Widget buildTextStyleUseCase(BuildContext context) {
  final defaultColor = Theme.of(context).colorScheme.onSurface;

  return Scaffold(
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            fonts.map((font) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    font.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.spacing.lg),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children:
                        font.textStyle.map((entry) {
                          return Container(
                            padding: EdgeInsets.all(context.spacing.md),
                            width: 160,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entry.name,
                                  style: entry.style(defaultColor),
                                ),
                                SizedBox(height: context.spacing.xs),
                                Text(
                                  entry.description,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                  ),
                ],
              );
            }).toList(),
      ),
    ),
  );
}
