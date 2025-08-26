import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/features/request_booking/widgets/items/date_picker_item.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, this.onDateSelected});

  final void Function(DateTime start, DateTime end, int nightCount)?
  onDateSelected;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  List<DateTime?> _dialogCalendarPickerValue = [DateTime.now(), DateTime.now()];

  String? formatStartDate;
  String? formatEndDate;
  String? today = DateFormat('MMM dd, yyyy').format(DateTime.now());
  int? nightCount;

  Future selectedDate() async {
    final values = await datePicker(context, _dialogCalendarPickerValue);
    if (values != null) {
      setState(() {
        _dialogCalendarPickerValue = values;

        final startDate = _dialogCalendarPickerValue[0];
        final endDate = _dialogCalendarPickerValue[1];

        if (startDate != null && endDate != null) {
          formatStartDate = DateFormat('MMM dd, yyyy').format(startDate);
          formatEndDate = DateFormat('MMM dd, yyyy').format(endDate);
        }

        nightCount = endDate?.difference(startDate ?? DateTime.now()).inDays;

        final seectedDate = widget.onDateSelected;
        if (seectedDate != null) {
          seectedDate(
            startDate ?? DateTime.now(),
            endDate ?? DateTime.now(),
            nightCount ?? 0,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: HeaderCard(
            title: context.l10n.date,
            onPressed: () {},
            titleBtn: '',
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: selectedDate,
                child: Container(
                  height: 94,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 5, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: context.colorScheme.onTertiary.withValues(
                      alpha: 0.2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.calendar,
                            colorFilter: ColorFilter.mode(
                              context.iconTheme.color ?? Colors.transparent,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            context.l10n.checkIn,
                            style: HBTextStyles.bodyMediumMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formatStartDate ?? today.toString(),
                        style: HBTextStyles.bodyRegularMedium(
                          context.colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: selectedDate,
                child: Container(
                  height: 94,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 5, left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: context.colorScheme.onTertiary.withValues(
                      alpha: 0.2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            Assets.images.icon.calendar,
                            colorFilter: ColorFilter.mode(
                              context.iconTheme.color ?? Colors.transparent,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            context.l10n.checkOut,
                            style: HBTextStyles.bodyMediumMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        formatEndDate ?? today.toString(),
                        style: HBTextStyles.bodyRegularMedium(
                          context.colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
