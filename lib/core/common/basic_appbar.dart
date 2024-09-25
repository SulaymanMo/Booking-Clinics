import 'package:booking_clinics/core/constant/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final bool showBackArrow;

  const BasicAppBar({
    super.key,
    required this.title,
    this.actionIcon,
    this.onActionPressed,
    this.showBackArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () => context.nav.pop(),
        icon: const Icon(Iconsax.arrow_left_2),
      ),
      automaticallyImplyLeading: showBackArrow,
      title: Text(title),
      actions: actionIcon != null
          ? [
              IconButton(
                icon: Icon(actionIcon),
                onPressed: onActionPressed,
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
