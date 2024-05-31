import '../shared.dart';

class ThemeScheme {
  final Color backgroundColor;
  final Color backgroundSecondary;
  final Color shimmerColor;
  final Color buttonColor;
  final Color errorColor;
  final Color textPrimary;

  ThemeScheme({
    required this.backgroundColor,
    required this.backgroundSecondary,
    required this.textPrimary,
    required this.shimmerColor,
    required this.errorColor,
    required this.buttonColor,
  });

  factory ThemeScheme.find({
    required ThemeType type,
  }) {
    final theme = ThemeScheme(
      backgroundColor: const Color(0xFFF8F8F8),
      backgroundSecondary: const Color(0xFF15212D),
      textPrimary: const Color(0xFFCCD0D3),
      shimmerColor: const Color(0xFFCCD0D3),
      errorColor: const Color.fromARGB(255, 255, 40, 40),
      buttonColor: const Color(0xFFF75F55),
    );

    return theme;
  }
}
