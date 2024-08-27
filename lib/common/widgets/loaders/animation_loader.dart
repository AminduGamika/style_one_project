import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:style_one/utils/constants/colors.dart';
import 'package:style_one/utils/constants/sizes.dart';

/// A widget for displaying on animated loading indicator with optional text and action button.
class SOAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the animationLoaderWidget.
  ///
  /// Parameters:
  ///   - text : the text to be displayed below the animation.
  ///   - animation: The path to the lottie animation file.
  ///   - showAction: Whether to show an action button below the text.
  ///   - actionText: The the to be displayed on the action button.
  ///   - onActionPressed: Callback function to be executed when the action button is pressed.
  const SOAnimationLoaderWidget(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed,
      });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // Display Lottie animation
          const SizedBox(height: SOSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: SOSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: SOColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: SOColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
