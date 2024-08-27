import 'package:flutter/material.dart';
import 'package:style_one/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';

class SOOverallProductRating extends StatelessWidget {
  const SOOverallProductRating({
    super.key,
  });

@override
Widget build(BuildContext context) {
  return Row(
    children: [
      Expanded(
          flex: 3,
          child: Text('4.8',
              style: Theme.of(context).textTheme.displayLarge)),
      const Expanded(
        flex: 7,
        child: Column(
          children: [
            SORatingProgressIndicator(text: '5', value: 1.0),
            SORatingProgressIndicator(text: '4', value: 0.8),
            SORatingProgressIndicator(text: '3', value: 0.6),
            SORatingProgressIndicator(text: '2', value: 0.4),
            SORatingProgressIndicator(text: '1', value: 0.2),
          ],
        ),
      )
    ],
  );
}
}