# Bakery App (Flutter)

Three screens matching the reference design:

1. **Home**:address header ("Regent Street, 16"), 3×2 category grid with a
   promo tile, "Places" carousel, "Best products" carousel, bottom nav bar.
2. **Product detail**: full-bleed hero image, name + weight, description,
   "Add to order" add-on picker (multi-select), price/action button.
3. **Cart**: item list with quantity steppers, subtotal, checkout button.

## Setup

```bash
flutter create Bakery_app
flutter pub get
flutter run
```

## Notes

- Drop your own photos into `assets/images/` using the names referenced in
  `lib/models/product.dart`, `lib/screens/home_screen.dart`, and
  `lib/screens/product_screen.dart`. Placeholder names: `croissant.png`,
  `strawberry_cake.png`, `vanilla_cream.png`, `addon_latte.png`,
  `addon_raspberry.png`, `addon_matcha.png`, `cat_*.png`, `place_cafe.png`,
  `place_2.png`.
- State management uses `provider` (already in pubspec).
