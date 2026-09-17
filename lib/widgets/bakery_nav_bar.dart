import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../theme.dart';

class BakeryNavBar extends StatelessWidget {
  const BakeryNavBar({super.key});

  static const _items = [
    (Icons.storefront_outlined, 'Home'),
    (Icons.search, 'Search'),
    (Icons.shopping_bag_outlined, 'Cart'),
    (Icons.person_outline, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 64,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            for (final (i, (icon, label)) in _items.indexed)
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (label == 'Cart') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const CartScreen(),
                        ),
                      );
                    } else if (label == 'Profile') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    } else if (label == 'Search') {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => const SearchScreen(),
                        ),
                      );
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 24,
                        color: i == 0 ? AppColors.orangeDeep : AppColors.textFaded,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 11,
                          color: i == 0 ? AppColors.orangeDeep : AppColors.textFaded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
