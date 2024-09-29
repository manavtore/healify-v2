import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healify/data/constants/env.dart';
import 'package:healify/domain_layer/providers/authProvider.dart';
import 'package:healify/domain_layer/routes/route.dart';
import 'package:healify/firebase_options.dart';
import 'package:healify/presentation/ui/utils/theme/themecolor.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginNotifier()),
      ],
      child: Consumer<LoginNotifier>(
        builder: (context, loginNotifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'healify',
            theme: ThemeData(
              fontFamily: 'Body',
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
                  padding: const EdgeInsets.all(16),
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
              iconTheme: const IconThemeData(
                color: ThemeColor.secondaryLight,
              ),
              iconButtonTheme: IconButtonThemeData(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
                  iconSize: WidgetStateProperty.all(24),
                ),
              ),
            ),
            initialRoute:
                loginNotifier.currentUser != null ? '/home' : '/login',
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}