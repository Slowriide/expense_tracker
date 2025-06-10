import 'package:control_gastos/domain/entities/expense.dart';
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
        category: 'General',
        isIncome: false,
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
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa un título';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Monto'),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveExpense,
              child: const Text('Guardar Gasto'),
            ),
          ],
        ),
      ),
    );
  }
}
