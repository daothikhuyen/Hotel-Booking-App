import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/routing/page_routes.dart';
import 'package:hotel_booking_app/ui/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/ui/core/themes/theme.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';
import 'package:provider/provider.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    required this.linkImage,
    required this.userName,
    required this.location,
    super.key,
  });

  final String? linkImage;
  final String userName;
  final String location;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (userName != '')
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image:
                            linkImage != ''
                                ? NetworkImage(linkImage!)
                                : AssetImage(Assets.images.avatar.ellipse.path)
                                    as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: context.spacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          userName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: HBTextStyles.bodySemiboldMedium(
                              context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        SizedBox(height: context.spacing.xs),
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.images.icon.vector,
                              colorFilter: ColorFilter.mode(
                                context.colorScheme.onSurfaceVariant.withValues(
                                  alpha: 0.7,
                                ),
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: context.spacing.xs),
                            Text(
                              location,
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: HBTextStyles.bodyRegularSmall(
                                  context.colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          else
            SizedBox(
              width: 200,
              child: PrimaryBtn(
                size: 56,
                textButton: context.l10n.signIn,
                onPressed: () {
                  context.go(PageRoutes.signIn);
                },
                bold: false,
                isSelected: true,
              ),
            ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.go(
                    PageRoutes.search,
                    extra: controller.listRecomended,
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colorScheme.outline),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.sm),
                    child: SvgPicture.asset(
                      Assets.images.icon.search,
                      colorFilter: ColorFilter.mode(
                        context.iconTheme.color ?? Colors.transparent,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.spacing.sm),
              GestureDetector(
                onTap: () {
                  //TODOS:...
                }, // temporary
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colorScheme.outline),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.sm),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images.icon.group,
                          colorFilter: ColorFilter.mode(
                            context.iconTheme.color ?? Colors.transparent,
                            BlendMode.srcIn,
                          ),
                        ),

                        Positioned(
                          top: 1.4,
                          right: 3,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: context.colorScheme.onSecondary,
                            child: CircleAvatar(
                              radius: 2.5,
                              backgroundColor: context.colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
             SizedBox(width: context.spacing.lg),
            ],
          ),
        ],
      ),
    );
  }
}
