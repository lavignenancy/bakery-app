import 'package:flutter/foundation.dart';

@immutable
class AppUser {
  const AppUser({
    required this.fullName,
    required this.email,
    this.address = 'Regent Street, 16',
    this.membership = 'Premium member',
  });

  final String fullName;
  final String email;
  final String address;
  final String membership;

  static AppUser guest() => const AppUser(
        fullName: 'Guest User',
        email: 'guest@example.com',
        address: 'Regent Street, 16',
        membership: 'Guest',
      );
}

class UserSession extends ChangeNotifier {
  AppUser? _user;

  AppUser? get user => _user;

  void signIn({required String email, String? fullName}) {
    final trimmedEmail = email.trim();
    final safeEmail = trimmedEmail.isNotEmpty ? trimmedEmail : 'guest@example.com';
    final trimmedName = fullName?.trim();
    final safeName = trimmedName != null && trimmedName.isNotEmpty
        ? trimmedName
        : safeEmail.split('@').first.replaceAll('.', ' ').trim();

    _user = AppUser(
      fullName: safeName,
      email: safeEmail,
      address: 'Regent Street, 16',
      membership: 'Premium member',
    );

    notifyListeners();
  }

  void signOut() {
    _user = null;
    notifyListeners();
  }
}
