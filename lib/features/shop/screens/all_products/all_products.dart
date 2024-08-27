import 'package:flutter/material.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/product/sortable/sortable_products.dart';



class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SOAppBar(title: Text('Popular Products', style: Theme.of(context).textTheme.headlineMedium), showBackArrow: true),

      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SOSizes.defaultSpace),
          child: SOSortableProducts(),
        ),
      ),
    );
  }
}


