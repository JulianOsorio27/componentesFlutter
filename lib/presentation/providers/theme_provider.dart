import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Valor bool
final isDarkModeProvider = StateProvider((ref) => false);

// Para seleccionar un color a la app creamos un listado de colores inmutable
// El colorList esta en el Theme general de app
final colorListProvider = Provider((ref) => colorList);

// Valor int
final selectedColorProvider = StateProvider((ref) => 0);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controler o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme();
  ThemeNotifier()
      : super(
            AppTheme()); // Cremaos la primer instancia del apptheme con sus valores por defecto

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith( selectedColor: colorIndex );
  }
}
