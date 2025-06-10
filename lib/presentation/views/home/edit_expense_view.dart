import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/presentation.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditExpenseView extends ConsumerStatefulWidget {
  final Expense expense;

  const EditExpenseView({super.key, required this.expense});

  @override
  EditExpenseViewState createState() => EditExpenseViewState();
}

class EditExpenseViewState extends ConsumerState<EditExpenseView> {
  bool _isIncome = false;

  /// FocusNodes to manage focus state for the text fields
  /// This allows us to change the label color dynamically based on focus.
  late FocusNode _amountFocusNode;
  late FocusNode _titleFocusNode;
  DateTime? _selectedDate;
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 1. Initialize the FocusNodes
    // 2. Add listeners to the FocusNodes to update the state when focus changes
    _amountFocusNode = FocusNode()..addListener(_onFocusChange);
    _titleFocusNode = FocusNode()..addListener(_onFocusChange);
    _titleController.text = widget.expense.title;
    _amountController.text = widget.expense.amount.toStringAsFixed(2);
  }

  @override
  void dispose() {
    _amountFocusNode.removeListener(_onFocusChange);
    _titleFocusNode.removeListener(_onFocusChange);
    _amountFocusNode.dispose();
    _titleFocusNode.dispose();
    super.dispose();
  }

  /// Callback to update the state when focus changes
  void _onFocusChange() => setState(() {});

  void _saveExpense() {
    if (_amountController.text.isEmpty || _titleController.text.isEmpty) {
      return;
    }

    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      return;
    }

    final expense = Expense(
      id: widget.expense.id,
      title: _titleController.text,
      amount: amount,
      isIncome: _isIncome,
      category: widget.expense.category,
      date: _selectedDate ?? DateTime.now(),
    );

    ref.read(expenseListNotifierProvider.notifier).updateExpense(expense);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Expense', style: textStyle.bodyLarge),
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildAmountAndTypeFields(context),
                  SizedBox(height: 20),
                  _buildDatepicker(),
                  SizedBox(height: 20),
                  _buildTitle(),
                  Spacer(),
                ],
              ),
            ),
          ),
          _buildSabeAndCancelButtons(),
        ],
      ),
    );
  }

  Row _buildAmountAndTypeFields(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final Color amountLabelColor =
        _amountFocusNode.hasFocus ? colorScheme.secondary : Colors.black;

    return Row(
      children: [
        _buildAmountField(screen, textStyle, amountLabelColor),
        SizedBox(width: 10),
        _buildTypeDropdown(screen, textStyle),
      ],
    );
  }

  Widget _buildAmountField(
    Size screen,
    TextTheme textStyle,
    Color amountLabelColor,
  ) {
    return SizedBox(
      width: screen.width * 0.6,
      height: 55,
      child: TextFormField(
        controller: _amountController,
        focusNode: _amountFocusNode,

        style: textStyle.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Amonut',
          floatingLabelStyle: textStyle.bodyLarge?.copyWith(
            color: amountLabelColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
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
    );
  }

  Widget _buildTypeDropdown(Size screen, TextTheme textStyle) {
    return SizedBox(
      width: screen.width * 0.3,
      height: 55,
      child: DropdownButtonFormField(
        value: _isIncome,
        decoration: InputDecoration(
          labelText: 'Type',
          floatingLabelStyle: textStyle.bodyLarge,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        items: [
          DropdownMenuItem(
            value: false,
            child: Text(
              'Expense',
              style: textStyle.bodyLarge?.copyWith(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          DropdownMenuItem(
            value: true,
            child: Text(
              'Income',
              style: textStyle.bodyLarge?.copyWith(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _isIncome = value;
            });
          }
        },
      ),
    );
  }

  Widget _buildDatepicker() {
    final textStyle = Theme.of(context).textTheme;
    return TextFormField(
      readOnly: true,
      style: textStyle.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      controller: TextEditingController(
        text:
            _selectedDate != null
                ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                : 'Select Date',
      ),
      decoration: InputDecoration(
        labelText: 'Date',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null && pickedDate != _selectedDate) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
      validator: (value) {
        if (_selectedDate == null) {
          return 'Please select a date';
        }
        return null;
      },
    );
  }

  Widget _buildTitle() {
    final textStyle = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final Color titleLabelColor =
        _titleFocusNode.hasFocus ? colorScheme.secondary : Colors.black;
    return TextFormField(
      controller: _titleController,
      focusNode: _titleFocusNode,
      style: textStyle.bodyLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: 'Title',
        floatingLabelStyle: textStyle.bodyLarge?.copyWith(
          color: titleLabelColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa un título';
        }
        return null;
      },
    );
  }

  Widget _buildSabeAndCancelButtons() {
    final theme = Theme.of(context).colorScheme;
    ref.watch(expenseListNotifierProvider);
    return Column(
      children: [
        Divider(color: Colors.grey.shade300, thickness: 1, height: 1),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyButton(
                text: 'Save',
                onPressed: () {
                  _saveExpense();
                },
                color: theme.secondary,
              ),
              SizedBox(height: 10),
              MyButton(
                text: 'Cancel',
                onPressed: () => context.pop(),
                color: theme.surface,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
