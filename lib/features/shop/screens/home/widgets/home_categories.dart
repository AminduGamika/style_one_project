import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_one/common/widgets/Shimmer/category_shimmer.dart';
import 'package:style_one/features/shop/controllers/category_controller.dart';
import 'package:style_one/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/image_text_widgets/vertical_image_test.dart';
import '../../../../../utils/constants/image_strings.dart';

class SOHomeCategory extends StatelessWidget {
  const SOHomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());


    return Obx(() {
      if(categoryController.isLoading.value) return const SOCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

        return SizedBox(
          height: 80,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: categoryController.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categoryController.featuredCategories[index];
                return SOVerticalImageText(
                    image: category.image,
                    title: category.name,
                    onTap: () => Get.to(() => const SubCategoriesScreen()));
              }
          ),
        );
      }
    );
  }
}