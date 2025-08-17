import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app/core/extensions/theme_context_extention.dart';
import 'package:hotel_booking_app/core/widgets/buttons/primary_btn.dart';
import 'package:hotel_booking_app/core/widgets/cards/header_card.dart';
import 'package:hotel_booking_app/core/widgets/list/list_horizontal.dart';
import 'package:hotel_booking_app/data/model/hotel.dart';
import 'package:hotel_booking_app/features/detail/widgets/facilities_card.dart';
import 'package:hotel_booking_app/features/detail/widgets/read_more.dart';
import 'package:hotel_booking_app/features/detail/widgets/review_card.dart';
import 'package:hotel_booking_app/features/home/controller/hotel_controller.dart';
import 'package:hotel_booking_app/features/home/widgets/map_section.dart';
import 'package:hotel_booking_app/gen/assets.gen.dart';
import 'package:hotel_booking_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.hotel});

  final Hotel hotel;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Hotel> hotelRecomended = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<HotelController>(context, listen: false);
      final recomended = await controller.fetchRecomendedHotels();

      setState(() {
        hotelRecomended = recomended;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HotelController>(context, listen: false);

    return Scaffold(
      body: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            height: 374,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.hotel.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Text(
                      'Detail',
                      style: GoogleFonts.jost(
                        textStyle: context.textTheme.titleLarge!.copyWith(
                          color: context.colorScheme.surface,
                          letterSpacing: 0.5,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GestureDetector(
                    child: Icon(Icons.more_vert, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 18,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.hotel.name,
                                  style: context.textTheme.titleLarge!.copyWith(
                                    color: context.colorScheme.onSurfaceVariant,
                                    letterSpacing: 0.5,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4, top: 10),
                                      child: SvgPicture.asset(
                                        width: 18,
                                        height: 18,
                                        Assets.images.icon.frame,
                                        fit: BoxFit.contain,
                                      ),
                                    ),

                                    Text(
                                      widget.hotel.location,
                                      style: context.textTheme.bodySmall!
                                          .copyWith(
                                            color:
                                                context.colorScheme.onTertiary,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 8,
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.images.icon.solarStarBold,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      '${widget.hotel.ratting}',
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: context
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              color:
                                                  context
                                                      .colorScheme
                                                      .onSurfaceVariant,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: context.colorScheme.secondary,
                                child: SvgPicture.asset(
                                  Assets.images.icon.a3dRotate,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 10),
                          child: HeaderCard(
                            title: 'Common Facilities',
                            onPressed: () {},
                            titleBtn: AppLocalizations.of(context)!.seeAll,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilitiesCard(),
                            FacilitiesCard(),
                            FacilitiesCard(),
                            FacilitiesCard(),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: HeaderCard(
                            title: 'Description',
                            onPressed: () {},
                            titleBtn: '',
                          ),
                        ),
                        ReadMore(
                          text:
                              'The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea viewsThe ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views. ',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: MapSection(title: 'Locations'),
                        ),
                        HeaderCard(
                          title: 'Reviews',
                          onPressed: () {},
                          titleBtn: 'See All',
                        ),
                        ReviewCard(number: 2,),

                        ListHorizontal(
                          hotelRecomended,
                          AppLocalizations.of(context)!.homeRecommended,
                          AppLocalizations.of(context)!.seeAll,
                        ),
                        SizedBox(height: 80,),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                border: Border(top: BorderSide(
                  width: 0.5,
                  color: context.colorScheme.outline,
                ),),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.onTertiary,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          '\$${widget.hotel.current_price}.000',
                          style: context.textTheme.displaySmall!.copyWith(
                            color: context.colorScheme.inverseSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: PrimaryBtn(
                      textButton: 'Booking Now',
                      onPressed: () {},
                      bold: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
