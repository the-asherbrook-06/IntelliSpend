// Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Setup
import 'firebase_options.dart';

// Pages
import 'package:intellispend/pages/welcome_page.dart';
import 'package:intellispend/pages/signup_page.dart';
import 'package:intellispend/pages/login_page.dart';
import 'package:intellispend/pages/home_page.dart';

// Theme
import 'package:intellispend/themes/theme.dart';
import 'package:intellispend/themes/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      darkTheme: theme.dark(),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => const SignupPage(),
        '/home': (_) => const HomePage()
      },
    );
  }
}
