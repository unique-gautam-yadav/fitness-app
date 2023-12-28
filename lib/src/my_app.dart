import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          background: Colors.black,
          surface: Colors.black,
        ),
        fontFamily: GoogleFonts.quicksand().fontFamily,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
