import 'package:flutter/material.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:style_one/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../common/widgets/product/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// ---  Appbar
      appBar:
          const SOAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// ---  Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: SOSizes.spaceBtwItems),

              /// -- Overall Product Ratings
              const SOOverallProductRating(),
              const SORatingBarIndicator(ratings: 3.6),
              Text("12,034", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: SOSizes.spaceBtwSections),

              /// -- User Reviews list
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}







