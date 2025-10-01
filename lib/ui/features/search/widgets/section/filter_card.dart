import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/data/filter_data.dart';

DropdownMenuItem<String> buildMenuItem(BuildContext context, String item) {
  final text = extractBedBath(item);
  final value =
      '${context.l10n.bed(text['bed'] ?? 0)},'
      ' ${context.l10n.bathroom(text['bathroom'] ?? 0)}';

  return DropdownMenuItem(value: item, child: Text(value));
}

Map<String, int> extractBedBath(String item) {
  final regex = RegExp(r'(\d+)\s*bed.*?(\d+)\s*bath');
  final match = regex.firstMatch(item.toLowerCase());
  if (match != null) {
    final bed = int.parse(match.group(1) ?? '');
    final bath = int.parse(match.group(2) ?? '');
    return {'bed': bed, 'bathroom': bath};
  }
  return {'bed': 0, 'bathroom': 0};
}

Future<dynamic> filterCard(BuildContext context, HotelController controller) {
  String? selectedValue;
  String? locationSelected;
  String? starSelected;
  var numberRoom = <String, int>{'bed': 0, 'bathroom': 0};
  double currentSliderValue = 0;

  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    isScrollControlled: true,
    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
    builder: (context) {
      return SizedBox(
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                left: context.spacing.lg,
                top: context.spacing.xxl,
                bottom: context.spacing.xl,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: Text(
                      context.l10n.filter,
                      style: HBTextStyles.bodySemiboldLarge(
                        context.colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: context.spacing.lg),
                  Text(
                    context.l10n.roomCount,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: context.spacing.sm),
                  Container(
                    margin: EdgeInsets.only(right: context.spacing.lg),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing.md,
                      vertical: context.spacing.xs,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: context.colorScheme.outline),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: selectedValue,
                        isExpanded: true,
                        items:
                            items
                                .map((item) => buildMenuItem(context, item))
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            numberRoom = extractBedBath(value ?? '');
                            selectedValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                 SizedBox(height: context.spacing.xl),
                  Text(
                    context.l10n.titlePrice,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: context.spacing.sm),
                  Slider(
                    value: currentSliderValue,
                    max: 1000,
                    divisions: 4,
                    inactiveColor: context.colorScheme.outline,
                    label: currentSliderValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        currentSliderValue = value;
                      });
                    },
                  ),
                 SizedBox(height: context.spacing.xl),
                  Text(
                    context.l10n.location,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                 SizedBox(height: context.spacing.md),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: locationItem.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: context.spacing.sm),
                          child: PrimaryBtn(
                            textButton: locationItem[index],
                            onPressed: () {
                              setState(() {
                                locationSelected = locationItem[index];
                              });
                            },
                            bold: false,
                            size: 42,
                            isSelected: locationSelected == locationItem[index],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: context.spacing.xl),
                  Text(
                    context.l10n.rating,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: context.spacing.md),
                  SizedBox(
                    height: context.spacing.huge,
                    child: Padding(
                      padding: EdgeInsets.only(right: context.spacing.lg),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:
                            starItem.map((start) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    starSelected = start;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: context.spacing.sm,
                                  ),
                                  width: 56,
                                  height: 43,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          starSelected == start
                                              ? context.colorScheme.primary
                                              : context.colorScheme.outline,
                                      width: 1.01,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.images.icon.solarStarBold,
                                        width: 18,
                                        height: 18,
                                      ),
                                      SizedBox(height: context.spacing.xs),
                                      Text(
                                        start,
                                        style: HBTextStyles.bodySemiboldMedium(
                                          context.colorScheme.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: context.spacing.xl),
                  Container(
                    margin: EdgeInsets.only(right: context.spacing.lg),
                    child: SizedBox(
                      width: double.infinity,
                      child: PrimaryBtn(
                        textButton: context.l10n.applyFilter,
                        onPressed: () async {
                          await controller
                              .filterHotel(
                                context,
                                locationSelected,
                                currentSliderValue,
                                numberRoom['bed'],
                                numberRoom['bathroom'],
                                int.tryParse(starSelected ?? ''),
                              )
                              .then((value) {
                                context.pop();
                              });
                        },
                        bold: false,
                        size: 56,
                        isSelected: true,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
