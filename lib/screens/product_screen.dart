import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/product.dart';
import '../theme.dart';
import '../widgets/addon_card.dart';
import '../widgets/app_network_image.dart';
import '../widgets/price_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final Set<String> _selectedAddOns = {};

  static const addOns = [
    AddOn(
      id: 'latte',
      name: 'Latte',
      image:
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=600&q=80',
      price: 1.80,
    ),
    AddOn(
      id: 'raspberry',
      name: 'Raspberry',
      image:
          'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?auto=format&fit=crop&w=600&q=80',
      price: 2.10,
    ),
    AddOn(
      id: 'matcha',
      name: 'Matcha latte',
      image:
          'https://images.unsplash.com/photo-1515823064-d6e0c04616a7?auto=format&fit=crop&w=600&q=80',
      price: 2.40,
    ),
  ];

  double get _total {
    final addOnTotal = addOns
        .where((a) => _selectedAddOns.contains(a.id))
        .fold(0.0, (s, a) => s + a.price);
    return widget.product.price + addOnTotal;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildHero(product),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(product),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.textFaded, height: 1.4),
                        ),
                        const SizedBox(height: 20),
                        Text('Add to order',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 12),
                        _buildAddOnRow(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PriceButton(
              label: 'Add to cart',
              price: _total,
              onTap: () {
                final cart = context.read<Cart>();
                final chosen = addOns
                    .where((a) => _selectedAddOns.contains(a.id))
                    .toList();
                cart.add(product, addOns: chosen);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to cart'),
                    backgroundColor: AppColors.orangeDeep,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(Product product) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: AppColors.peach,
            child: AppNetworkImage(
              url: product.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(Icons.close, () => Navigator.of(context).pop()),
                  _circleButton(Icons.favorite_border, () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            width: 38,
            height: 38,
            child: Icon(icon, size: 20, color: AppColors.textDark),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(Product product) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: product.name),
          if (product.weight != null)
            TextSpan(
              text: ', ${product.weight}',
              style: const TextStyle(color: AppColors.textFaded),
            ),
        ],
      ),
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }

  Widget _buildAddOnRow() {
    return SizedBox(
      height: 170,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: addOns.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) {
          final addOn = addOns[i];
          return AddOnCard(
            addOn: addOn,
            selected: _selectedAddOns.contains(addOn.id),
            onToggle: () => setState(() {
              _selectedAddOns.contains(addOn.id)
                  ? _selectedAddOns.remove(addOn.id)
                  : _selectedAddOns.add(addOn.id);
            }),
          );
        },
      ),
    );
  }
}
