// packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_flutter/svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.primary,
        systemNavigationBarDividerColor: Theme.of(context).colorScheme.outline,
      ),
    );

    final brightness = View.of(context).platformDispatcher.platformBrightness == Brightness.light
        ? 'light'
        : 'dark';

    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: SizedBox()),
            SvgPicture.asset('assets/$brightness/personal_finance.svg', height: 300),
            SizedBox(height: 20),
            Text("IntelliSpend", style: Theme.of(context).textTheme.displaySmall),
            Text("Track smarter. Spend better.", style: Theme.of(context).textTheme.bodyLarge),
            Expanded(child: SizedBox()),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 60,
              height: kToolbarHeight * 0.9,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Signup"),
              ),
            ),
            SizedBox(height: 8, width: MediaQuery.sizeOf(context).width),
            SizedBox(
              width: MediaQuery.sizeOf(context).width - 60,
              height: kToolbarHeight * 0.9,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
