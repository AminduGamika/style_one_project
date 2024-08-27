import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:style_one/utils/constants/sizes.dart';

class SOProfileMenu extends StatelessWidget {
  const SOProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon = Iconsax.arrow_right_34,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final String title,value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: SOSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded (flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Expanded (flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis)),
            Expanded (child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}