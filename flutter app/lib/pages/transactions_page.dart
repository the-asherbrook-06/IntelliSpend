// Packages
import 'package:flutter/material.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:svg_flutter/svg.dart';

// Services
import 'package:intellispend/services/firestore_service.dart';
import 'package:intellispend/services/auth_service.dart';

// Pages
import 'add_transaction.dart';

// Widgets
import 'package:intellispend/widgets/transaction_item.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthService().getCurrentUser();
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
              Expanded(
                child: StreamBuilder(
                  stream: FirestoreService().getTransactions(user!.uid),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 40),
                          SvgPicture.asset("assets/$brightness/online_payments.svg", height: 200),
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
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => AddTransaction(),
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
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final doc = snapshot.data!.docs[index];
                        return TransactionItem(transaction: doc.data() as Map<String, dynamic>);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
