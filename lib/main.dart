import 'package:ecommerace_app/Pages/BagPage.dart';
import 'package:ecommerace_app/Pages/CategoryPage.dart';
import 'package:ecommerace_app/Pages/HelpPage.dart';
import 'package:ecommerace_app/Pages/Profile/ProfilePage.dart';
import 'package:ecommerace_app/Pages/home_page.dart';
import 'package:ecommerace_app/Pages/Setting/settings_page.dart';
import 'package:ecommerace_app/Pages/wishlist_page.dart';
import 'package:ecommerace_app/Theme/dark_mode.dart';
import 'package:ecommerace_app/Theme/light_mode.dart';
import 'package:ecommerace_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeSwitch(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      home: const SplashScreen(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/ProfilePage': (context) => ProfilePage(),
        '/UserPage': (context) => const CategoryPage(),
        '/BagPage': (context) => const BagPage(),
        '/WishListPage': (context) => const WishlistPage(),
        '/HelpPage': (context) => const HelpPage(),
        '/SettingsPage': (context) => const SettingsPage(),
      },
      builder: (context, child) {
        return Consumer<ThemeSwitch>(
          builder: (context, themeSwitch, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-Commerce',
              home: const SplashScreen(),
              theme: lightMode,
              darkTheme: darkMode,
              themeMode:
                  themeSwitch.isDarkMode ? ThemeMode.dark : ThemeMode.light,
              routes: {
                '/homepage': (context) => const HomePage(),
                '/ProfilePage': (context) => ProfilePage(),
                '/UserPage': (context) => const CategoryPage(),
                '/BagPage': (context) => const BagPage(),
                '/WishListPage': (context) => const WishlistPage(),
                '/HelpPage': (context) => const HelpPage(),
                '/SettingsPage': (context) => const SettingsPage(),
              },
            );
          },
        );
      },
    );
  }
}

class ThemeSwitch with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool isOn) {
    _isDarkMode = isOn;
    notifyListeners();
  }
}
