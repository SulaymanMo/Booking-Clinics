import 'package:flutter/material.dart';

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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 11.0,
            spreadRadius: 1.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: showBackArrow,
        title: Text(title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
        actions: actionIcon != null
            ? [
                IconButton(
                  icon: Icon(actionIcon),
                  onPressed: onActionPressed,
                ),
              ]
            : [],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
