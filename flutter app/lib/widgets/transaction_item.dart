import 'package:flutter/material.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intellispend/services/firestore_service.dart';
import 'package:intellispend/services/auth_service.dart';
import 'package:intellispend/pages/add_transaction.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TransactionItem extends StatelessWidget {
  final Map<String, dynamic> transaction;
  final String transactionId;

  const TransactionItem({super.key, required this.transaction, required this.transactionId});

  void _showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(HugeIconsStroke.edit02),
              title: Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) =>
                      AddTransaction(transaction: transaction, transactionId: transactionId),
                );
              },
            ),
            ListTile(
              leading: Icon(HugeIconsStroke.aiLearning),
              title: Text('Suggest Category'),
              onTap: () async {
                Navigator.pop(context);
                final categories = [
                  'Food & Dining',
                  'Transportation',
                  'Shopping & Retail',
                  'Entertainment & Recreation',
                  'Financial Services',
                  'Healthcare & Medical',
                  'Charity & Donations',
                  'Government & Legal',
                  'Utilities & Services',
                  'Education',
                  'Income',
                  'Other'
                ];
                final selected = await showDialog<String>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Suggest Category'),
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ListView(
                        children: categories
                            .map(
                              (cat) => ListTile(
                                title: Text(cat),
                                onTap: () => Navigator.pop(context, cat),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                );
                if (selected != null) {
                  try {
                    await http.post(
                      Uri.parse('https://intellispend-6o7c.onrender.com/suggest'),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode({
                        'text': transaction['description'],
                        'suggested_category': selected,
                      }),
                    );
                    final user = AuthService().getCurrentUser();
                    await FirestoreService().updateTransaction(user!.uid, transactionId, {
                      'category': selected,
                    });
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Category updated')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Error updating category')));
                    }
                  }
                }
              },
            ),
            ListTile(
              leading: Icon(HugeIconsStroke.delete02, color: Colors.red.shade200),
              title: Text('Delete', style: TextStyle(color: Colors.red.shade200)),
              onTap: () async {
                Navigator.pop(context);
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Delete Transaction'),
                    content: Text('Are you sure you want to delete this transaction?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text('Delete', style: TextStyle(color: Colors.red.shade200)),
                      ),
                    ],
                  ),
                );
                if (confirm == true) {
                  try {
                    final user = AuthService().getCurrentUser();
                    await FirestoreService().deleteTransaction(user!.uid, transactionId);
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Transaction deleted')));
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Error deleting transaction')));
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction['type'] == 'income';
    final date = (transaction['date'] as Timestamp).toDate();

    return GestureDetector(
      onLongPress: () => _showActionSheet(context),
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isIncome
                    ? Theme.of(context).colorScheme.secondaryContainer
                    : Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isIncome ? HugeIconsStroke.moneyReceiveCircle : HugeIconsStroke.moneySendCircle,
                color: isIncome
                    ? Theme.of(context).colorScheme.onSecondaryContainer
                    : Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction['description'],
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    transaction['category'],
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${date.day}/${date.month}/${date.year}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "₹ ${transaction['amount']}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isIncome ? Colors.green.shade200 : Colors.red.shade200,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
