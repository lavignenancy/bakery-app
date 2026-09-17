# Bakery App — Project Spec

Three screens matching the reference design:

| # | Screen | Key elements |
|---|--------|--------------|
| 1 | Home | "Regent Street, 16" address header, 3×2 category grid (Bakery tile has a 40%-off promo), "Places" carousel, "Best products" carousel with green "check" tag, white floating bottom nav |
| 2 | Product detail | Full-bleed hero photo with close + favourite buttons, product name + weight, description, "Add to order" multi-select add-on cards (Latte, Raspberry, Matcha latte), orange price/action button |
| 3 | Cart | Item rows with photo, name, unit price and −/+ quantity stepper, subtotal row, orange "Checkout" button |

## Architecture

- `lib/main.dart` — app entry, wraps everything in `ChangeNotifierProvider<Cart>`
- `lib/theme.dart` — warm cream/peach palette + serif typography (colors sampled from the mockup)
- `lib/models/product.dart` — `Product`, `AddOn`
- `lib/models/cart.dart` — `CartLine` + `Cart` (ChangeNotifier): add, increment, decrement, subtotal
- `lib/data/menu.dart` — demo menu data and image paths
- `lib/screens/` — `home_screen.dart`, `product_screen.dart`, `cart_screen.dart`
- `lib/widgets/` — `ProductCard`, `CategoryCard`, `PlaceCard`, `AddOnCard`, `SectionHeader`, `PriceButton`, `BakeryNavBar`

## Running it

```bash
flutter create .    # generates the android/ios/web folders around this code
flutter pub get
flutter run
```

## Assets

Placeholder images live in `assets/images/` (14 gradient PNGs). Replace them
with real photos using the same file names — every path is referenced from
`lib/data/menu.dart`, `lib/screens/home_screen.dart` and
`lib/screens/product_screen.dart`.
