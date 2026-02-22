// Packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hugeicons_pro/hugeicons.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';

// Services
import 'package:intellispend/services/firestore_service.dart';
import 'package:intellispend/services/auth_service.dart';

class AddTransaction extends StatefulWidget {
  final Map<String, dynamic>? transaction;
  final String? transactionId;

  const AddTransaction({super.key, this.transaction, this.transactionId});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _transactionType = 'expense';
  DateTime _selectedDate = DateTime.now();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      _amountController.text = widget.transaction!['amount'].toString();
      _descriptionController.text = widget.transaction!['description'];
      _transactionType = widget.transaction!['type'];
      _selectedDate = (widget.transaction!['date'] as Timestamp).toDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(HugeIconsStroke.cancel01),
                ),
              ],
            ),
            Text(
              widget.transaction == null ? "Add New Transaction" : "Edit Transaction",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              "Enter the details of your transaction below to keep track of it",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Enter Amount"),
                prefixIcon: Icon(Icons.currency_rupee_rounded),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Amount is required";
                }
                if (double.tryParse(value) == null) {
                  return "Enter a valid amount";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                label: Text("Enter Description"),
                prefixIcon: Icon(HugeIconsStroke.note),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Description is required";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                label: Text("Select Date"),
                prefixIcon: Icon(HugeIconsStroke.calendar02),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
              controller: TextEditingController(
                text:
                    "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} ${_selectedDate.hour}:${_selectedDate.minute.toString().padLeft(2, '0')}",
              ),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(_selectedDate),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      _selectedDate = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                }
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<String>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: 'income',
                    label: Text('Income'),
                    icon: Icon(HugeIconsStroke.moneyReceiveCircle),
                  ),
                  ButtonSegment(
                    value: 'expense',
                    label: Text('Expense'),
                    icon: Icon(HugeIconsStroke.moneySendCircle),
                  ),
                ],
                selected: {_transactionType},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _transactionType = newSelection.first;
                  });
                },
              ),
            ),
            Expanded(child: SizedBox()),
            Align(
              alignment: AlignmentGeometry.center,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 60,
                height: kToolbarHeight,
                child: _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primaryContainer,
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                        icon: Icon(
                          widget.transaction == null ? HugeIconsStroke.add01 : HugeIconsStroke.checkmarkCircle02,
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        label: Text(
                          widget.transaction == null ? "Add Transaction" : "Update Transaction",
                          style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;

                          setState(() {
                            _isLoading = true;
                          });

                          try {
                            final user = AuthService().getCurrentUser();

                            String category;
                            if (widget.transaction != null && _descriptionController.text.trim() == widget.transaction!['description']) {
                              category = widget.transaction!['category'];
                            } else {
                              final response = await http.post(
                                Uri.parse('https://intellispend-6o7c.onrender.com/predict'),
                                headers: {'Content-Type': 'application/json'},
                                body: jsonEncode({'text': _descriptionController.text.trim()}),
                              );

                              final prediction = jsonDecode(response.body);
                              log(prediction.toString());
                              category = prediction['category'];
                              double confidence = prediction['confidence'];

                              if (confidence < 0.5) {
                                final probabilities = prediction['all_probabilities'] as Map<String, dynamic>;
                                final sortedCategories = probabilities.entries.toList()
                                  ..sort((a, b) => b.value.compareTo(a.value));
                                final top4 = sortedCategories.map((e) => e.key).toList();

                                final selectedCategory = await showDialog<String>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Confirm Category'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: top4.map((cat) => ListTile(
                                        title: Text(cat),
                                        onTap: () => Navigator.pop(context, cat),
                                      )).toList(),
                                    ),
                                  ),
                                );

                                if (selectedCategory == null) {
                                  setState(() { _isLoading = false; });
                                  return;
                                }
                                category = selectedCategory;
                                
                                await http.post(
                                  Uri.parse('https://intellispend-6o7c.onrender.com/suggest'),
                                  headers: {'Content-Type': 'application/json'},
                                  body: jsonEncode({
                                    'text': _descriptionController.text.trim(),
                                    'suggested_category': selectedCategory,
                                  }),
                                );
                              }
                            }

                            final data = {
                              'amount': double.parse(_amountController.text.trim()),
                              'description': _descriptionController.text.trim(),
                              'date': _selectedDate,
                              'type': _transactionType,
                              'category': category,
                            };

                            if (widget.transaction == null) {
                              await FirestoreService().addTransaction(user!.uid, data);
                            } else {
                              await FirestoreService().updateTransaction(user!.uid, widget.transactionId!, data);
                            }

                            if (!mounted) return;
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(widget.transaction == null ? "Transaction added successfully" : "Transaction updated successfully")),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text("Error adding transaction")));
                          } finally {
                            if (mounted) {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                      ),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
