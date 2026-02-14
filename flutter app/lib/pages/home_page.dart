// Packages
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Services
import 'package:intellispend/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthService().signOut();
              if (!context.mounted) return;
              Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
            },
            icon: Icon(HugeIconsStroke.logout01),
          ),
        ],
      ),
    );
  }
}
