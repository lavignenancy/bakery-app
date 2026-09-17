import 'package:flutter/material.dart';

import '../theme.dart';
import 'app_network_image.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.label,
    required this.image,
    this.accent = false,
  });

  final String label;
  final String image;
  final bool accent;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppNetworkImage(url: image, fit: BoxFit.cover),
          if (accent)
            Container(color: AppColors.orange.withValues(alpha: 0.85)),
          if (accent)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Promo\n40% off',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
