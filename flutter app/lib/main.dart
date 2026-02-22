// Packages
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Setup
import 'firebase_options.dart';

// Pages
import 'package:intellispend/pages/transactions_page.dart';
import 'package:intellispend/pages/welcome_page.dart';
import 'package:intellispend/pages/signup_page.dart';
import 'package:intellispend/pages/splash_page.dart';
import 'package:intellispend/pages/login_page.dart';
import 'package:intellispend/pages/home_page.dart';

// Theme
import 'package:intellispend/themes/theme.dart';
import 'package:intellispend/themes/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  log(Firebase.apps.toString());
  runApp(const IntelliSpend());
}

class IntelliSpend extends StatelessWidget {
  const IntelliSpend({super.key});

  @override
  Widget build(BuildContext context) {
    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Nunito");
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: "IntelliSpend",
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      darkTheme: theme.darkHighContrast(),
      initialRoute: '/',
      routes: {
        '/': (_) => const SplashPage(),
        '/welcome': (_) => const WelcomePage(),
        '/signup': (_) => const SignupPage(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
        '/transactions': (_) => const TransactionsPage()
      },
    );
  }
}
