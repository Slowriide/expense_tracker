import 'package:control_gastos/common/utils/get_month_by_number.dart';
import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/providers/expense_repository_provider.dart';
import 'package:control_gastos/presentation/views/calendar/providers/selected_day_provider.dart';
import 'package:control_gastos/presentation/widgets/expense_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    final selectedDay = ref.watch(selectedDayProvider);
    final expensesAsync = ref.watch(expenseListNotifierProvider);

    final month = getMonthByNumber(selectedDay.month);
    final day = selectedDay.day;

    final List<Expense> eventOfDay = expensesAsync.when(
      data:
          (expenses) =>
              expenses.where((e) {
                return e.date.year == selectedDay.year &&
                    e.date.month == selectedDay.month &&
                    e.date.day == selectedDay.day;
              }).toList(),
      loading: () => [],
      error: (_, __) => [],
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Calendar', style: textStyle.titleMedium),
              SizedBox(height: 10),
              Text('Expenses by date', style: textStyle.bodyMedium),
              SizedBox(height: 10),
              //Calendar
              Container(
                decoration: BoxDecoration(
                  color: theme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TableCalendar(
                  focusedDay: selectedDay,
                  firstDay: DateTime(2010),
                  lastDay: DateTime(2150),
                  selectedDayPredicate: (day) => isSameDay(day, selectedDay),
                  onDaySelected: (day, focusedDay) {
                    ref.read(selectedDayProvider.notifier).setSelectedDate(day);
                  },
                  calendarStyle: CalendarStyle(
                    markerDecoration: BoxDecoration(
                      color: theme.secondary,
                      shape: BoxShape.circle,
                    ),
                    markersMaxCount: 3,
                  ),
                  headerStyle: HeaderStyle(formatButtonVisible: false),

                  //? Usar?
                  // onHeaderTapped: (focusedDay) async {
                  //   final picked = await showDatePicker(
                  //     context: context,
                  //     initialDate: focusedDay,
                  //     firstDate: DateTime(2020),
                  //     lastDate: DateTime(2030),
                  //     helpText: 'Selecciona una fecha',
                  //   );
                  //   if (picked != null) {
                  //     ref
                  //         .read(selectedDayProvider.notifier)
                  //         .setSelectedDate(picked);
                  //   }
                  // },
                  eventLoader: (day) {
                    return expensesAsync.when(
                      data:
                          (expenses) =>
                              expenses.where((expense) {
                                return expense.date.year == day.year &&
                                    expense.date.month == day.month &&
                                    expense.date.day == day.day;
                              }).toList(),
                      loading:
                          () => [Center(child: CircularProgressIndicator())],
                      error: (e, __) => [Center(child: Text('Error: $e'))],
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Text('expenses of  $month $day', style: textStyle.bodyLarge),
                ],
              ),
              const SizedBox(height: 10),

              //List of expenses
              (eventOfDay.isEmpty)
                  ? Expanded(
                    child: Center(
                      child: Text('There are no expenses for this day'),
                    ),
                  )
                  : Expanded(
                    child: ListView.builder(
                      itemCount: eventOfDay.length,
                      itemBuilder: (context, index) {
                        final item = eventOfDay[index];

                        return ExpenseTile(expense: item);
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
