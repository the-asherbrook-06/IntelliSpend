// Packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:flutter/material.dart';

// Services
import 'package:intellispend/services/auth_service.dart';

// Assets
import 'package:intellispend/services/quotes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = AuthService().getCurrentUser();

  final _balance = 0;
  final _budget = 0;
  final _income = 0;
  final _expenses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, ${user!.displayName}",
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              Quotes().getRandomQuote(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.all(8),
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(user!.photoURL ?? ""),
            ),
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  height: 160,
                  width: (MediaQuery.of(context).size.width - 24) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Balance",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onTertiary,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          CircleAvatar(
                            child: Icon(
                              HugeIconsStroke.wallet01,
                              color: Theme.of(context).colorScheme.onTertiary,
                              size: 20,
                            ),
                            backgroundColor: Theme.of(context).colorScheme.tertiaryFixed,
                            radius: 20,
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "\$ $_balance",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 160,
                  width: (MediaQuery.of(context).size.width - 24) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Theme.of(context).colorScheme.surfaceContainer,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Monthly",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              Text(
                                "Budget",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          CircleAvatar(
                            child: Icon(
                              HugeIconsStroke.savings,
                              color: Theme.of(context).colorScheme.onSurface,
                              size: 20,
                            ),
                            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
                            radius: 20,
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "\$ $_budget",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 160,
                  width: (MediaQuery.of(context).size.width - 24) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Income",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          CircleAvatar(
                            child: Icon(
                              HugeIconsStroke.moneyReceiveCircle,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 20,
                            ),
                            backgroundColor: Theme.of(context).colorScheme.primaryFixed,
                            radius: 20,
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "\$ $_income",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 160,
                  width: (MediaQuery.of(context).size.width - 24) / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expenses",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Theme.of(context).colorScheme.onSecondary,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          CircleAvatar(
                            child: Icon(
                              HugeIconsStroke.moneySendCircle,
                              color: Theme.of(context).colorScheme.onSecondary,
                              size: 20,
                            ),
                            backgroundColor: Theme.of(context).colorScheme.secondaryFixed,
                            radius: 20,
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "\$ $_expenses",
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        child: Icon(
          HugeIconsStroke.moneyAdd01,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}
