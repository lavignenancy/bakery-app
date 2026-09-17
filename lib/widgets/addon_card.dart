import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme.dart';
import 'app_network_image.dart';

class AddOnCard extends StatelessWidget {
  const AddOnCard({
    super.key,
    required this.addOn,
    required this.selected,
    required this.onToggle,
  });

  final AddOn addOn;
  final bool selected;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: SizedBox(
        width: 110,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: AppNetworkImage(
                      url: addOn.image,
                      width: 110,
                      height: 120,
                      radius: BorderRadius.circular(14),
                    ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: selected ? AppColors.orange : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: selected
                        ? const Icon(Icons.check,
                            size: 14, color: Colors.white)
                        : const Icon(Icons.add,
                            size: 14, color: AppColors.textDark),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(addOn.name,
                maxLines: 1, overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            Text(addOn.priceLabel,
                style: const TextStyle(color: AppColors.textFaded)),
          ],
        ),
      ),
    );
  }
}
