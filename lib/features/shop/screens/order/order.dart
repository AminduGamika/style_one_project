import 'package:flutter/material.dart';
import 'package:style_one/features/shop/screens/order/widgets/order_list.dart';
import 'package:style_one/utils/constants/sizes.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// --- Appbar
      appBar: SOAppBar(showBackArrow: true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(padding: EdgeInsets.all(SOSizes.defaultSpace),

      /// --- Orders
      child: SOOrderListItems(),
       ),
    );
  }
}
