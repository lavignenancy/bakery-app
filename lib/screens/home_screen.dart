import 'package:flutter/material.dart';

import '../data/menu.dart';
import '../theme.dart';
import '../widgets/bakery_nav_bar.dart';
import '../widgets/place_card.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
import 'checkout_screen.dart';
import 'product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: Text('Regent Street, 16', style: _titleStyle(context)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.keyboard_arrow_down, size: 26),
          ),
        ],
      ),
      bottomNavigationBar: const BakeryNavBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const CheckoutScreen(),
                  ),
                );
              },
              child: _buildPromoBanner(),
            ),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Places'),
            const SizedBox(height: 12),
            const _PlacesRow(),
            const SizedBox(height: 24),
            const SectionHeader(
              title: 'Best products',
              showTag: true,
            ),
            const SizedBox(height: 12),
            const _BestProductsRow(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  TextStyle _titleStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
          );

  Widget _buildPromoBanner() {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFFF4C98B), Color(0xFFE99B5A)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Weekend surprise',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '40% off',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'On curated bakery boxes',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.local_offer_rounded, color: Colors.white, size: 46),
        ],
      ),
    );
  }

}

class _PlacesRow extends StatelessWidget {
  const _PlacesRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          PlaceCard(
            name: 'Kankaria cafe',
            tag: 'Open',
            image:
                'https://images.unsplash.com/photo-1554118811-1e0d58224f24?auto=format&fit=crop&w=900&q=80',
          ),
          SizedBox(width: 12),
          PlaceCard(
            name: 'Bisari cafe',
            tag: 'Open',
            image:
                'https://images.unsplash.com/photo-1521017432531-fbd92d768814?auto=format&fit=crop&w=900&q=80',
          ),
        ],
      ),
    );
  }
}

class _BestProductsRow extends StatelessWidget {
  const _BestProductsRow();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: demoProducts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, i) => ProductCard(
          product: demoProducts[i],
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (_) => ProductScreen(product: demoProducts[i]),
            ),
          ),
        ),
      ),
    );
  }
}
