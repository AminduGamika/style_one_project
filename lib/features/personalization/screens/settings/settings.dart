import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/common/widgets/appbar/appbar.dart';
import 'package:style_one/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:style_one/common/widgets/list_tiles/settings_menu_title.dart';
import 'package:style_one/common/widgets/texts/section_heading.dart';
import 'package:style_one/features/authentication/controllers/login/login_controller.dart';
import 'package:style_one/features/personalization/screens/profile/profile.dart';
import 'package:style_one/features/shop/screens/cart/cart.dart';
import 'package:style_one/features/shop/screens/order/order.dart';
import 'package:style_one/utils/constants/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/widgets/list_tiles/user_profile_title.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/colors.dart';
import '../address/address.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri whatsApp = Uri.parse('https://wa.me/+94714594794');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// ---- Header
            SOPrimaryHeaderContainer(
              child: Column(
              children: [
              //// ---- AppBar
                SOAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: SOColors.white))),

              //// ---- User Profile Card
                SOUserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: SOSizes.spaceBtwSections),

              ],
            ),
            ),

            //// ----- BODY
            Padding(
              padding: const EdgeInsets.all(SOSizes.defaultSpace),
              child: Column(
                children: [
                  //// ---- Account Settings
                  const SOSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: SOSizes.spaceBtwItems),

                  SOSettingsMenuTitle(icon: Iconsax.safe_home, title: 'My Address', subTitle: 'Set shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                  SOSettingsMenuTitle(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, Remove products and move to checkout', onTap: () => Get.to(() => const CartScreen())),
                  SOSettingsMenuTitle(icon: Iconsax.bag_tick, title: 'My Order', subTitle: 'In-progress and Completed Orders', onTap: () => Get.to(() => const OrderScreen())),
                  const SOSettingsMenuTitle(icon: Iconsax.bank, title: 'My Account', subTitle: 'Withdraw balance to registered bank account'),
                  const SOSettingsMenuTitle(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discount coupons'),
                  SOSettingsMenuTitle(icon: Iconsax.message, title: 'WhatsApp', subTitle: 'Style One Whatsapp Support Team', onTap: (() async {launchUrl(whatsApp);})),
                  const SOSettingsMenuTitle(icon: Iconsax.notification, title: 'Notification', subTitle: 'Set any kind of notification message'),
                  const SOSettingsMenuTitle(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  //// ---- App Settings
                  const SizedBox(height: SOSizes.spaceBtwSections),
                  const SOSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: SOSizes.spaceBtwItems),
                  const SOSettingsMenuTitle(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  SOSettingsMenuTitle(icon: Iconsax.location, title: 'Geolocation', subTitle: 'Upload Data to your Cloud Firebase', trailing: Switch(value: true, onChanged: (value) {}),),
                  SOSettingsMenuTitle(icon: Iconsax.security_user, title: 'Safe mode', subTitle: 'Upload Data to your Cloud Firebase', trailing: Switch(value: false, onChanged: (value) {}),),
                  SOSettingsMenuTitle(icon: Iconsax.image, title: 'HD Image Quality', subTitle: 'Upload Data to your Cloud Firebase', trailing: Switch(value: false, onChanged: (value) {}),),

                  //// ---- Logout Button
                  const SizedBox(height: SOSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: ()  => AuthenticationRepository.instance.logout() , child: const Text('Logout')),
                  ),
                  const SizedBox(height: SOSizes.spaceBtwSections * 2.5),
                ],
              ),
            
            ),

          ],
        ),
      ),
    );
  }
}


