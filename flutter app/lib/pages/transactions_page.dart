// Packages
import 'package:flutter/material.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg.dart';

// Pages
import 'add_expense.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List payments = [];

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness == Brightness.light
        ? 'light'
        : 'dark';

    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Transactions", style: Theme.of(context).textTheme.headlineMedium),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(HugeIconsStroke.arrowLeft01),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              (payments.isEmpty)
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        SvgPicture.asset("assets/${brightness}/online_payments.svg", height: 200),
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
      ),
    );
  }
}
