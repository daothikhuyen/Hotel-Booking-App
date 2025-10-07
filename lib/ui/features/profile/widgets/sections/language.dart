import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/ui/features/profile/data/languages_data.dart';
import 'package:hotel_booking_app/ui/features/profile/view_model/profile_controller.dart';
import 'package:hotel_booking_app/ui/features/profile/widgets/language_card.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProfileController>(context);

    return Scaffold(
      appBar: HBAppBar(
        isScrolled: false,
        title: context.l10n.languages,
        color: context.colorScheme.onSurfaceVariant,
        onPressed: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: context.spacing.lg.w,
            right: context.spacing.lg.w,
            top: context.spacing.xl.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.spacing.lg),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.01.w,
                    color: context.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.suggestedLanguages,
                      style: HBTextStyles.bodySemiboldSmall(
                        context.colorScheme.onTertiary,
                      ),
                    ),
                    SizedBox(height: context.spacing.md),
                    ...suggestedLanguages.asMap().entries.map((entry) {
                      final index = entry.key;
                      final lang = entry.value;
                      return Column(
                        children: [
                          LanguageCard(
                            isSelected: controller.selctedIndex == index,
                            // ignore: lines_longer_than_80_chars
                            title: getTranslatedText(context, lang['name'] ?? ''),
                            color: context.colorScheme.onSurfaceVariant,
                            onPressed: () {
                              controller
                                ..setSelectedLanguage(index, lang['code'] ?? '')
                                ..setLocale(Locale(lang['code'] ?? 'en'));
                            },
                          ),
        
                          if (index < suggestedLanguages.length - 1)
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: context.spacing.lg,
                              ),
                              child: const BuildDivider(),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: context.spacing.xxl.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.spacing.lg),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.01.w,
                    color: context.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.otherLanguages,
                      style: HBTextStyles.bodySemiboldSmall(
                        context.colorScheme.onTertiary,
                      ),
                    ),
                    SizedBox(height: context.spacing.md.h),
        
                    ...otherLanguages.asMap().entries.map((entry) {
                      final index = entry.key;
                      final lang = entry.value;
                      return Column(
                        children: [
                          LanguageCard(
                            isSelected: false,
                            title: lang['name'] ?? '',
                            onPressed: () {},
                            color: context.colorScheme.onTertiary,
                          ),
        
                          if (index < otherLanguages.length - 1)
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: context.spacing.lg.h,
                              ),
                              child: const BuildDivider(),
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
