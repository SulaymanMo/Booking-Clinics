import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final double elevation;

  const BasicAppBar({
    super.key,
    required this.title,
    this.actionIcon,
    this.onActionPressed,
    this.elevation = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(title),
      elevation: elevation,
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
