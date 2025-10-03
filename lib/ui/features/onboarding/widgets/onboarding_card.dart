import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/utils/translation_helper.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    required this.images,
    required this.title,
    required this.desc,
    required this.textButton,
    required this.onPressed,
    super.key,
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
          padding: EdgeInsets.only(
            bottom: context.spacing.huge,
            left: context.spacing.xl,
            right: context.spacing.xl,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  getTranslatedText(context, title),
                  textAlign: TextAlign.center,
                  style: HBTextStyles.headingThree(
                    context.colorScheme.onSecondary,
                  ),
                ),
                SizedBox(height: context.spacing.md),
                Text(
                  getTranslatedText(context, desc),
                  textAlign: TextAlign.center,
                  style: HBTextStyles.bodyRegularSmall(
                    context.colorScheme.onSecondary.withValues(alpha: 0.7),
                    letterSpacing: 0.5,
                  ),
                ),
                SizedBox(height: context.spacing.xxl),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: context.spacing.xxl,
                    top: context.spacing.huge,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: PrimaryBtn(
                      size: 56,
                      textButton: getTranslatedText(context, textButton),
                      onPressed: onPressed,
                      bold: true,
                      isSelected: true,
                    ),
                  ),
                ),

                if (textButton == 'getStarted')
                  Padding(
                    padding: EdgeInsets.only(bottom: context.spacing.xl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.l10n.noAccount,
                          style: TextStyle(
                            color: context.colorScheme.onPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () => {},
                          child: Text(
                            context.l10n.register,
                            style: GoogleFonts.roboto().copyWith(
                              color: context.colorScheme.primary,
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
