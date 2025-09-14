import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/resonant_melody.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resonant Melody',
      theme: _buildNierLightTheme(),
      darkTheme: _buildNierDarkTheme(),
      themeMode: ThemeMode.system,
      home: FutureBuilder<bool>(
        future: _isFirstRun(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.data == true) {
            return const OnboardingScreen();
          } else {
            return const MyHomePage(title: 'Resonant Melody');
          }
        }
      )
    );
  }

  Future<bool> _isFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // bool isFirstRun = prefs.getBool('first_run') ?? true;
    bool isFirstRun = true;
    
    if (isFirstRun) {
      await prefs.setBool('first_run', false);
    }
    
    return isFirstRun;
  }

  ThemeData _buildNierLightTheme() {
    const Color primaryBeige = Color(0xFFF5F1E8);
    const Color darkBeige = Color(0xFFE8E0D6);
    const Color charcoalGray = Color(0xFF2D2D2D);
    const Color softGray = Color(0xFF6B6B6B);
    const Color accentGold = Color(0xFFD4AF37);
    const Color backgroundGray = Color(0xFFF8F6F3);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      colorScheme: const ColorScheme.light(
        primary: charcoalGray,
        secondary: accentGold,
        surface: primaryBeige,
        background: backgroundGray,
        onPrimary: primaryBeige,
        onSecondary: charcoalGray,
        onSurface: charcoalGray,
        onBackground: charcoalGray,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBeige,
        foregroundColor: charcoalGray,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: charcoalGray,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.2,
        ),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: charcoalGray,
          fontSize: 32,
          fontWeight: FontWeight.w100,
          letterSpacing: 1.5,
        ),
        displayMedium: TextStyle(
          color: charcoalGray,
          fontSize: 24,
          fontWeight: FontWeight.w200,
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(
          color: charcoalGray,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: softGray,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.25,
        ),
      ),

      cardTheme: const CardThemeData(
        color: primaryBeige,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        margin: EdgeInsets.all(8),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: charcoalGray,
          foregroundColor: primaryBeige,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 1.0,
          ),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentGold,
        foregroundColor: charcoalGray,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: darkBeige,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: softGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: accentGold, width: 2),
        ),
      ),

      iconTheme: const IconThemeData(
        color: charcoalGray,
        size: 24,
      ),

      dividerTheme: const DividerThemeData(
        color: softGray,
        thickness: 1,
        space: 20,
      ),
    );
  }

  ThemeData _buildNierDarkTheme() {
    const Color darkBackground = Color(0xFF1A1A1A);
    const Color darkSurface = Color(0xFF2D2D2D);
    const Color lightBeige = Color(0xFFF5F1E8);
    const Color mutedBeige = Color(0xFFE8E0D6);
    const Color accentGold = Color(0xFFD4AF37);
    const Color softGray = Color(0xFF9E9E9E);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      
      colorScheme: const ColorScheme.dark(
        primary: lightBeige,
        secondary: accentGold,
        surface: darkSurface,
        background: darkBackground,
        onPrimary: darkBackground,
        onSecondary: darkBackground,
        onSurface: lightBeige,
        onBackground: lightBeige,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: lightBeige,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: lightBeige,
          fontSize: 20,
          fontWeight: FontWeight.w300,
          letterSpacing: 1.2,
        ),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: lightBeige,
          fontSize: 32,
          fontWeight: FontWeight.w100,
          letterSpacing: 1.5,
        ),
        displayMedium: TextStyle(
          color: lightBeige,
          fontSize: 24,
          fontWeight: FontWeight.w200,
          letterSpacing: 1.2,
        ),
        bodyLarge: TextStyle(
          color: lightBeige,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: softGray,
          fontSize: 14,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.25,
        ),
      ),

      cardTheme: const CardThemeData(
        color: darkSurface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        margin: EdgeInsets.all(8),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightBeige,
          foregroundColor: darkBackground,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w300,
            letterSpacing: 1.0,
          ),
        ),
      ),

      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accentGold,
        foregroundColor: darkBackground,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: softGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: accentGold, width: 2),
        ),
      ),

      iconTheme: const IconThemeData(
        color: lightBeige,
        size: 24,
      ),

      dividerTheme: const DividerThemeData(
        color: softGray,
        thickness: 1,
        space: 20,
      ),
    );
  }
}