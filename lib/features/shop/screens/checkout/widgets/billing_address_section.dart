import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class SOBillingAddressSection extends StatelessWidget {
  const SOBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SOSectionHeading(title: 'Deliver Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Amindu Gamika', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: SOSizes.spaceBtwItems),
            Text('(+94) 70 4343 007', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: SOSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_pin, color: Colors.grey, size: 16),
            const SizedBox(width: SOSizes.spaceBtwItems),
            Expanded(child: Text('No. 255/24,\nMihindu Mawatha, \nKottawa, Homagama. 10230',
                       style: Theme.of(context).textTheme.bodyMedium, softWrap: true)),
          ],
        ),
      ],
    );
  }
}
