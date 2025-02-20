import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';
class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? iconColor, backgroundColor;
  final VoidCallback? onPress;

  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 32,
        height: 32,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey.withValues(alpha: .5),
                blurRadius: 50,
                spreadRadius: 7,
                offset: const Offset(1, 5)),
          ],
        ),

        child: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}