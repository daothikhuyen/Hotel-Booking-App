import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/features/home/controller/search_hotel_controller.dart';
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

Future<dynamic> filterCard(
  BuildContext context,
  SearchHotelController controller,
) {
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
                left: context.spacing.lg.w,
                top: context.spacing.xxl.h,
                bottom: context.spacing.xl.h,
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
                  SizedBox(height: context.spacing.sm.h),
                  Container(
                    margin: EdgeInsets.only(right: context.spacing.lg.w),
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
                  SizedBox(height: context.spacing.xl.h),
                  Text(
                    context.l10n.titlePrice,
                    style: HBTextStyles.bodyMediumMedium(
                      context.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: context.spacing.sm.h),
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
                  SizedBox(height: context.spacing.md.h),
                  SizedBox(
                    height: 43.h,
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
                            size: 42.h,
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
                      padding: EdgeInsets.only(right: context.spacing.lg.w),
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
                                    left: context.spacing.sm.w,
                                  ),
                                  width: 56.w,
                                  height: 43.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          starSelected == start
                                              ? context.colorScheme.primary
                                              : context.colorScheme.outline,
                                      width: 1.01.w,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        Assets.images.icon.solarStarBold,
                                        width: 18.w,
                                        height: 18.w,
                                      ),
                                      SizedBox(height: context.spacing.xs.h),
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
                  SizedBox(height: context.spacing.xl.h),
                  Container(
                    margin: EdgeInsets.only(right: context.spacing.lg.w),
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
                        size: 46.h,
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
