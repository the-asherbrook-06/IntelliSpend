// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness == Brightness.light
        ? 'light'
        : 'dark';
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            SvgPicture.asset('assets/$brightness/personal_finance.svg', height: 300),
            SizedBox(height: 20),
            Text("IntelliSpend", style: Theme.of(context).textTheme.displaySmall),
            Text("Track smarter. Spend better.", style: Theme.of(context).textTheme.bodyLarge),
            Expanded(child: SizedBox()),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: kToolbarHeight * 1.9,
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}
