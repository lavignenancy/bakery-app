import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme.dart';
import 'app_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onTap});

  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppNetworkImage(url: product.image, fit: BoxFit.cover),
                    const Positioned(
                      top: 8,
                      right: 8,
                      child: _AddBadge(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(product.name,
                maxLines: 1, overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            Text(product.priceLabel,
                style: const TextStyle(color: AppColors.textFaded)),
          ],
        ),
      ),
    );
  }
}

class _AddBadge extends StatelessWidget {
  const _AddBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const BoxDecoration(
        color: AppColors.orange,
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.add, size: 16, color: Colors.white),
    );
  }
}
