import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Category dropdown
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Profile'),
              const SizedBox(width: 4),
              const Icon(Icons.arrow_drop_down, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
