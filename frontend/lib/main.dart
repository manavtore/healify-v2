import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/data_layer/data/constants/env.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/presentation_layer/ui/utils/theme/themeColor.dart';
import 'package:frontend/routes/route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


bool isSigned = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(url: env.API_URL, anonKey: env.ANON_KEY);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Name',
      theme: ThemeData(
        primaryColor: ThemeColor.primary,
        scaffoldBackgroundColor: ThemeColor.background,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: ThemeColor.text),
          bodyMedium: TextStyle(fontSize: 14, color: ThemeColor.text),
          titleLarge: TextStyle(
              fontSize: 20,
              color: ThemeColor.primary,
              fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: ThemeColor.background,
            backgroundColor: ThemeColor.primary,
            minimumSize: const Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColor.primary,
          foregroundColor: ThemeColor.background,
          elevation: 0,
        ),
      ),
      initialRoute: isSigned ? '/home' : '/login',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
