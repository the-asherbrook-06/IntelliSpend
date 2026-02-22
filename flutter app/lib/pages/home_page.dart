// Packages
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter/material.dart';

// Services
import 'package:intellispend/services/firestore_service.dart';
import 'package:intellispend/services/auth_service.dart';

// Assets
import 'package:intellispend/services/quotes.dart';

// Pages
import 'package:intellispend/pages/add_transaction.dart';

// Widgets
import 'package:intellispend/widgets/status_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List payments = [];
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = AuthService().getCurrentUser();
    if (user != null) {
      final data = await FirestoreService().getUserData(user.uid);
      setState(() {
        userData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService().getCurrentUser();
    final brightness = View.of(context).platformDispatcher.platformBrightness == Brightness.light
        ? 'light'
        : 'dark';

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
              child: Image.network(
                user!.photoURL ??
                    "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png",
              ),
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                StatusCard(
                  label: ["Balance"],
                  icon: HugeIconsStroke.wallet01,
                  currency: Icons.currency_rupee_rounded,
                  amount: userData?['balance'] ?? 0,
                  colorScheme: "quaternary",
                ),
                SizedBox(width: 8),
                StatusCard(
                  label: ["Monthly", "Budget"],
                  icon: HugeIconsStroke.savings,
                  currency: Icons.currency_rupee_rounded,
                  amount: userData?['budget'] ?? 0,
                  colorScheme: "tertiary",
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                StatusCard(
                  label: ["Income"],
                  icon: HugeIconsStroke.moneyReceiveSquare,
                  currency: Icons.currency_rupee_rounded,
                  amount: 1000,
                  colorScheme: "secondary",
                ),
                SizedBox(width: 8),
                StatusCard(
                  label: ["Expenses"],
                  icon: HugeIconsStroke.moneySendSquare,
                  currency: Icons.currency_rupee_rounded,
                  amount: 1000,
                  colorScheme: "primary",
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Recent Transactions",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/transactions');
                        },
                        icon: Icon(HugeIconsStroke.arrowRight01),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  (payments.isEmpty)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 40),
                            SvgPicture.asset(
                              "assets/$brightness/online_payments.svg",
                              height: 200,
                            ),
                            SizedBox(height: 60),
                            Text("No Transactions", style: Theme.of(context).textTheme.titleLarge),
                            Text(
                              "You haven't made any Transactions yet. Add a transaction to get started",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(height: 12),
                            ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  // showDragHandle: true,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return AddTransaction();
                                  },
                                );
                              },
                              child: Text(
                                "Add Transaction",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primaryContainer,
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                          ],
                        )
                      :
                        // TODO: Work in progress
                        Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 2,
        onPressed: () {
          showModalBottomSheet(
            // showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddTransaction();
            },
          );
        },
        child: Icon(
          HugeIconsStroke.moneyAdd01,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
