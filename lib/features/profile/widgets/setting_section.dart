import 'package:flutter/material.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/features/profile/widgets/option_card.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.setting,
          style: HBTextStyles.bodyMediumXLarge(
            context.colorScheme.onTertiary,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 30),
        // Option card for profile
        OptionCard(
          title: context.l10n.yourCard,
          image: Assets.images.icon.wallet,
        ),
        const SizedBox(height: 20),
        OptionCard(
          title: context.l10n.security,
          image: Assets.images.icon.shieldDone,
        ),
        const SizedBox(height: 20),
        OptionCard(
          title: context.l10n.notification,
          image: Assets.images.icon.vector,
        ),
        const SizedBox(height: 20),
        OptionCard(
          title: context.l10n.languages,
          image: Assets.images.icon.vector,
        ),
        const SizedBox(height: 20),
        OptionCard(
          title: context.l10n.help_support,
          image: Assets.images.icon.dangerCircle,
        ),
      ],
    );
  }
}
