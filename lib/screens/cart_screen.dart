import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../theme.dart';
import '../widgets/app_network_image.dart';
import '../widgets/price_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Cart, '),
              TextSpan(
                text: '${cart.itemCount} items',
                style: const TextStyle(color: AppColors.textFaded),
              ),
            ],
          ),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, size: 22),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: cart.lines.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : SafeArea(
              child: Column(
                children: [
                  Expanded(child: _buildList(context, cart)),
                  _buildFooter(context, cart),
                  const SizedBox(height: 12),
                ],
              ),
            ),
    );
  }

  Widget _buildList(BuildContext context, Cart cart) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: cart.lines.length,
      separatorBuilder: (_, __) => const SizedBox(height: 14),
      itemBuilder: (context, i) => _CartLineTile(
        line: cart.lines[i],
        onIncrement: () => cart.increment(cart.lines[i]),
        onDecrement: () => cart.decrement(cart.lines[i]),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, Cart cart) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal',
                  style: TextStyle(color: AppColors.textFaded)),
              Text(
                '\$${cart.subtotal.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          PriceButton(
            label: 'Checkout',
            price: cart.subtotal,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Checkout is ready!'),
                  backgroundColor: AppColors.orangeDeep,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CartLineTile extends StatelessWidget {
  const _CartLineTile({
    required this.line,
    required this.onIncrement,
    required this.onDecrement,
  });

  final CartLine line;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AppNetworkImage(
            url: line.product.image,
            width: 72,
            height: 72,
            radius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(line.product.name,
                  style: Theme.of(context).textTheme.titleMedium),
              if (line.addOns.isNotEmpty)
                Text(
                  'with ${line.addOns.map((a) => a.name).join(', ')}',
                  style:
                      const TextStyle(color: AppColors.textFaded, fontSize: 12),
                ),
              const SizedBox(height: 4),
              Text(line.product.priceLabel,
                  style: const TextStyle(color: AppColors.textFaded)),
            ],
          ),
        ),
        _Stepper(
          qty: line.qty,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ],
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper({
    required this.qty,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int qty;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _stepBtn(Icons.remove, onDecrement, enabled: qty > 0),
        Text('$qty', style: const TextStyle(fontWeight: FontWeight.w600)),
        _stepBtn(Icons.add, onIncrement),
      ],
    );
  }

  Widget _stepBtn(IconData icon, VoidCallback onTap, {bool enabled = true}) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 26,
        height: 26,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: AppColors.textDark),
      ),
    );
  }
}
