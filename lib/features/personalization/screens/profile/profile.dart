
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/Shimmer/shimmer.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/common/widgets/images/so_circular_image.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/features/personalization/controllers/user_controller.dart';
import 'package:style_one/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:style_one/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:style_one/utils/constants/image_strings.dart';
import 'package:style_one/utils/constants/sizes.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SOAppBar(showBackArrow: true, title: Text('Profile')),

      //// ---- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SOSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : SOImages.user2;
                      return controller.imageUploading.value
                      ? const SOShimmerEffect(width: 80, height: 80, radius: 80)
                      : SOCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              /// Details
              const SizedBox(height: SOSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SOSizes.spaceBtwItems),

              // --- Heading Profile Info
              const SOSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: SOSizes.spaceBtwItems),

              SOProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName())),
              SOProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {  }),

              const SizedBox(height: SOSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SOSizes.spaceBtwItems),

              // --- Heading Personal Info
              const SOSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: SOSizes.spaceBtwItems),

              SOProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {  }),
              SOProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
              SOProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              SOProfileMenu(title: 'Gender', value: 'Male', onPressed: () {  }),
              SOProfileMenu(title: 'Date of Birth', value: '10 Oct 1999', onPressed: () {  }),
              const Divider(),
              const SizedBox(height: SOSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Delete Account', style: TextStyle(color: Colors.red)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


