import 'package:flutter/material.dart';

import '../data/menu.dart';
import '../theme.dart';
import '../widgets/bakery_nav_bar.dart';
import '../widgets/category_card.dart';
import '../widgets/place_card.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';
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
            _buildCategoryGrid(context),
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

  Widget _buildCategoryGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 0.75,
      children: const [
        CategoryCard(
          label: 'Bakery',
          image:
              'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&w=800&q=80',
          accent: true,
        ),
        CategoryCard(
          label: 'Cookies',
          image:
              'https://images.unsplash.com/photo-1499636136210-6d4ee4879e5b?auto=format&fit=crop&w=800&q=80',
        ),
        CategoryCard(
          label: 'Drinks',
          image:
              'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=800&q=80',
        ),
        CategoryCard(
          label: 'Donuts',
          image:
              'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=800&q=80',
        ),
        CategoryCard(
          label: 'Pizza',
          image:
              'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=800&q=80',
        ),
        CategoryCard(
          label: 'Salads',
          image:
              'https://images.unsplash.com/photo-1546793665-c74683f339c1?auto=format&fit=crop&w=800&q=80',
        ),
      ],
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
