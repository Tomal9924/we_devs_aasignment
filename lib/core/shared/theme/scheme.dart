import '../shared.dart';

class ThemeScheme {
  final Color backgroundColor;
  final Color backgroundSecondary;
  final Color shimmerColor;
  final Color buttonColor;
  final Color errorColor;
  final Color textPrimary;
  final Color textSecondary;
  final Color iconColor;
  final Color white;
  final Color blue;
  final Color successColor;

  ThemeScheme({
    required this.backgroundColor,
    required this.backgroundSecondary,
    required this.textPrimary,
    required this.shimmerColor,
    required this.errorColor,
    required this.buttonColor,
    required this.blue,
    required this.textSecondary,
    required this.white,
    required this.successColor,
    required this.iconColor,
  });

  factory ThemeScheme.find({
    required ThemeType type,
  }) {
    final theme = ThemeScheme(
      backgroundColor: const Color(0xFFF8F8F8),
      backgroundSecondary: const Color.fromARGB(57, 223, 236, 215),
      textPrimary: Colors.black,
      shimmerColor: const Color(0xFFCCD0D3),
      errorColor: const Color.fromARGB(255, 255, 40, 40),
      buttonColor: const Color(0xFFF75F55),
      blue: const Color(0xFF2893E3),
      textSecondary: const Color(0xFFA4A9AF),
      white: const Color(0xFFFFFFFF),
      iconColor: const Color(0xFF899AA2),
      successColor: Colors.green,
    );

    return theme;
  }
}
