import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/ui/core/core.dart';
import 'package:hotel_booking_app/ui/core/widgets/app_bar.dart';
import 'package:hotel_booking_app/ui/core/widgets/cards/skeleton.dart';
import 'package:hotel_booking_app/ui/features/auth/controller/auth_controller.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/bottom_bar.dart';
import 'package:hotel_booking_app/ui/features/hotel_detail/widgets/section/popup_card.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({required this.hotel, super.key});

  final Hotel hotel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isScrolled = false;

  void onScrollChange({required bool scrolled}) {
    setState(() {
      isScrolled = scrolled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthController>(context);
    final user = userProvider.currentUser;
    var hotel = widget.hotel;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          hotel = widget.hotel;
        },
        child: Stack(
          children: [
            if (hotel.image.isNotEmpty)
              Container(
                height: 374.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(hotel.image),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Skeleton(width: double.infinity, height: 374.h),

            Container(
              height: 374.h,
              decoration: BoxDecoration(
                color: context.colorScheme.inverseSurface.withValues(
                  alpha: 0.35,
                ),
              ),
            ),

            // body detail
            PopupCard(hotel: widget.hotel, onScrollChange: onScrollChange),
            // header detail
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: HBAppBar(
                isScrolled: isScrolled,
                title: context.l10n.titleDetail,
                color: context.colorScheme.onSecondary,
                onPressed: () => context.pop(),
              ),
            ),

            // booking bottom bar
            BottomBar(hotel: widget.hotel, user: user),
          ],
        ),
      ),
    );
  }
}
