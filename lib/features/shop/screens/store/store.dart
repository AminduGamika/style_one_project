import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:style_one/common/widgets/layouts/grid_layouts.dart';
import 'package:style_one/common/widgets/product/cart/cart_menu_icon.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/features/shop/screens/brand/all_brands.dart';
import 'package:style_one/features/shop/screens/store/widgets/category_tab.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:style_one/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand/brand_card.dart';
import '../brand/brand_product.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: SOAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            SOCartCounterIcon(
              onPressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
            //// ----- Header -----
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(automaticallyImplyLeading: false, pinned: true, floating: true,
                  backgroundColor: SOHelperFunctions.isDarkMode(context) ? SOColors.black : SOColors.white,
                  expandedHeight: 440, flexibleSpace: Padding(padding: const EdgeInsets.all(SOSizes.defaultSpace),
                    child: ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                      children: [
                        /// ----- Search Bar
                        const SizedBox(height: SOSizes.spaceBtwItems),
                        const SOSearchContainer(text: 'Search in Store', showBorder: true, showBackground: false, padding: EdgeInsets.zero),
                        const SizedBox(height: SOSizes.spaceBtwSections),

                        /// ----- Feature Brands
                        SOSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                        const SizedBox(height: SOSizes.spaceBtwItems / 1.5),

                        /// ----- Brands GRID
                        SOGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (context, index) => SOBrandCard(
                            showBorder: true,
                            onTap: () => Get.to(() => const BrandProduct()
                            ),
                            ),
                        ),
                      ],
                    ),
                  ),

                  /// ----- TABS -----
                  bottom:  const SOTabBar(
                    tabs: [
                      Tab(child: Text('Girls')),
                      Tab(child: Text('Boys')),
                      Tab(child: Text('Women')),
                      Tab(child: Text('Men')),
                      Tab(child: Text('Kids')),
                      Tab(child: Text('Office')),
                      Tab(child: Text('Fancy')),
                    ],
                  ),
                ),
              ];
            },

            /// ---- Body ----
            body:const TabBarView(
              children: [
                SOCategoryTab(), SOCategoryTab(), SOCategoryTab(), SOCategoryTab(),
                SOCategoryTab(), SOCategoryTab(), SOCategoryTab(),],
            ),
      ),
      ),
    );
  }
}






