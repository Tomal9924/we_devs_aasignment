import 'package:animated_digit/animated_digit.dart';
import 'package:dokan/core/shared/extensions/theme.dart';
import 'package:dokan/features/dashboard/domain/entities/product.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/shared/shared.dart';
import '../../../../core/taka.dart';

class Item extends StatefulWidget {
  final Product item;
  const Item({super.key, required this.item});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: PhysicalModel(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 4,
            color: theme.white,
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //TODO: Due to "Imag URL" issue i trien to show the image as placeholder.
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: widget.item.images.isNotEmpty
                        ? "https://png.pngtree.com/thumb_back/fw800/background/20221203/pngtree-blue-abstract-background-with-floral-flat-design-shopping-cart-and-text-placeholder-photo-image_20751820.jpg"
                        : widget.item.images[0].src,
                    fit: BoxFit.cover,
                    imageBuilder: (context, image) => Image(image: image),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.21,
                    placeholder: (context, url) => SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.21,
                      child: Image.network(
                        "https://png.pngtree.com/thumb_back/fw800/background/20221203/pngtree-blue-abstract-background-with-floral-flat-design-shopping-cart-and-text-placeholder-photo-image_20751820.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.21,
                      child: Image.network(
                        "https://png.pngtree.com/thumb_back/fw800/background/20221203/pngtree-blue-abstract-background-with-floral-flat-design-shopping-cart-and-text-placeholder-photo-image_20751820.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Text(
                    widget.item.name,
                    style: TextStyles.body(
                      context: context,
                      color: theme.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: "",
                      children: [
                        WidgetSpan(
                          child: AnimatedDigitWidget(
                            value: widget.item.regularPrice,
                            textStyle: TextStyles.subTitle(
                              context: context,
                              color: theme.iconColor,
                            ).copyWith(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 17,
                                fontWeight: FontWeight.w400),
                            prefix: UnicodeText.taka,
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(width: 4)),
                        WidgetSpan(
                          child: AnimatedDigitWidget(
                            value: widget.item.price,
                            textStyle: TextStyles.subTitle(
                                    context: context, color: theme.textPrimary)
                                .copyWith(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                            prefix: " ৳",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: RatingBar(
                    itemSize: 18,
                    initialRating: double.parse(widget.item.averageRating),
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star_rounded, color: theme.ratingColor),
                      half: Icon(Icons.star_half_rounded,
                          color: theme.ratingColor),
                      empty: Icon(Icons.star_border_rounded,
                          color: theme.ratingColor),
                    ),
                    onRatingUpdate: (val) {},
                    allowHalfRating: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
