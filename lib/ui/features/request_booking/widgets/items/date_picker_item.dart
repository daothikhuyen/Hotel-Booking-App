import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/alter/snack_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';

Future<List<DateTime?>?> datePicker(
  BuildContext context,
  List<DateTime?> dialogCalendarPickerValue,
) {
  var tempValue = List<DateTime?>.from(dialogCalendarPickerValue);

  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          height: 400,
          child: Column(
            children: [
              Expanded(
                child: CalendarDatePicker2(
                  value: dialogCalendarPickerValue,
                  config: CalendarDatePicker2Config(
                    calendarType: CalendarDatePicker2Type.range,
                    selectedDayHighlightColor: context.colorScheme.primary,
                  ),
                  onValueChanged: (values) {
                    tempValue = values;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          context.l10n.cancel,
                          style: HBTextStyles.bodyMediumSmall(
                            context.colorScheme.error,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: PrimaryBtn(
                        size: 40,
                        textButton: context.l10n.apply,
                        onPressed: () {
                          final startDate = tempValue[0];
                          if (startDate != null &&
                              startDate.isAfter(DateTime.now())) {
                            return Navigator.of(context).pop(tempValue);
                          } else {

                            HBSnackBar().showOverlayMessage(
                              context,
                              context.l10n.startDateMustBeFuture,
                            );
                          }
                        },
                        bold: false,
                        isSelected: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
