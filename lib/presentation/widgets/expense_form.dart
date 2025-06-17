import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/presentation.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseForm extends ConsumerStatefulWidget {
  const ExpenseForm({super.key});

  @override
  ExpenseFormState createState() => ExpenseFormState();
}

class ExpenseFormState extends ConsumerState<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool _isIncome = false;
  ExpenseCategory _selectedCategory = ExpenseCategory.other;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _saveExpense() async {
    if (_formKey.currentState!.validate()) {
      final newExpense = Expense(
        title: _titleController.text,
        amount: double.tryParse(_amountController.text) ?? 0.0,
        date: DateTime.now(),
        category: _selectedCategory,
        isIncome: _isIncome,
      );

      await ref
          .read(expenseListNotifierProvider.notifier)
          .addExpense(newExpense);

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextFormField(
              controller: _titleController,
              labelText: 'Título',
              hint: 'Dinner',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un título';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screen.width * 0.55,
                  child: MyTextFormField(
                    controller: _amountController,
                    labelText: 'Amount',
                    hint: '50',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un monto';
                      }
                      final amount = double.tryParse(value);
                      if (amount == null || amount <= 0) {
                        return 'Por favor ingresa un monto válido';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  width: screen.width * 0.3,
                  height: 55,
                  child: TypeTyleDropdown(
                    isIncome: _isIncome,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _isIncome = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CategoryTileDropdown(
              selectedCategory: _selectedCategory,
              onChanged: (newCategory) {
                setState(() {
                  _selectedCategory = newCategory;
                });
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveExpense,
                child: Text('Guardar Gasto', style: textStyle.bodySmall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
