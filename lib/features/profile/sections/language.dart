import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';
import 'package:hotel_booking_app/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/core/widgets/cards/build_divider.dart';
import 'package:hotel_booking_app/data/data/languages_data.dart';
import 'package:hotel_booking_app/features/profile/controller/profile_controller.dart';
import 'package:hotel_booking_app/features/profile/widgets/language_card.dart';
import 'package:provider/provider.dart';

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
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.01,
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
                  const SizedBox(height: 14),
                  ...suggestedLanguages.asMap().entries.map((entry) {
                    final index = entry.key;
                    final lang = entry.value;
                    return Column(
                      children: [
                        LanguageCard(
                          isSelected: controller.selctedIndex == index,
                          title: getTranslatedText(context, lang['name']?? ''),
                          color: context.colorScheme.onSurfaceVariant,
                          onPressed: () {
                            controller..setSelectedLanguage(
                              index,
                              lang['code'] ?? '',
                            )
                            ..setLocale(Locale(lang['code'] ?? 'en'));
                          },
                        ),

                        if (index < suggestedLanguages.length - 1)
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16),
                            child: const BuildDivider(),
                          ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.01,
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
                  const SizedBox(height: 14),

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
                            margin: const EdgeInsets.symmetric(vertical: 16),
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
    );
  }
}
