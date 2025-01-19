import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Bottomnavbar extends StatelessWidget {
  final void Function(int)? onTabChange;

  Bottomnavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        color: Theme.of(context)
            .colorScheme
            .secondary, //Colors.lightBlueAccent.shade200,
        activeColor: Theme.of(context)
            .colorScheme
            .inversePrimary, //Colors.lightBlueAccent.shade700,
        tabBorderRadius: 16,
        tabBackgroundColor: Theme.of(context)
            .colorScheme
            .secondary, //Colors.lightBlueAccent.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 8,
        onTabChange: (value) => onTabChange!(value),

        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
            iconColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          GButton(
            icon: Icons.pin_drop,
            text: "Report",
            iconColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          GButton(
            icon: Icons.label_important_outline_rounded,
            text: "Ripple",
            iconColor: Theme.of(context).colorScheme.inversePrimary,
          ),
          GButton(
            icon: Icons.chat,
            text: "Chat",
            iconColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
    );
  }
}
