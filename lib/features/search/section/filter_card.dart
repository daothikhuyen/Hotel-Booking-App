import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/data/data/filter_data.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:provider/provider.dart';

DropdownMenuItem<String> buildMenuItem(BuildContext context, String item) {
  final text = extractBedBath(item);
  final value =
      '${context.l10n.bed(text['bed'] ?? 0)},'
      ' ${context.l10n.bathroom(text['bed'] ?? 0)}';

  return DropdownMenuItem(value: item, child: Text(value));
}

Map<String, int> extractBedBath(String item) {
  final regex = RegExp(r'(\d+)\s*bed.*?(\d+)\s*bath');
  final match = regex.firstMatch(item.toLowerCase());
  if (match != null) {
    final bed = int.parse(match.group(1)?? '');
    final bath = int.parse(match.group(2)?? '');
    return {'bed': bed, 'bathroom': bath};
  }
  return {'bed': 0, 'bathroom': 0};
}

Future<dynamic> filterCard(BuildContext context) {
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
              padding: const EdgeInsets.only(left: 18, top: 30, bottom: 20),
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
                  const SizedBox(height: 18),
                  Text(
                    context.l10n.roomCount,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.only(right: 18),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
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
                  const SizedBox(height: 20),
                  Text(
                    context.l10n.titlePrice,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 8),
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
                  const SizedBox(height: 20),
                  Text(
                    context.l10n.location,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: locationItem.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(left: 8),
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
                  const SizedBox(height: 20),
                  Text(
                    context.l10n.ratting,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18),
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
                                  margin: const EdgeInsets.only(left: 8),
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
                                      const SizedBox(width: 4),
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
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.only(right: 18),
                    child: SizedBox(
                      width: double.infinity,
                      child: PrimaryBtn(
                        textButton: context.l10n.applyFilter,
                        onPressed: () async {
                          final controller = context.read<HotelController>();
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
