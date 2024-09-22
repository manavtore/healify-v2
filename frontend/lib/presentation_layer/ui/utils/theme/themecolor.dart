import 'dart:ui';

import 'dart:ui';

class ThemeColor {
  static const Color primary = Color(0xFF4CAF50);
  static const Color primaryLight = Color(0xFF81C784);
  static const Color primaryDark = Color(0xFF388E3C);

  static const Color secondary = Color(0xFFFF9800);
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFF57C00);

  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color backgroundDark = Color(0xFFE0E0E0);

  static const Color text = Color(0xFF333333);
  static const Color textLight = Color(0xFF757575);
  static const Color textDark = Color(0xFF212121);

  static const Color accent = Color(0xFF2196F3);
  static const Color accentLight = Color(0xFF64B5F6);
  static const Color accentDark = Color(0xFF1976D2);

  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF1976D2);

  static const Color transparent = Color(0x00000000);
  static const Color semiTransparent = Color(0x80000000);

  static const List<Color> primaryGradient = [primary, primaryLight];
  static const List<Color> secondaryGradient = [secondary, secondaryLight];
}
