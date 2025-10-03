import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/ui/features/home/view_model/hotel_controller.dart';

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
      padding: EdgeInsets.symmetric(vertical: context.spacing.xs.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (userName != '')
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: 40.h,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                  SizedBox(width: context.spacing.md.w),
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
                              width: 18.w,
                              height: 18.h,
                              colorFilter: ColorFilter.mode(
                                context.colorScheme.onSurfaceVariant.withValues(
                                  alpha: 0.7,
                                ),
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: context.spacing.xs.w),
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
              width: 200.w,
              child: PrimaryBtn(
                size: 56.h,
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
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colorScheme.outline),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.sm),
                    child: SvgPicture.asset(
                      Assets.images.icon.search,
                      width: 20.w,
                      height: 20.h,
                      colorFilter: ColorFilter.mode(
                        context.iconTheme.color ?? Colors.transparent,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.spacing.sm.w),
              GestureDetector(
                onTap: () {
                  //TODOS:...
                }, // temporary
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colorScheme.outline),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.sm),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.images.icon.group,
                          width: 20.w,
                          height: 20.h,
                          colorFilter: ColorFilter.mode(
                            context.iconTheme.color ?? Colors.transparent,
                            BlendMode.srcIn,
                          ),
                        ),

                        Positioned(
                          top: 1.4.h,
                          right: 3.w,
                          child: CircleAvatar(
                            radius: 4.r,
                            backgroundColor: context.colorScheme.onSecondary,
                            child: CircleAvatar(
                              radius: 2.5.r,
                              backgroundColor: context.colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: context.spacing.lg.w),
            ],
          ),
        ],
      ),
    );
  }
}
