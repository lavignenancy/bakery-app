import '../models/product.dart';

/// Central place to tweak the demo menu and image paths.
const demoProducts = [
  Product(
    id: 'choco-croissant',
    name: 'Choco croissant',
    image:
        'https://images.unsplash.com/photo-1555507036-ab1f4038808a?auto=format&fit=crop&w=900&q=80',
    price: 3.20,
    weight: '85 g',
    description:
        'Flaky, buttery croissant filled with rich dark chocolate. '
        'Baked fresh every morning at our Regent Street bakery.',
  ),
  Product(
    id: 'strawberry-cake',
    name: 'Strawberry cake',
    image:
        'https://images.unsplash.com/photo-1464349095431-e9a21285b5f3?auto=format&fit=crop&w=900&q=80',
    price: 4.50,
    weight: '120 g',
    description:
        'Light sponge layered with whipped cream and fresh strawberries.',
  ),
  Product(
    id: 'vanilla-cream',
    name: 'Vanilla cream puff',
    image:
        'https://images.unsplash.com/photo-1551024601-bec78aea704b?auto=format&fit=crop&w=900&q=80',
    price: 2.80,
    weight: '60 g',
    description:
        'Crisp choux pastry filled with silky Madagascan vanilla cream.',
  ),
];
