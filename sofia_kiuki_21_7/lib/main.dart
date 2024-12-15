import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sofia_kiuki_21_7/tabs_screen.dart';
import 'package:google_fonts/google_fonts.dart';  // Import the Google Fonts package

void main() {
   runApp(const ProviderScope(child: MyApp())); // MyApp can be const
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Department & Student App',
      theme: ThemeData.dark().copyWith(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.dark().textTheme,
  ).copyWith(
    bodyLarge: const TextStyle(
      fontSize: 14, 
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: const TextStyle(
      fontSize: 12, 
      fontWeight: FontWeight.normal,
    ),
    headlineLarge: const TextStyle(
      fontSize: 20, 
      fontWeight: FontWeight.bold,
      color: Colors.lightBlueAccent,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.lightBlue,
  ).copyWith(
    secondary: const Color.fromARGB(255, 156, 230, 236),
  ),
),


      home: const TabsScreen(),  // If TabsScreen doesn't depend on runtime values, mark it as const
    );
  }
}
