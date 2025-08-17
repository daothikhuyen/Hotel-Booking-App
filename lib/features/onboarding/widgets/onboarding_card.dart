import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/themes/theme.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:hotel_booking_app/core/utils/translation_helper.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.images,
    required this.title,
    required this.desc,
    required this.textButton,
    required this.onPressed,
  });

  final String images;
  final String title;
  final String desc;
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(images, fit: BoxFit.cover),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [context.colorScheme.inverseSurface, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [0.2, 0.8],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0, left: 20, right: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  getTranslatedText(context, title),
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.headingThree(context.colorScheme.onSurface),
                ),
                const SizedBox(height: 12),
                Text(
                  getTranslatedText(context, desc),
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.bodyRegularSmall(context.colorScheme.onSurface.withValues(alpha: 0.7), letterSpacing: 0.5),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30 , top: 40),
                  child: PrimaryBtn(
                    textButton: getTranslatedText(context, textButton),
                    onPressed: () => onPressed(),
                    bold: true,
                  ),
                ),

                if (textButton == 'getStarted')
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.noAccount,
                          style: TextStyle(color:  context.colorScheme.onPrimary),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: Text(
                            AppLocalizations.of(context)!.register,
                            style: GoogleFonts.roboto().copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
