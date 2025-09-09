import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/theme/data/color_data.dart';
import 'package:widgetbook_hotel_booking_app/hotel_booking/core/widgets/card_color.dart';

@widgetbook.UseCase(name: 'Default', type: Color)
Widget buildColorPaletteUseCase(BuildContext context) {

  return SingleChildScrollView(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: colors.map((color) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(color.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 12,
                children: color.colors
                    .map((entry) =>
                        ColorCard(color: entry.key, text: entry.value))
                    .toList(),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
